import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_progress.dart';

class QPService {
  static final QPService _instance = QPService._internal();
  factory QPService() => _instance;
  QPService._internal();

  static const String _storageKey = 'user_progress';

  UserProgress? _userProgress;

  // Get current user progress
  UserProgress get progress => _userProgress ?? UserProgress();

  // Initialize service - call this on app start
  Future<void> init() async {
    await _loadProgress();
  }

  // Load progress from storage
  Future<void> _loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_storageKey);

      if (jsonString != null) {
        _userProgress = UserProgress.fromJsonString(jsonString);
      } else {
        _userProgress = UserProgress();
      }
    } catch (e) {
      _userProgress = UserProgress();
    }
  }

  // Save progress to storage
  Future<void> _saveProgress() async {
    if (_userProgress == null) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_storageKey, _userProgress!.toJsonString());
    } catch (e) {
      // Handle save error silently
    }
  }

  // Award QP for completing a lesson
  Future<LessonReward> awardLessonQP({
    required int day,
    required int lesson,
    required int baseQP,
    int correctAnswers = 0,
    int totalQuestions = 0,
    int timeBonusSeconds = 0,
  }) async {
    if (_userProgress == null) await _loadProgress();

    // Calculate bonus QP
    int bonusQP = 0;

    // Accuracy bonus (up to 50% extra)
    if (totalQuestions > 0) {
      final accuracy = correctAnswers / totalQuestions;
      bonusQP += (baseQP * 0.5 * accuracy).round();
    }

    // Speed bonus (up to 25% extra for fast completion)
    if (timeBonusSeconds > 0 && timeBonusSeconds < 60) {
      bonusQP += (baseQP * 0.25 * (1 - timeBonusSeconds / 60)).round();
    }

    // Streak bonus (10% per day streak, max 50%)
    final streakBonus = (_userProgress!.currentStreak * 0.1).clamp(0.0, 0.5);
    bonusQP += (baseQP * streakBonus).round();

    final totalQP = baseQP + bonusQP;

    // Add QP and update progress
    final levelsGained = _userProgress!.addQP(totalQP);
    _userProgress!.completeLesson(day, lesson);

    await _saveProgress();

    return LessonReward(
      baseQP: baseQP,
      bonusQP: bonusQP,
      totalQP: totalQP,
      newTotalQP: _userProgress!.totalQP,
      levelsGained: levelsGained,
      newLevel: _userProgress!.currentLevel,
      newLevelTitle: _userProgress!.levelTitle,
      newStreak: _userProgress!.currentStreak,
      didLevelUp: levelsGained > 0,
    );
  }

  // Get current QP
  int get totalQP => _userProgress?.totalQP ?? 0;

  // Get current level
  int get currentLevel => _userProgress?.currentLevel ?? 1;

  // Get level title
  String get levelTitle => _userProgress?.levelTitle ?? 'Novice';

  // Get level emoji
  String get levelEmoji => _userProgress?.levelEmoji ?? '🌱';

  // Get progress to next level (0.0 - 1.0)
  double get progressToNextLevel => _userProgress?.progressToNextLevel ?? 0.0;

  // Get QP remaining to next level
  int get qpRemainingToNextLevel => _userProgress?.qpRemainingToNextLevel ?? 100;

  // Get current streak
  int get currentStreak => _userProgress?.currentStreak ?? 0;

  // Get best streak
  int get bestStreak => _userProgress?.bestStreak ?? 0;

  // Get lessons completed count
  int get lessonsCompleted => _userProgress?.lessonsCompleted ?? 0;

  // Check if specific lesson is completed
  bool isLessonCompleted(int day, int lesson) {
    return _userProgress?.isLessonCompleted(day, lesson) ?? false;
  }

  // Reset all progress (for testing)
  Future<void> resetProgress() async {
    _userProgress = UserProgress();
    await _saveProgress();
  }
}

// Result class for lesson completion
class LessonReward {
  final int baseQP;
  final int bonusQP;
  final int totalQP;
  final int newTotalQP;
  final int levelsGained;
  final int newLevel;
  final String newLevelTitle;
  final int newStreak;
  final bool didLevelUp;

  LessonReward({
    required this.baseQP,
    required this.bonusQP,
    required this.totalQP,
    required this.newTotalQP,
    required this.levelsGained,
    required this.newLevel,
    required this.newLevelTitle,
    required this.newStreak,
    required this.didLevelUp,
  });
}
