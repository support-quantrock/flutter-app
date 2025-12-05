import '../../models/lesson_models.dart';

final day27Lesson3 = LessonData(
  day: 27,
  title: "Creating Your Asset Allocation",
  emoji: '🥧',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Personal Mix',
      imagePath: 'assets/images/lessons/day27/lesson3/story.png',
      imagePrompt: 'cartoon portfolio pie chart: stocks, bonds, cash, alternatives mix',
      content: '''Asset allocation is how you divide your investments.

Stocks, bonds, cash, and more.

Your mix should match your goals and risk tolerance!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Building Your Allocation',
      imagePath: 'assets/images/lessons/day27/lesson3/content1.png',
      imagePrompt: 'cartoon building asset allocation based on age and risk',
      content: '''Key allocation decisions:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Stocks vs Bonds', description: 'Growth vs stability balance.'),
        BulletPoint(icon: '🌍', title: 'Domestic vs International', description: 'Geographic diversification.'),
        BulletPoint(icon: '📈', title: 'Large vs Small', description: 'Company size diversification.'),
        BulletPoint(icon: '🎨', title: 'Alternatives', description: 'Real estate, commodities, etc.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Sample Allocations',
      imagePath: 'assets/images/lessons/day27/lesson3/content2.png',
      imagePrompt: 'cartoon sample allocations: young aggressive, middle moderate, older conservative',
      content: '''Example allocations by profile:''',
      bullets: [
        BulletPoint(icon: '🚀', title: 'Aggressive', description: '80-90% stocks, 10-20% bonds.'),
        BulletPoint(icon: '⚖️', title: 'Moderate', description: '60% stocks, 40% bonds.'),
        BulletPoint(icon: '🛡️', title: 'Conservative', description: '30-40% stocks, 60-70% bonds.'),
        BulletPoint(icon: '🔄', title: 'Adjust Over Time', description: 'Shift as you age.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Allocation Check',
      imagePath: 'assets/images/lessons/day27/lesson3/game1.png',
      imagePrompt: 'cartoon aggressive portfolio',
      gameData: GameData(
        type: 'choice',
        instruction: 'An aggressive portfolio typically has:',
        options: [GameOption(label: 'Mostly bonds', emoji: '📄'), GameOption(label: 'High percentage in stocks', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Age Pop',
      imagePath: 'assets/images/lessons/day27/lesson3/game2.png',
      imagePrompt: 'cartoon allocation changing with age',
      gameData: GameData(
        type: 'balloon',
        instruction: 'As you get older, many people:',
        options: [GameOption(label: 'Take more risk', emoji: '🚀'), GameOption(label: 'Shift to more conservative allocations', emoji: '🛡️'), GameOption(label: 'Never change anything', emoji: '🔒')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day27/lesson3/question.png',
      imagePrompt: 'cartoon personalized asset allocation',
      questionData: QuestionData(
        question: 'Your asset allocation should be based on:',
        options: ['Only what is trendy', 'Your goals, timeline, and risk tolerance', 'Random selection', 'What worked for others'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Allocation Mission',
      imagePath: 'assets/images/lessons/day27/lesson3/mission.png',
      imagePrompt: 'cartoon creating personal allocation',
      missionData: MissionData(
        mission: 'A good asset allocation:',
        options: ['Is the same for everyone', 'Is personalized to your situation', 'Never needs to change', 'Should be 100% in one asset'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Allocator', badgeIcon: '🥧')),
  ],
);
