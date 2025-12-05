import '../../models/lesson_models.dart';

final day18Lesson5 = LessonData(
  day: 18,
  title: "How to Invest Globally",
  emoji: '🌐',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Practical Global Investing',
      imagePath: 'assets/images/lessons/day18/lesson5/story.png',
      imagePrompt: 'cartoon easy ways to invest globally: international ETFs, ADRs, global funds',
      content: '''Investing globally is easier than ever!

You do not need foreign accounts.

Simple funds can give you worldwide exposure.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Ways to Invest Globally',
      imagePath: 'assets/images/lessons/day18/lesson5/content1.png',
      imagePrompt: 'cartoon global investment vehicles: international ETFs, ADRs, mutual funds',
      content: '''Easy global investment options:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'International ETFs', description: 'Low-cost global exposure.'),
        BulletPoint(icon: '🏷️', title: 'ADRs', description: 'Foreign stocks on US exchanges.'),
        BulletPoint(icon: '🌍', title: 'Global Funds', description: 'Managed international portfolios.'),
        BulletPoint(icon: '🎯', title: 'Total World', description: 'One fund for everything.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Building Global Portfolio',
      imagePath: 'assets/images/lessons/day18/lesson5/content2.png',
      imagePrompt: 'cartoon sample global allocation: US stocks, developed international, emerging markets',
      content: '''Sample global allocation:''',
      bullets: [
        BulletPoint(icon: '🇺🇸', title: 'US Stocks', description: '50-60% for US investors.'),
        BulletPoint(icon: '🌍', title: 'Developed Intl', description: '20-30% Europe, Japan, etc.'),
        BulletPoint(icon: '🌱', title: 'Emerging', description: '10-20% for growth exposure.'),
        BulletPoint(icon: '⚖️', title: 'Adjust', description: 'Based on risk tolerance.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Vehicle Check',
      imagePath: 'assets/images/lessons/day18/lesson5/game1.png',
      imagePrompt: 'cartoon international ETF simplicity',
      gameData: GameData(
        type: 'choice',
        instruction: 'The easiest way to invest globally is:',
        options: [GameOption(label: 'Open accounts in every country', emoji: '✈️'), GameOption(label: 'International ETFs', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'ADR Pop',
      imagePath: 'assets/images/lessons/day18/lesson5/game2.png',
      imagePrompt: 'cartoon ADR explanation',
      gameData: GameData(
        type: 'balloon',
        instruction: 'ADRs allow you to:',
        options: [GameOption(label: 'Only buy US stocks', emoji: '🇺🇸'), GameOption(label: 'Buy foreign stocks on US exchanges', emoji: '🌍'), GameOption(label: 'Avoid all foreign exposure', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day18/lesson5/question.png',
      imagePrompt: 'cartoon total world fund',
      questionData: QuestionData(
        question: 'A "total world" fund contains:',
        options: ['Only US stocks', 'Stocks from around the world', 'Only bonds', 'Only cash'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Global Mission',
      imagePath: 'assets/images/lessons/day18/lesson5/mission.png',
      imagePrompt: 'cartoon simple global portfolio',
      missionData: MissionData(
        mission: 'For simple global exposure, you could use:',
        options: ['Dozens of individual stocks', 'One or two international ETFs', 'Only local stocks', 'Currency trading'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Global Investor', badgeIcon: '🌐')),
  ],
);
