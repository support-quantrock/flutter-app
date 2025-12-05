import '../../models/lesson_models.dart';

final day14Lesson5 = LessonData(
  day: 14,
  title: "Employment & Other Indicators",
  emoji: '👥',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Jobs and Markets',
      imagePath: 'assets/images/lessons/day14/lesson5/story.png',
      imagePrompt: 'cartoon employment report day with traders watching jobs data closely',
      content: '''Employment data is closely watched by investors.

More jobs = stronger economy = more spending.

Job reports can move markets significantly!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Employment Indicators',
      imagePath: 'assets/images/lessons/day14/lesson5/content1.png',
      imagePrompt: 'cartoon employment metrics: unemployment rate, job creation, wage growth charts',
      content: '''Key employment measures:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Unemployment Rate', description: 'Percentage without jobs.'),
        BulletPoint(icon: '➕', title: 'Jobs Added', description: 'New jobs created each month.'),
        BulletPoint(icon: '💵', title: 'Wage Growth', description: 'How fast pay is rising.'),
        BulletPoint(icon: '📅', title: 'Jobs Report', description: 'First Friday each month (USA).'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Other Key Indicators',
      imagePath: 'assets/images/lessons/day14/lesson5/content2.png',
      imagePrompt: 'cartoon economic calendar with various indicator releases',
      content: '''More economic indicators:''',
      bullets: [
        BulletPoint(icon: '🏭', title: 'Manufacturing', description: 'Factory activity and orders.'),
        BulletPoint(icon: '🏠', title: 'Housing', description: 'Home sales and building permits.'),
        BulletPoint(icon: '😊', title: 'Consumer Confidence', description: 'How optimistic people feel.'),
        BulletPoint(icon: '🛒', title: 'Retail Sales', description: 'How much people are spending.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Jobs Check',
      imagePath: 'assets/images/lessons/day14/lesson5/game1.png',
      imagePrompt: 'cartoon strong employment report effect',
      gameData: GameData(
        type: 'choice',
        instruction: 'Strong employment data usually indicates:',
        options: [GameOption(label: 'Weak economy', emoji: '📉'), GameOption(label: 'Strong economy', emoji: '💪')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Indicator Pop',
      imagePath: 'assets/images/lessons/day14/lesson5/game2.png',
      imagePrompt: 'cartoon consumer confidence concept',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Consumer confidence measures:',
        options: [GameOption(label: 'Stock prices', emoji: '📈'), GameOption(label: 'How optimistic people feel about economy', emoji: '😊'), GameOption(label: 'Gold prices', emoji: '🪙')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day14/lesson5/question.png',
      imagePrompt: 'cartoon jobs report release',
      questionData: QuestionData(
        question: 'In the USA, when is the jobs report released?',
        options: ['Every day', 'First Friday of each month', 'Once a year', 'Randomly'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Indicators Mission',
      imagePath: 'assets/images/lessons/day14/lesson5/mission.png',
      imagePrompt: 'cartoon retail sales importance',
      missionData: MissionData(
        mission: 'Why do investors watch retail sales data?',
        options: ['Just curious', 'Shows how much consumers are spending', 'It does not matter', 'Only retailers care'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Data Watcher', badgeIcon: '👥')),
  ],
);
