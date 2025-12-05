import '../../models/lesson_models.dart';

final day24Lesson1 = LessonData(
  day: 24,
  title: "What Are Alternative Investments?",
  emoji: '🎨',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Beyond Stocks and Bonds',
      imagePath: 'assets/images/lessons/day24/lesson1/story.png',
      imagePrompt: 'cartoon alternative investments: art, gold, wine, real estate, hedge funds, collectibles',
      content: '''Alternative investments go beyond traditional stocks and bonds.

They include commodities, art, hedge funds, and more.

They can add diversification to your portfolio!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Makes Them Alternative',
      imagePath: 'assets/images/lessons/day24/lesson1/content1.png',
      imagePrompt: 'cartoon comparison: traditional investments vs alternative investments',
      content: '''Key characteristics:''',
      bullets: [
        BulletPoint(icon: '🔀', title: 'Different Returns', description: 'Often uncorrelated with stocks.'),
        BulletPoint(icon: '🔒', title: 'Less Liquid', description: 'Harder to buy and sell quickly.'),
        BulletPoint(icon: '💰', title: 'Higher Minimums', description: 'Often need more capital.'),
        BulletPoint(icon: '📊', title: 'Complex', description: 'May require expertise.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Alternatives',
      imagePath: 'assets/images/lessons/day24/lesson1/content2.png',
      imagePrompt: 'cartoon types of alternative investments: commodities, private equity, hedge funds, collectibles',
      content: '''Main categories:''',
      bullets: [
        BulletPoint(icon: '🥇', title: 'Commodities', description: 'Gold, oil, agricultural products.'),
        BulletPoint(icon: '🏢', title: 'Private Equity', description: 'Investing in private companies.'),
        BulletPoint(icon: '📈', title: 'Hedge Funds', description: 'Actively managed investment pools.'),
        BulletPoint(icon: '🎨', title: 'Collectibles', description: 'Art, wine, rare items.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Category Check',
      imagePath: 'assets/images/lessons/day24/lesson1/game1.png',
      imagePrompt: 'cartoon gold bar as alternative investment',
      gameData: GameData(
        type: 'choice',
        instruction: 'Gold is considered:',
        options: [GameOption(label: 'A traditional stock investment', emoji: '📊'), GameOption(label: 'An alternative investment', emoji: '🥇')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Feature Pop',
      imagePath: 'assets/images/lessons/day24/lesson1/game2.png',
      imagePrompt: 'cartoon alternative investment liquidity',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Alternative investments are typically:',
        options: [GameOption(label: 'Very liquid', emoji: '💧'), GameOption(label: 'Less liquid than stocks', emoji: '🔒'), GameOption(label: 'Exactly like bonds', emoji: '📄')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day24/lesson1/question.png',
      imagePrompt: 'cartoon diversification with alternatives',
      questionData: QuestionData(
        question: 'Alternative investments can help portfolios by:',
        options: ['Guaranteeing profits', 'Adding diversification', 'Eliminating all risk', 'Replacing all stocks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Alt Mission',
      imagePath: 'assets/images/lessons/day24/lesson1/mission.png',
      imagePrompt: 'cartoon understanding alternative investments',
      missionData: MissionData(
        mission: 'Before investing in alternatives, you should understand:',
        options: ['Nothing special needed', 'Their unique risks and liquidity features', 'They are all the same', 'They are risk-free'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Alt Explorer', badgeIcon: '🎨')),
  ],
);
