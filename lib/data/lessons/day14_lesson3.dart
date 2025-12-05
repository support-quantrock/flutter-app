import '../../models/lesson_models.dart';

final day14Lesson3 = LessonData(
  day: 14,
  title: "Understanding Inflation",
  emoji: '💸',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Rising Prices',
      imagePath: 'assets/images/lessons/day14/lesson3/story.png',
      imagePrompt: 'cartoon balloon of prices inflating over time, money buying less',
      content: '''Inflation means prices are rising over time.

Your money buys less than it used to.

Understanding inflation helps protect your wealth!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Inflation Works',
      imagePath: 'assets/images/lessons/day14/lesson3/content1.png',
      imagePrompt: 'cartoon same dollar buying less groceries over years, purchasing power decline',
      content: '''Inflation effects:''',
      bullets: [
        BulletPoint(icon: '💵', title: 'Purchasing Power', description: 'Your money buys less over time.'),
        BulletPoint(icon: '🎯', title: 'Target Rate', description: 'Central banks aim for 2% inflation.'),
        BulletPoint(icon: '📏', title: 'CPI', description: 'Consumer Price Index measures inflation.'),
        BulletPoint(icon: '⚠️', title: 'High Inflation', description: 'Bad for savers and fixed income.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Inflation and Investing',
      imagePath: 'assets/images/lessons/day14/lesson3/content2.png',
      imagePrompt: 'cartoon investments that beat inflation: stocks, real estate, vs losing in savings',
      content: '''How to protect against inflation:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Stocks', description: 'Companies can raise prices.'),
        BulletPoint(icon: '🏠', title: 'Real Estate', description: 'Property values tend to rise.'),
        BulletPoint(icon: '🪙', title: 'Commodities', description: 'Gold and commodities hedge inflation.'),
        BulletPoint(icon: '💰', title: 'TIPS', description: 'Treasury Inflation-Protected Securities.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Inflation Check',
      imagePath: 'assets/images/lessons/day14/lesson3/game1.png',
      imagePrompt: 'cartoon inflation effect on money',
      gameData: GameData(
        type: 'choice',
        instruction: 'Inflation means:',
        options: [GameOption(label: 'Prices are falling', emoji: '📉'), GameOption(label: 'Prices are rising', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Protection Pop',
      imagePath: 'assets/images/lessons/day14/lesson3/game2.png',
      imagePrompt: 'cartoon inflation hedges',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which can help protect against inflation?',
        options: [GameOption(label: 'Cash under mattress', emoji: '💵'), GameOption(label: 'Stocks and real estate', emoji: '📈'), GameOption(label: 'Ignore it', emoji: '🙈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day14/lesson3/question.png',
      imagePrompt: 'cartoon central bank inflation target',
      questionData: QuestionData(
        question: 'What inflation rate do central banks typically target?',
        options: ['0%', '2%', '10%', '50%'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Inflation Mission',
      imagePath: 'assets/images/lessons/day14/lesson3/mission.png',
      imagePrompt: 'cartoon saver losing to inflation',
      missionData: MissionData(
        mission: 'Why is high inflation bad for savers?',
        options: ['It is not bad', 'Savings lose purchasing power', 'Savings increase in value', 'Banks give more interest'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Inflation Aware', badgeIcon: '💸')),
  ],
);
