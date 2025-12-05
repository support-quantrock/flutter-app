import 'dart:convert';

class UserProgress {
  int totalQP;
  int currentLevel;
  String levelTitle;
  int lessonsCompleted;
  int currentStreak;
  int bestStreak;
  Map<String, bool> completedLessons; // "day-lesson" -> completed
  DateTime? lastLessonDate;

  UserProgress({
    this.totalQP = 0,
    this.currentLevel = 1,
    this.levelTitle = 'Novice',
    this.lessonsCompleted = 0,
    this.currentStreak = 0,
    this.bestStreak = 0,
    Map<String, bool>? completedLessons,
    this.lastLessonDate,
  }) : completedLessons = completedLessons ?? {};

  // Level thresholds
  static const List<Map<String, dynamic>> levelData = [
    {'level': 1, 'title': 'Novice', 'qpRequired': 0, 'emoji': '🌱'},
    {'level': 2, 'title': 'Beginner', 'qpRequired': 100, 'emoji': '🌿'},
    {'level': 3, 'title': 'Learner', 'qpRequired': 250, 'emoji': '🌳'},
    {'level': 4, 'title': 'Intermediate', 'qpRequired': 500, 'emoji': '⭐'},
    {'level': 5, 'title': 'Advanced', 'qpRequired': 1000, 'emoji': '🌟'},
    {'level': 6, 'title': 'Expert', 'qpRequired': 2000, 'emoji': '💫'},
    {'level': 7, 'title': 'Master', 'qpRequired': 5000, 'emoji': '👑'},
    {'level': 8, 'title': 'Legend', 'qpRequired': 10000, 'emoji': '🏆'},
  ];

  // Calculate level from QP
  void updateLevel() {
    for (int i = levelData.length - 1; i >= 0; i--) {
      if (totalQP >= levelData[i]['qpRequired']) {
        currentLevel = levelData[i]['level'];
        levelTitle = levelData[i]['title'];
        break;
      }
    }
  }

  // Get current level emoji
  String get levelEmoji {
    final data = levelData.firstWhere(
      (l) => l['level'] == currentLevel,
      orElse: () => levelData[0],
    );
    return data['emoji'] as String;
  }

  // Get QP needed for next level
  int get qpForNextLevel {
    if (currentLevel >= levelData.length) return 0;
    return levelData[currentLevel]['qpRequired'] as int;
  }

  // Get QP progress to next level (0.0 - 1.0)
  double get progressToNextLevel {
    if (currentLevel >= levelData.length) return 1.0;

    final currentLevelQP = levelData[currentLevel - 1]['qpRequired'] as int;
    final nextLevelQP = levelData[currentLevel]['qpRequired'] as int;
    final qpInCurrentLevel = totalQP - currentLevelQP;
    final qpNeeded = nextLevelQP - currentLevelQP;

    return (qpInCurrentLevel / qpNeeded).clamp(0.0, 1.0);
  }

  // Get QP remaining to next level
  int get qpRemainingToNextLevel {
    if (currentLevel >= levelData.length) return 0;
    return qpForNextLevel - totalQP;
  }

  // Add QP and update level
  int addQP(int amount) {
    final previousLevel = currentLevel;
    totalQP += amount;
    updateLevel();
    return currentLevel - previousLevel; // Returns levels gained
  }

  // Mark lesson as completed
  void completeLesson(int day, int lesson) {
    final key = '$day-$lesson';
    if (!completedLessons.containsKey(key)) {
      completedLessons[key] = true;
      lessonsCompleted++;

      // Update streak
      final now = DateTime.now();
      if (lastLessonDate != null) {
        final daysDiff = now.difference(lastLessonDate!).inDays;
        if (daysDiff <= 1) {
          currentStreak++;
        } else {
          currentStreak = 1;
        }
      } else {
        currentStreak = 1;
      }

      if (currentStreak > bestStreak) {
        bestStreak = currentStreak;
      }

      lastLessonDate = now;
    }
  }

  // Check if lesson is completed
  bool isLessonCompleted(int day, int lesson) {
    return completedLessons['$day-$lesson'] == true;
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'totalQP': totalQP,
      'currentLevel': currentLevel,
      'levelTitle': levelTitle,
      'lessonsCompleted': lessonsCompleted,
      'currentStreak': currentStreak,
      'bestStreak': bestStreak,
      'completedLessons': completedLessons,
      'lastLessonDate': lastLessonDate?.toIso8601String(),
    };
  }

  // Deserialize from JSON
  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      totalQP: json['totalQP'] ?? 0,
      currentLevel: json['currentLevel'] ?? 1,
      levelTitle: json['levelTitle'] ?? 'Novice',
      lessonsCompleted: json['lessonsCompleted'] ?? 0,
      currentStreak: json['currentStreak'] ?? 0,
      bestStreak: json['bestStreak'] ?? 0,
      completedLessons: Map<String, bool>.from(json['completedLessons'] ?? {}),
      lastLessonDate: json['lastLessonDate'] != null
          ? DateTime.parse(json['lastLessonDate'])
          : null,
    );
  }

  // Convert to/from string for storage
  String toJsonString() => jsonEncode(toJson());

  factory UserProgress.fromJsonString(String jsonString) {
    return UserProgress.fromJson(jsonDecode(jsonString));
  }
}
