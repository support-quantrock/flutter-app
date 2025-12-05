import '../../models/lesson_models.dart';

final day13Lesson3 = LessonData(
  day: 13,
  title: "Earnings Per Share (EPS)",
  emoji: '💵',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Profit Per Share',
      imagePath: 'assets/images/lessons/day13/lesson3/story.png',
      imagePrompt: 'cartoon total earnings pie being divided equally among stock share certificates',
      content: '''EPS shows how much profit each share of stock earned.

It is calculated by dividing total profit by number of shares.

Growing EPS usually means a healthy, growing company!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding EPS',
      imagePath: 'assets/images/lessons/day13/lesson3/content1.png',
      imagePrompt: 'cartoon EPS calculation: net income divided by shares outstanding, with example',
      content: '''How EPS works:''',
      bullets: [
        BulletPoint(icon: '➗', title: 'Formula', description: 'Net Income ÷ Shares Outstanding.'),
        BulletPoint(icon: '🔢', title: 'Example', description: '\$1M profit ÷ 100K shares = \$10 EPS.'),
        BulletPoint(icon: '📈', title: 'Growth', description: 'Rising EPS = growing profits.'),
        BulletPoint(icon: '📅', title: 'Quarterly', description: 'Companies report EPS each quarter.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'EPS Importance',
      imagePath: 'assets/images/lessons/day13/lesson3/content2.png',
      imagePrompt: 'cartoon EPS as foundation of valuation metrics, earnings reports moving stock prices',
      content: '''Why EPS matters:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Used in P/E', description: 'EPS is denominator in P/E ratio.'),
        BulletPoint(icon: '📰', title: 'Earnings Reports', description: 'EPS beats or misses move stocks.'),
        BulletPoint(icon: '🔮', title: 'Forecasts', description: 'Analysts predict future EPS.'),
        BulletPoint(icon: '📈', title: 'Trend', description: 'Look at EPS growth over years.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'EPS Check',
      imagePath: 'assets/images/lessons/day13/lesson3/game1.png',
      imagePrompt: 'cartoon EPS meaning',
      gameData: GameData(
        type: 'choice',
        instruction: 'EPS shows:',
        options: [GameOption(label: 'Total company revenue', emoji: '💰'), GameOption(label: 'Profit per share of stock', emoji: '💵')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Growth Pop',
      imagePath: 'assets/images/lessons/day13/lesson3/game2.png',
      imagePrompt: 'cartoon rising EPS chart',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Rising EPS over time usually indicates:',
        options: [GameOption(label: 'Company is struggling', emoji: '😰'), GameOption(label: 'Growing profits', emoji: '📈'), GameOption(label: 'Nothing', emoji: '❓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day13/lesson3/question.png',
      imagePrompt: 'cartoon earnings report impact',
      questionData: QuestionData(
        question: 'When a company beats EPS estimates, its stock usually:',
        options: ['Falls', 'Rises', 'No change', 'Gets delisted'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'EPS Mission',
      imagePath: 'assets/images/lessons/day13/lesson3/mission.png',
      imagePrompt: 'cartoon EPS in valuation metrics',
      missionData: MissionData(
        mission: 'Where is EPS used in other calculations?',
        options: ['Nowhere', 'As the denominator in P/E ratio', 'Only in crypto', 'For taxes only'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'EPS Expert', badgeIcon: '💵')),
  ],
);
