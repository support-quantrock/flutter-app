import '../../models/lesson_models.dart';

final day13Lesson1 = LessonData(
  day: 13,
  title: "What is Fundamental Analysis?",
  emoji: '📄',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Finding True Value',
      imagePath: 'assets/images/lessons/day13/lesson1/story.png',
      imagePrompt: 'cartoon detective examining company financial reports, looking for real value',
      content: '''Fundamental analysis studies a company's real value.

It looks at financials, earnings, and business quality.

The goal: find stocks that are worth more than their price!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What to Analyze',
      imagePath: 'assets/images/lessons/day13/lesson1/content1.png',
      imagePrompt: 'cartoon fundamental analysis components: financial statements, earnings, industry, management',
      content: '''Key areas of fundamental analysis:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Financials', description: 'Revenue, profit, debt levels.'),
        BulletPoint(icon: '💰', title: 'Earnings', description: 'How much money the company makes.'),
        BulletPoint(icon: '🏭', title: 'Industry', description: 'Competitive position and trends.'),
        BulletPoint(icon: '👔', title: 'Management', description: 'Quality of leadership.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Value vs Price',
      imagePath: 'assets/images/lessons/day13/lesson1/content2.png',
      imagePrompt: 'cartoon value scale: intrinsic value vs market price, finding undervalued stocks',
      content: '''The key distinction:''',
      bullets: [
        BulletPoint(icon: '💎', title: 'Intrinsic Value', description: 'What a company is really worth.'),
        BulletPoint(icon: '🏷️', title: 'Market Price', description: 'What the stock currently sells for.'),
        BulletPoint(icon: '🛒', title: 'Undervalued', description: 'Price below value = buying opportunity.'),
        BulletPoint(icon: '⚠️', title: 'Overvalued', description: 'Price above value = be cautious.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Analysis Check',
      imagePath: 'assets/images/lessons/day13/lesson1/game1.png',
      imagePrompt: 'cartoon fundamental vs technical analysis',
      gameData: GameData(
        type: 'choice',
        instruction: 'Fundamental analysis focuses on:',
        options: [GameOption(label: 'Chart patterns', emoji: '📊'), GameOption(label: 'Company value and financials', emoji: '📄')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Value Pop',
      imagePath: 'assets/images/lessons/day13/lesson1/game2.png',
      imagePrompt: 'cartoon undervalued stock concept',
      gameData: GameData(
        type: 'balloon',
        instruction: 'An undervalued stock is when:',
        options: [GameOption(label: 'Price is above value', emoji: '📈'), GameOption(label: 'Price is below true value', emoji: '💎'), GameOption(label: 'Price equals value', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day13/lesson1/question.png',
      imagePrompt: 'cartoon fundamental analyst goal',
      questionData: QuestionData(
        question: 'The goal of fundamental analysis is to:',
        options: ['Predict daily moves', 'Find stocks worth more than their price', 'Trade fast', 'Ignore value'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Fundamental Mission',
      imagePath: 'assets/images/lessons/day13/lesson1/mission.png',
      imagePrompt: 'cartoon investor comparing value to price',
      missionData: MissionData(
        mission: 'What is "intrinsic value"?',
        options: ['The current stock price', 'What a company is really worth', 'Random number', 'Yesterday\'s price'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Value Seeker', badgeIcon: '📄')),
  ],
);
