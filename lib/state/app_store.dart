import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_state.dart';

/// Main App Store - Singleton stream-based state management
class AppStore {
  static final AppStore _instance = AppStore._internal();
  factory AppStore() => _instance;
  AppStore._internal();

  // ==================== BEHAVIOR SUBJECTS ====================
  // BehaviorSubject retains the latest value and emits it to new subscribers

  final _userProgressSubject = BehaviorSubject<UserProgressState>.seeded(
    const UserProgressState(),
  );

  final _navigationSubject = BehaviorSubject<NavigationState>.seeded(
    const NavigationState(),
  );

  final _challengeSubject = BehaviorSubject<ChallengeState>.seeded(
    const ChallengeState(),
  );

  final _questionnaireSubject = BehaviorSubject<QuestionnaireState>.seeded(
    const QuestionnaireState(),
  );

  final _loadingSubject = BehaviorSubject<LoadingState>.seeded(
    const LoadingState(),
  );

  final _errorSubject = BehaviorSubject<ErrorState>.seeded(
    const ErrorState(),
  );

  // Combined app state stream
  late final Stream<AppState> _appStateStream;

  // ==================== STREAMS (Read-only access) ====================

  Stream<UserProgressState> get userProgressStream => _userProgressSubject.stream;
  Stream<NavigationState> get navigationStream => _navigationSubject.stream;
  Stream<ChallengeState> get challengeStream => _challengeSubject.stream;
  Stream<QuestionnaireState> get questionnaireStream => _questionnaireSubject.stream;
  Stream<LoadingState> get loadingStream => _loadingSubject.stream;
  Stream<ErrorState> get errorStream => _errorSubject.stream;
  Stream<AppState> get appStateStream => _appStateStream;

  // ==================== CURRENT VALUES ====================

  UserProgressState get userProgress => _userProgressSubject.value;
  NavigationState get navigation => _navigationSubject.value;
  ChallengeState get challenge => _challengeSubject.value;
  QuestionnaireState get questionnaire => _questionnaireSubject.value;
  LoadingState get loading => _loadingSubject.value;
  ErrorState get error => _errorSubject.value;

  // ==================== INITIALIZATION ====================

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    // Combine all streams into a single app state stream
    _appStateStream = Rx.combineLatest6(
      _userProgressSubject,
      _navigationSubject,
      _challengeSubject,
      _questionnaireSubject,
      _loadingSubject,
      _errorSubject,
      (userProgress, navigation, challenge, questionnaire, loading, error) {
        return AppState(
          userProgress: userProgress,
          navigation: navigation,
          challenge: challenge,
          questionnaire: questionnaire,
          loading: loading,
          error: error,
        );
      },
    ).shareReplay(maxSize: 1);

    // Load persisted state
    await _loadPersistedState();

