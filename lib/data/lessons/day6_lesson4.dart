import '../../models/lesson_models.dart';

final day6Lesson4 = LessonData(
  day: 6,
  title: "Forex Trading Basics",
  emoji: '📱',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Trading Terms',
      imagePath: 'assets/images/lessons/day6/lesson4/story.png',
      imagePrompt: 'cartoon forex trading screen with pips, lots, and leverage indicators highlighted',
      content: '''Forex has its own language: pips, lots, leverage, spread.

These terms might seem confusing at first.

Let me translate them into simple English!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Key Terms',
      imagePath: 'assets/images/lessons/day6/lesson4/content1.png',
      imagePrompt: 'cartoon dictionary of forex terms with simple illustrations for each',
      content: '''Essential forex vocabulary:''',
      bullets: [
        BulletPoint(icon: '📍', title: 'Pip', description: 'Smallest price move (0.0001 for most pairs).'),
        BulletPoint(icon: '📦', title: 'Lot', description: 'Trade size. Standard lot = 100,000 units.'),
        BulletPoint(icon: '↔️', title: 'Spread', description: 'Difference between buy and sell price.'),
        BulletPoint(icon: '⚡', title: 'Leverage', description: 'Borrowed money to trade bigger positions.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Leverage Explained',
      imagePath: 'assets/images/lessons/day6/lesson4/content2.png',
      imagePrompt: 'cartoon small money being magnified by leverage tool, showing both bigger gains and bigger losses',
      content: '''Leverage is powerful but dangerous:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Amplifies Gains', description: '10x leverage = 10x potential profit.'),
        BulletPoint(icon: '📉', title: 'Amplifies Losses', description: '10x leverage = 10x potential loss too!'),
        BulletPoint(icon: '⚠️', title: 'Risk Warning', description: 'Most retail forex traders lose money.'),
        BulletPoint(icon: '🎓', title: 'Learn First', description: 'Practice with demo accounts before real money.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Term Test',
      imagePath: 'assets/images/lessons/day6/lesson4/game1.png',
      imagePrompt: 'cartoon pip measurement on currency chart',
      gameData: GameData(
        type: 'choice',
        instruction: 'What is a "pip" in forex?',
        options: [GameOption(label: 'A type of currency', emoji: '💵'), GameOption(label: 'The smallest price movement', emoji: '📍')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Leverage Alert',
      imagePath: 'assets/images/lessons/day6/lesson4/game2.png',
      imagePrompt: 'cartoon leverage double-edged sword visualization',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What does leverage do?',
        options: [GameOption(label: 'Eliminates all risk', emoji: '🛡️'), GameOption(label: 'Amplifies both gains AND losses', emoji: '⚡'), GameOption(label: 'Only increases profits', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day6/lesson4/question.png',
      imagePrompt: 'cartoon spread visualization between buy and sell prices',
      questionData: QuestionData(
        question: 'What is the "spread" in forex?',
        options: ['A type of butter', 'The difference between buy and sell price', 'Your profit', 'A trading strategy'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Trading Mission',
      imagePath: 'assets/images/lessons/day6/lesson4/mission.png',
      imagePrompt: 'cartoon beginner at forex demo account, practicing safely',
      missionData: MissionData(
        mission: 'Before trading forex with real money, you should:',
        options: ['Jump right in with leverage', 'Practice on a demo account first', 'Follow random tips online', 'Use maximum leverage'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Forex Learner', badgeIcon: '📱')),
  ],
);
