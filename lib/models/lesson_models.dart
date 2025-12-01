enum ScreenType { story, content, game, question, mission, reward }

class LessonData {
  final int day;
  final String title;
  final String emoji;
  final List<LessonScreen> screens;

  const LessonData({
    required this.day,
    required this.title,
    required this.emoji,
    required this.screens,
  });
}

class LessonScreen {
  final ScreenType type;
  final String? title;
  final String? content;
  final String? imagePrompt;
  final String? imagePath;
  final List<BulletPoint>? bullets;
  final GameData? gameData;
  final QuestionData? questionData;
  final MissionData? missionData;
  final RewardData? rewardData;

  const LessonScreen({
    required this.type,
    this.title,
    this.content,
    this.imagePrompt,
    this.imagePath,
    this.bullets,
    this.gameData,
    this.questionData,
    this.missionData,
    this.rewardData,
  });
}

class BulletPoint {
  final String icon;
  final String title;
  final String? description;

  const BulletPoint({
    required this.icon,
    required this.title,
    this.description,
  });
}

class GameOption {
  final String label;
  final String emoji;

  const GameOption({
    required this.label,
    required this.emoji,
  });
}

class GameData {
  final String type;
  final String instruction;
  final List<GameOption> options;
  final int correctIndex;

  const GameData({
    required this.type,
    required this.instruction,
    required this.options,
    required this.correctIndex,
  });
}

class QuestionData {
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuestionData({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

class MissionData {
  final String mission;
  final List<String> options;
  final int correctIndex;

  const MissionData({
    required this.mission,
    required this.options,
    required this.correctIndex,
  });
}

class RewardData {
  final int coins;
  final String? badgeName;
  final String? badgeIcon;

  const RewardData({
    required this.coins,
    this.badgeName,
    this.badgeIcon,
  });
}
