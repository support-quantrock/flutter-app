import '../../models/lesson_models.dart';

final day23Lesson4 = LessonData(
  day: 23,
  title: "Real Estate in Your Portfolio",
  emoji: '🥧',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Adding Property to the Mix',
      imagePath: 'assets/images/lessons/day23/lesson4/story.png',
      imagePrompt: 'cartoon portfolio pie chart with real estate slice alongside stocks and bonds',
      content: '''Real estate can diversify your portfolio.

It often moves differently than stocks.

Adding real estate may reduce overall risk!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Diversification Benefits',
      imagePath: 'assets/images/lessons/day23/lesson4/content1.png',
      imagePrompt: 'cartoon real estate providing diversification: different returns than stocks',
      content: '''Why add real estate:''',
      bullets: [
        BulletPoint(icon: '🔀', title: 'Different Returns', description: 'Does not always follow stocks.'),
        BulletPoint(icon: '📈', title: 'Inflation Hedge', description: 'Rents and values often rise with inflation.'),
        BulletPoint(icon: '💵', title: 'Income', description: 'Steady rental income.'),
        BulletPoint(icon: '⚖️', title: 'Balance', description: 'Reduces portfolio volatility.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Much to Allocate',
      imagePath: 'assets/images/lessons/day23/lesson4/content2.png',
      imagePrompt: 'cartoon allocation suggestion: 5-15% real estate in diversified portfolio',
      content: '''Allocation considerations:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Typical Range', description: '5-15% of portfolio for most.'),
        BulletPoint(icon: '🏠', title: 'Home Counts', description: 'Your home is real estate exposure too.'),
        BulletPoint(icon: '⚖️', title: 'Balance', description: 'Do not overweight any single asset.'),
        BulletPoint(icon: '🎯', title: 'Your Goals', description: 'Adjust based on needs.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Diversify Check',
      imagePath: 'assets/images/lessons/day23/lesson4/game1.png',
      imagePrompt: 'cartoon real estate diversification',
      gameData: GameData(
        type: 'choice',
        instruction: 'Real estate helps portfolios because it:',
        options: [GameOption(label: 'Always matches stock returns', emoji: '='), GameOption(label: 'Often moves differently than stocks', emoji: '🔀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Allocation Pop',
      imagePath: 'assets/images/lessons/day23/lesson4/game2.png',
      imagePrompt: 'cartoon typical real estate allocation',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A typical real estate allocation is:',
        options: [GameOption(label: '90% of portfolio', emoji: '📊'), GameOption(label: '5-15% of portfolio', emoji: '📈'), GameOption(label: '0%', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day23/lesson4/question.png',
      imagePrompt: 'cartoon real estate as inflation hedge',
      questionData: QuestionData(
        question: 'Real estate can hedge against inflation because:',
        options: ['It always loses value', 'Rents and property values often rise with inflation', 'It is not affected by prices', 'Inflation does not exist'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Portfolio Mission',
      imagePath: 'assets/images/lessons/day23/lesson4/mission.png',
      imagePrompt: 'cartoon homeowner already having real estate exposure',
      missionData: MissionData(
        mission: 'If you own a home, you should remember:',
        options: ['Buy more real estate immediately', 'You already have real estate exposure', 'Homes do not count', 'Sell your home'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Portfolio Balancer', badgeIcon: '🥧')),
  ],
);