    _initialized = true;
  }

  Future<void> _loadPersistedState() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load user progress
      final totalQP = prefs.getInt('totalQP') ?? 0;
      final currentLevel = prefs.getInt('currentLevel') ?? 1;
      final currentStreak = prefs.getInt('currentStreak') ?? 0;
      final bestStreak = prefs.getInt('bestStreak') ?? 0;
      final lessonsCompleted = prefs.getInt('lessonsCompleted') ?? 0;
      final completedLessonsJson = prefs.getStringList('completedLessons') ?? [];

      _userProgressSubject.add(UserProgressState(
        totalQP: totalQP,
        currentLevel: currentLevel,
        levelTitle: _getLevelTitle(currentLevel),
        levelEmoji: _getLevelEmoji(currentLevel),
        progressToNextLevel: _calculateProgress(totalQP, currentLevel),
        qpRemainingToNextLevel: _calculateQPRemaining(totalQP, currentLevel),
        currentStreak: currentStreak,
        bestStreak: bestStreak,
        lessonsCompleted: lessonsCompleted,
        completedLessons: completedLessonsJson.toSet(),
      ));

      // Load questionnaire state
      final questionnaireCompleted = prefs.getBool('questionnaireCompleted') ?? false;
      if (questionnaireCompleted) {
        _questionnaireSubject.add(const QuestionnaireState(isCompleted: true));
      }
    } catch (e) {
      // Fail silently, use defaults
    }
  }

  // ==================== USER PROGRESS ACTIONS ====================

  void updateUserProgress(UserProgressState Function(UserProgressState) update) {
    final newState = update(_userProgressSubject.value);
    _userProgressSubject.add(newState);
    _persistUserProgress(newState);
  }

  Future<void> addQP(int amount) async {
    final current = _userProgressSubject.value;
    final newTotalQP = current.totalQP + amount;
    final newLevel = _calculateLevel(newTotalQP);

    final newState = current.copyWith(
      totalQP: newTotalQP,
      currentLevel: newLevel,
      levelTitle: _getLevelTitle(newLevel),
      levelEmoji: _getLevelEmoji(newLevel),
      progressToNextLevel: _calculateProgress(newTotalQP, newLevel),
      qpRemainingToNextLevel: _calculateQPRemaining(newTotalQP, newLevel),
    );

    _userProgressSubject.add(newState);
    await _persistUserProgress(newState);
  }

  Future<void> completeLesson(int day, int lesson) async {
    final current = _userProgressSubject.value;
    final lessonKey = '$day:$lesson';

    if (current.completedLessons.contains(lessonKey)) return;

    final newCompletedLessons = Set<String>.from(current.completedLessons)..add(lessonKey);
    final newState = current.copyWith(
      completedLessons: newCompletedLessons,
      lessonsCompleted: current.lessonsCompleted + 1,
    );

    _userProgressSubject.add(newState);
    await _persistUserProgress(newState);
  }

  Future<void> updateStreak(int streak) async {
    final current = _userProgressSubject.value;
    final newState = current.copyWith(
      currentStreak: streak,
      bestStreak: streak > current.bestStreak ? streak : current.bestStreak,
    );

    _userProgressSubject.add(newState);
    await _persistUserProgress(newState);
  }

  Future<void> _persistUserProgress(UserProgressState state) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('totalQP', state.totalQP);
      await prefs.setInt('currentLevel', state.currentLevel);
      await prefs.setInt('currentStreak', state.currentStreak);
      await prefs.setInt('bestStreak', state.bestStreak);
      await prefs.setInt('lessonsCompleted', state.lessonsCompleted);
      await prefs.setStringList('completedLessons', state.completedLessons.toList());
    } catch (e) {
      // Fail silently
    }
  }

  // ==================== NAVIGATION ACTIONS ====================

  void setCurrentTab(int index) {
    _navigationSubject.add(_navigationSubject.value.copyWith(
      currentTabIndex: index,
    ));
  }

  void navigateTo(String route, {Map<String, dynamic>? arguments}) {
    _navigationSubject.add(_navigationSubject.value.copyWith(
      currentRoute: route,
      routeArguments: arguments,
    ));
  }

  // ==================== CHALLENGE ACTIONS ====================

  void updateChallenge(ChallengeState Function(ChallengeState) update) {
    _challengeSubject.add(update(_challengeSubject.value));
  }

  void setChallengeTab(String tab) {
    _challengeSubject.add(_challengeSubject.value.copyWith(activeTab: tab));
  }

  void setChallengeViewMode(String mode) {
    _challengeSubject.add(_challengeSubject.value.copyWith(challengeViewMode: mode));
  }

  void setCurrentDay(int day) {
    _challengeSubject.add(_challengeSubject.value.copyWith(currentDay: day));
  }

  void toggleLessonExpanded(int day) {
    final current = _challengeSubject.value;
    final newExpanded = Set<int>.from(current.expandedLessons);
    if (newExpanded.contains(day)) {
      newExpanded.remove(day);
    } else {
      newExpanded.add(day);
    }
    _challengeSubject.add(current.copyWith(expandedLessons: newExpanded));
  }

  void setSponsorTab(String tab) {
    _challengeSubject.add(_challengeSubject.value.copyWith(
      activeSponsorTab: tab,
      activeSponsorIndex: 0,
    ));
  }

  void setSponsorIndex(int index) {
    _challengeSubject.add(_challengeSubject.value.copyWith(activeSponsorIndex: index));
  }

  void setChampionshipIndex(int index) {
    _challengeSubject.add(_challengeSubject.value.copyWith(activeChampionshipIndex: index));
  }

  // ==================== QUESTIONNAIRE ACTIONS ====================

  void updateQuestionnaire(QuestionnaireState Function(QuestionnaireState) update) {
    _questionnaireSubject.add(update(_questionnaireSubject.value));
  }

  void setQuestionnaireAnswer(String key, dynamic value) {
    final current = _questionnaireSubject.value;
    final newAnswers = Map<String, dynamic>.from(current.answers);
    newAnswers[key] = value;
    _questionnaireSubject.add(current.copyWith(answers: newAnswers));
  }

  void nextQuestion({int xpEarned = 0}) {
    final current = _questionnaireSubject.value;
    final newQuestion = current.currentQuestion + 1;
    final newXP = current.totalXP + xpEarned;

    // Check for milestones
    List<int> newMilestones = List.from(current.milestonesReached);
    for (final milestone in [5, 10, 15, 20]) {
      if (newQuestion >= milestone && !newMilestones.contains(milestone)) {
        newMilestones.add(milestone);
      }
    }

    _questionnaireSubject.add(current.copyWith(
      currentQuestion: newQuestion,
      totalXP: newXP,
      currentLevel: (newXP ~/ 100) + 1,
      milestonesReached: newMilestones,
      isCompleted: newQuestion >= current.totalQuestions,
    ));
  }

  void previousQuestion() {
    final current = _questionnaireSubject.value;
    if (current.currentQuestion > 0) {
      _questionnaireSubject.add(current.copyWith(
        currentQuestion: current.currentQuestion - 1,
      ));
    }
  }

  Future<void> completeQuestionnaire() async {
    _questionnaireSubject.add(_questionnaireSubject.value.copyWith(isCompleted: true));
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('questionnaireCompleted', true);
    } catch (e) {
      // Fail silently
    }
  }

  void resetQuestionnaire() {
    _questionnaireSubject.add(const QuestionnaireState());
  }

  // ==================== LOADING ACTIONS ====================

  void setLoading(bool isLoading, {String? message, double? progress}) {
    _loadingSubject.add(LoadingState(
      isLoading: isLoading,
      loadingMessage: message,
      progress: progress,
    ));
  }

  void updateLoadingProgress(double progress) {
    _loadingSubject.add(_loadingSubject.value.copyWith(progress: progress));
  }

  // ==================== ERROR ACTIONS ====================

  void setError(String message, {String? code}) {
    _errorSubject.add(ErrorState.error(message, code: code));
  }

  void clearError() {
    _errorSubject.add(const ErrorState());
  }

  // ==================== HELPER METHODS ====================

  int _calculateLevel(int totalQP) {
    if (totalQP < 100) return 1;
    if (totalQP < 300) return 2;
    if (totalQP < 600) return 3;
    if (totalQP < 1000) return 4;
    if (totalQP < 1500) return 5;
    if (totalQP < 2100) return 6;
    if (totalQP < 2800) return 7;
    if (totalQP < 3600) return 8;
    if (totalQP < 4500) return 9;
    return 10;
  }

  String _getLevelTitle(int level) {
    const titles = [
      'Novice',
      'Beginner',
      'Learner',
      'Explorer',
      'Trader',
      'Investor',
      'Expert',
      'Master',
      'Champion',
      'Legend',
    ];
    return titles[(level - 1).clamp(0, 9)];
  }

  String _getLevelEmoji(int level) {
    const emojis = ['🌱', '🌿', '🌳', '⭐', '💫', '🔥', '💎', '👑', '🏆', '🎖️'];
    return emojis[(level - 1).clamp(0, 9)];
  }

  double _calculateProgress(int totalQP, int level) {
    final thresholds = [0, 100, 300, 600, 1000, 1500, 2100, 2800, 3600, 4500, 10000];
    if (level >= 10) return 1.0;
    final currentThreshold = thresholds[level - 1];
    final nextThreshold = thresholds[level];
    final range = nextThreshold - currentThreshold;
    final progress = totalQP - currentThreshold;
    return (progress / range).clamp(0.0, 1.0);
  }

  int _calculateQPRemaining(int totalQP, int level) {
    final thresholds = [0, 100, 300, 600, 1000, 1500, 2100, 2800, 3600, 4500, 10000];
    if (level >= 10) return 0;
    return thresholds[level] - totalQP;
  }

  // ==================== RESET ====================

  Future<void> resetAll() async {
    _userProgressSubject.add(const UserProgressState());
    _navigationSubject.add(const NavigationState());
    _challengeSubject.add(const ChallengeState());
    _questionnaireSubject.add(const QuestionnaireState());
    _loadingSubject.add(const LoadingState());
    _errorSubject.add(const ErrorState());

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      // Fail silently
    }
  }

  // ==================== DISPOSE ====================

  void dispose() {
    _userProgressSubject.close();
    _navigationSubject.close();
    _challengeSubject.close();
    _questionnaireSubject.close();
    _loadingSubject.close();
    _errorSubject.close();
  }
}

// Global instance for easy access
final appStore = AppStore();
