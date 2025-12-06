/// App State Models for Stream-based State Management
library;

/// User Progress State
class UserProgressState {
  final int totalQP;
  final int currentLevel;
  final String levelTitle;
  final String levelEmoji;
  final double progressToNextLevel;
  final int qpRemainingToNextLevel;
  final int currentStreak;
  final int bestStreak;
  final int lessonsCompleted;
  final Set<String> completedLessons;

  const UserProgressState({
    this.totalQP = 0,
    this.currentLevel = 1,
    this.levelTitle = 'Novice',
    this.levelEmoji = '🌱',
    this.progressToNextLevel = 0.0,
    this.qpRemainingToNextLevel = 100,
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.lessonsCompleted = 0,
    this.completedLessons = const {},
  });

  UserProgressState copyWith({
    int? totalQP,
    int? currentLevel,
    String? levelTitle,
    String? levelEmoji,
    double? progressToNextLevel,
    int? qpRemainingToNextLevel,
    int? currentStreak,
    int? bestStreak,
    int? lessonsCompleted,
    Set<String>? completedLessons,
  }) {
    return UserProgressState(
      totalQP: totalQP ?? this.totalQP,
      currentLevel: currentLevel ?? this.currentLevel,
      levelTitle: levelTitle ?? this.levelTitle,
      levelEmoji: levelEmoji ?? this.levelEmoji,
      progressToNextLevel: progressToNextLevel ?? this.progressToNextLevel,
      qpRemainingToNextLevel: qpRemainingToNextLevel ?? this.qpRemainingToNextLevel,
      currentStreak: currentStreak ?? this.currentStreak,
      bestStreak: bestStreak ?? this.bestStreak,
      lessonsCompleted: lessonsCompleted ?? this.lessonsCompleted,
      completedLessons: completedLessons ?? this.completedLessons,
    );
  }

  bool isLessonCompleted(int day, int lesson) {
    return completedLessons.contains('$day:$lesson');
  }
}

/// Navigation State
class NavigationState {
  final int currentTabIndex;
  final String? currentRoute;
  final Map<String, dynamic>? routeArguments;

  const NavigationState({
    this.currentTabIndex = 4, // Portfolio is default
    this.currentRoute,
    this.routeArguments,
  });

  NavigationState copyWith({
    int? currentTabIndex,
    String? currentRoute,
    Map<String, dynamic>? routeArguments,
  }) {
    return NavigationState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      currentRoute: currentRoute ?? this.currentRoute,
      routeArguments: routeArguments ?? this.routeArguments,
    );
  }
}

/// Challenge State
class ChallengeState {
  final String activeTab;
  final String challengeViewMode;
  final int currentDay;
  final int totalDays;
  final Set<int> expandedLessons;
  final bool isExpanded;

  // Sponsors state
  final String activeSponsorTab;
  final int activeSponsorIndex;
  final int activeChampionshipIndex;

  const ChallengeState({
    this.activeTab = 'training',
    this.challengeViewMode = 'global',
    this.currentDay = 28,
    this.totalDays = 28,
    this.expandedLessons = const {},
    this.isExpanded = false,
    this.activeSponsorTab = 'banking',
    this.activeSponsorIndex = 0,
    this.activeChampionshipIndex = 0,
  });

  ChallengeState copyWith({
    String? activeTab,
    String? challengeViewMode,
    int? currentDay,
    int? totalDays,
    Set<int>? expandedLessons,
    bool? isExpanded,
    String? activeSponsorTab,
    int? activeSponsorIndex,
    int? activeChampionshipIndex,
  }) {
    return ChallengeState(
      activeTab: activeTab ?? this.activeTab,
      challengeViewMode: challengeViewMode ?? this.challengeViewMode,
      currentDay: currentDay ?? this.currentDay,
      totalDays: totalDays ?? this.totalDays,
      expandedLessons: expandedLessons ?? this.expandedLessons,
      isExpanded: isExpanded ?? this.isExpanded,
      activeSponsorTab: activeSponsorTab ?? this.activeSponsorTab,
      activeSponsorIndex: activeSponsorIndex ?? this.activeSponsorIndex,
      activeChampionshipIndex: activeChampionshipIndex ?? this.activeChampionshipIndex,
    );
  }
}

/// Questionnaire State
class QuestionnaireState {
  final int currentQuestion;
  final int totalQuestions;
  final int totalXP;
  final int currentLevel;
  final Map<String, dynamic> answers;
  final bool isCompleted;
  final List<int> milestonesReached;

  const QuestionnaireState({
    this.currentQuestion = 0,
    this.totalQuestions = 20,
    this.totalXP = 0,
    this.currentLevel = 1,
    this.answers = const {},
    this.isCompleted = false,
    this.milestonesReached = const [],
  });

  QuestionnaireState copyWith({
    int? currentQuestion,
    int? totalQuestions,
    int? totalXP,
    int? currentLevel,
    Map<String, dynamic>? answers,
    bool? isCompleted,
    List<int>? milestonesReached,
  }) {
    return QuestionnaireState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      totalXP: totalXP ?? this.totalXP,
      currentLevel: currentLevel ?? this.currentLevel,
      answers: answers ?? this.answers,
      isCompleted: isCompleted ?? this.isCompleted,
      milestonesReached: milestonesReached ?? this.milestonesReached,
    );
  }

  double get progress => totalQuestions > 0 ? currentQuestion / totalQuestions : 0.0;
}

/// Loading State
class LoadingState {
  final bool isLoading;
  final String? loadingMessage;
  final double? progress;

  const LoadingState({
    this.isLoading = false,
    this.loadingMessage,
    this.progress,
  });

  LoadingState copyWith({
    bool? isLoading,
    String? loadingMessage,
    double? progress,
  }) {
    return LoadingState(
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      progress: progress ?? this.progress,
    );
  }
}

/// Error State
class ErrorState {
  final bool hasError;
  final String? errorMessage;
  final String? errorCode;
  final DateTime? timestamp;

  const ErrorState({
    this.hasError = false,
    this.errorMessage,
    this.errorCode,
    this.timestamp,
  });

  ErrorState copyWith({
    bool? hasError,
    String? errorMessage,
    String? errorCode,
    DateTime? timestamp,
  }) {
    return ErrorState(
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      errorCode: errorCode ?? this.errorCode,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  static ErrorState error(String message, {String? code}) {
    return ErrorState(
      hasError: true,
      errorMessage: message,
      errorCode: code,
      timestamp: DateTime.now(),
    );
  }

  static const ErrorState none = ErrorState();
}

/// Combined App State
class AppState {
  final UserProgressState userProgress;
  final NavigationState navigation;
  final ChallengeState challenge;
  final QuestionnaireState questionnaire;
  final LoadingState loading;
  final ErrorState error;

  const AppState({
    this.userProgress = const UserProgressState(),
    this.navigation = const NavigationState(),
    this.challenge = const ChallengeState(),
    this.questionnaire = const QuestionnaireState(),
    this.loading = const LoadingState(),
    this.error = const ErrorState(),
  });

  AppState copyWith({
    UserProgressState? userProgress,
    NavigationState? navigation,
    ChallengeState? challenge,
    QuestionnaireState? questionnaire,
    LoadingState? loading,
    ErrorState? error,
  }) {
    return AppState(
      userProgress: userProgress ?? this.userProgress,
      navigation: navigation ?? this.navigation,
      challenge: challenge ?? this.challenge,
      questionnaire: questionnaire ?? this.questionnaire,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
