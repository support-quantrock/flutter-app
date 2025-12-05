import '../../models/lesson_models.dart';

final day28Lesson4 = LessonData(
  day: 28,
  title: "Building Good Habits",
  emoji: '🌱',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Habits for Success',
      imagePath: 'assets/images/lessons/day28/lesson4/story.png',
      imagePrompt: 'cartoon building good investment habits: regular saving, learning, reviewing',
      content: '''Good habits lead to investing success.

Build routines that support your goals.

Small consistent actions compound over time!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Daily & Weekly Habits',
      imagePath: 'assets/images/lessons/day28/lesson4/content1.png',
      imagePrompt: 'cartoon daily weekly investment habits: save regularly, avoid checking too often',
      content: '''Helpful regular habits:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'Save Regularly', description: 'Automate your savings.'),
        BulletPoint(icon: '📚', title: 'Keep Learning', description: 'Read about investing.'),
        BulletPoint(icon: '🧘', title: 'Stay Calm', description: 'Do not obsess over daily prices.'),
        BulletPoint(icon: '📝', title: 'Track Progress', description: 'Review goals periodically.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Monthly & Yearly Habits',
      imagePath: 'assets/images/lessons/day28/lesson4/content2.png',
      imagePrompt: 'cartoon periodic investment habits: monthly review, yearly rebalance, tax planning',
      content: '''Periodic reviews:''',
      bullets: [
        BulletPoint(icon: '📅', title: 'Monthly Check', description: 'Quick portfolio review.'),
        BulletPoint(icon: '⚖️', title: 'Annual Rebalance', description: 'Adjust allocation yearly.'),
        BulletPoint(icon: '📋', title: 'Tax Planning', description: 'Review tax implications.'),
        BulletPoint(icon: '🎯', title: 'Goal Check', description: 'Are you on track?'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Habit Check',
      imagePath: 'assets/images/lessons/day28/lesson4/game1.png',
      imagePrompt: 'cartoon automatic savings habit',
      gameData: GameData(
        type: 'choice',
        instruction: 'Automating savings helps you:',
        options: [GameOption(label: 'Spend more', emoji: '💸'), GameOption(label: 'Save consistently without effort', emoji: '🤖')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Routine Pop',
      imagePath: 'assets/images/lessons/day28/lesson4/game2.png',
      imagePrompt: 'cartoon checking portfolio too often',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Checking your portfolio every hour:',
        options: [GameOption(label: 'Is good practice', emoji: '✅'), GameOption(label: 'Can increase stress and bad decisions', emoji: '😰'), GameOption(label: 'Is required', emoji: '📜')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day28/lesson4/question.png',
      imagePrompt: 'cartoon annual portfolio rebalancing',
      questionData: QuestionData(
        question: 'How often should most investors rebalance?',
        options: ['Every day', 'Annually or when allocation drifts significantly', 'Never', 'Every hour'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Habit Mission',
      imagePath: 'assets/images/lessons/day28/lesson4/mission.png',
      imagePrompt: 'cartoon building sustainable investment habits',
      missionData: MissionData(
        mission: 'Good investment habits include:',
        options: ['Obsessing over daily prices', 'Consistent saving and periodic reviews', 'Trading on every news item', 'Never reviewing your portfolio'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Habit Builder', badgeIcon: '🌱')),
  ],
);
