import '../../models/lesson_models.dart';

final day13Lesson5 = LessonData(
  day: 13,
  title: "Other Valuation Metrics",
  emoji: '📐',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Beyond P/E',
      imagePath: 'assets/images/lessons/day13/lesson5/story.png',
      imagePrompt: 'cartoon various valuation metrics tools: P/B, P/S, dividend yield, PEG ratio',
      content: '''P/E is not the only valuation metric.

Different metrics work better for different companies.

Having multiple tools makes you a better analyst!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Price to Book (P/B)',
      imagePath: 'assets/images/lessons/day13/lesson5/content1.png',
      imagePrompt: 'cartoon P/B ratio comparing market price to book value of assets',
      content: '''Price to Book ratio:''',
      bullets: [
        BulletPoint(icon: '📖', title: 'Formula', description: 'Price ÷ Book Value per Share.'),
        BulletPoint(icon: '🏠', title: 'Book Value', description: 'Assets minus liabilities.'),
        BulletPoint(icon: '🏦', title: 'Good For', description: 'Banks and asset-heavy companies.'),
        BulletPoint(icon: '📉', title: 'Below 1', description: 'Might mean undervalued.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Other Key Ratios',
      imagePath: 'assets/images/lessons/day13/lesson5/content2.png',
      imagePrompt: 'cartoon P/S ratio, dividend yield, and PEG ratio visualization',
      content: '''More useful metrics:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'P/S Ratio', description: 'Price to Sales - for unprofitable companies.'),
        BulletPoint(icon: '💸', title: 'Dividend Yield', description: 'Annual dividends ÷ Stock price.'),
        BulletPoint(icon: '📊', title: 'PEG Ratio', description: 'P/E ÷ Growth rate - adjusts for growth.'),
        BulletPoint(icon: '🔄', title: 'ROE', description: 'Return on Equity - profitability measure.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Metric Check',
      imagePath: 'assets/images/lessons/day13/lesson5/game1.png',
      imagePrompt: 'cartoon P/B ratio purpose',
      gameData: GameData(
        type: 'choice',
        instruction: 'P/B ratio compares price to:',
        options: [GameOption(label: 'Earnings', emoji: '💰'), GameOption(label: 'Book value (assets minus liabilities)', emoji: '📖')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Ratio Pop',
      imagePath: 'assets/images/lessons/day13/lesson5/game2.png',
      imagePrompt: 'cartoon dividend yield concept',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Dividend yield shows:',
        options: [GameOption(label: 'Stock price only', emoji: '💹'), GameOption(label: 'Annual dividends as % of price', emoji: '💸'), GameOption(label: 'Company age', emoji: '📅')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day13/lesson5/question.png',
      imagePrompt: 'cartoon P/S ratio for unprofitable companies',
      questionData: QuestionData(
        question: 'For unprofitable companies, which ratio is useful?',
        options: ['P/E (cannot calculate without earnings)', 'P/S (Price to Sales)', 'Dividend yield', 'None'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Metrics Mission',
      imagePath: 'assets/images/lessons/day13/lesson5/mission.png',
      imagePrompt: 'cartoon using multiple valuation metrics',
      missionData: MissionData(
        mission: 'Why use multiple valuation metrics?',
        options: ['One metric is perfect', 'Different metrics reveal different aspects', 'They all show the same thing', 'Metrics are useless'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Valuation Pro', badgeIcon: '📐')),
  ],
);
