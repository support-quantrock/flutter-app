import '../../models/lesson_models.dart';

final day14Lesson2 = LessonData(
  day: 14,
  title: "GDP Explained",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Measuring the Economy',
      imagePath: 'assets/images/lessons/day14/lesson2/story.png',
      imagePrompt: 'cartoon GDP as giant calculator adding up all goods and services in a country',
      content: '''GDP stands for Gross Domestic Product.

It measures the total value of everything produced in a country.

Think of it as the economy's report card!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding GDP',
      imagePath: 'assets/images/lessons/day14/lesson2/content1.png',
      imagePrompt: 'cartoon GDP components: consumer spending, business investment, government, exports',
      content: '''What makes up GDP:''',
      bullets: [
        BulletPoint(icon: '🛒', title: 'Consumer Spending', description: 'What people buy - biggest part.'),
        BulletPoint(icon: '🏢', title: 'Business Investment', description: 'Companies buying equipment.'),
        BulletPoint(icon: '🏛️', title: 'Government', description: 'Public spending on services.'),
        BulletPoint(icon: '📦', title: 'Net Exports', description: 'Exports minus imports.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'GDP Growth',
      imagePath: 'assets/images/lessons/day14/lesson2/content2.png',
      imagePrompt: 'cartoon GDP growth rate: positive growth happy economy, negative growth struggling economy',
      content: '''What GDP growth tells us:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Positive Growth', description: 'Economy expanding - good sign.'),
        BulletPoint(icon: '📉', title: 'Negative Growth', description: 'Economy shrinking - concern.'),
        BulletPoint(icon: '⚠️', title: 'Two Negatives', description: 'Two quarters negative = recession.'),
        BulletPoint(icon: '🎯', title: 'Target', description: '2-3% growth is healthy.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'GDP Check',
      imagePath: 'assets/images/lessons/day14/lesson2/game1.png',
      imagePrompt: 'cartoon GDP meaning',
      gameData: GameData(
        type: 'choice',
        instruction: 'GDP measures:',
        options: [GameOption(label: 'Only stock prices', emoji: '📈'), GameOption(label: 'Total value produced in a country', emoji: '🌍')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Growth Pop',
      imagePath: 'assets/images/lessons/day14/lesson2/game2.png',
      imagePrompt: 'cartoon GDP growth rate',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Positive GDP growth means:',
        options: [GameOption(label: 'Economy is shrinking', emoji: '📉'), GameOption(label: 'Economy is expanding', emoji: '📈'), GameOption(label: 'No change', emoji: '➡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day14/lesson2/question.png',
      imagePrompt: 'cartoon recession definition with GDP',
      questionData: QuestionData(
        question: 'A recession is often defined as:',
        options: ['One quarter of slow growth', 'Two consecutive quarters of negative GDP', 'Stock market drop', 'High inflation'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'GDP Mission',
      imagePath: 'assets/images/lessons/day14/lesson2/mission.png',
      imagePrompt: 'cartoon consumer spending importance',
      missionData: MissionData(
        mission: 'What is the biggest component of GDP?',
        options: ['Government spending', 'Exports', 'Consumer spending', 'Business investment'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'GDP Expert', badgeIcon: '📊')),
  ],
);
