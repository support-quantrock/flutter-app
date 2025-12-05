import '../../models/lesson_models.dart';

final day24Lesson2 = LessonData(
  day: 24,
  title: "Commodities Investing",
  emoji: '🥇',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Investing in Physical Goods',
      imagePath: 'assets/images/lessons/day24/lesson2/story.png',
      imagePrompt: 'cartoon commodities: gold bars, oil barrels, wheat, coffee beans, copper',
      content: '''Commodities are raw materials and natural resources.

Gold, oil, wheat, and coffee are all commodities.

They can protect against inflation and add diversification!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Commodities',
      imagePath: 'assets/images/lessons/day24/lesson2/content1.png',
      imagePrompt: 'cartoon commodity categories: precious metals, energy, agriculture, industrial',
      content: '''Main commodity categories:''',
      bullets: [
        BulletPoint(icon: '🥇', title: 'Precious Metals', description: 'Gold, silver, platinum.'),
        BulletPoint(icon: '⛽', title: 'Energy', description: 'Oil, natural gas, coal.'),
        BulletPoint(icon: '🌾', title: 'Agriculture', description: 'Wheat, corn, coffee, sugar.'),
        BulletPoint(icon: '🔩', title: 'Industrial Metals', description: 'Copper, aluminum, zinc.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Ways to Invest',
      imagePath: 'assets/images/lessons/day24/lesson2/content2.png',
      imagePrompt: 'cartoon ways to invest in commodities: ETFs, futures, physical gold, mining stocks',
      content: '''How to access commodities:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'ETFs', description: 'Easiest way to invest.'),
        BulletPoint(icon: '📜', title: 'Futures', description: 'Contracts for future delivery.'),
        BulletPoint(icon: '🥇', title: 'Physical', description: 'Own actual gold or silver.'),
        BulletPoint(icon: '⛏️', title: 'Mining Stocks', description: 'Companies that produce commodities.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Category Check',
      imagePath: 'assets/images/lessons/day24/lesson2/game1.png',
      imagePrompt: 'cartoon oil as energy commodity',
      gameData: GameData(
        type: 'choice',
        instruction: 'Oil belongs to which commodity category?',
        options: [GameOption(label: 'Precious metals', emoji: '🥇'), GameOption(label: 'Energy', emoji: '⛽')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Access Pop',
      imagePath: 'assets/images/lessons/day24/lesson2/game2.png',
      imagePrompt: 'cartoon commodity ETF investing',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The easiest way for beginners to invest in commodities is:',
        options: [GameOption(label: 'Buying futures contracts', emoji: '📜'), GameOption(label: 'Commodity ETFs', emoji: '📊'), GameOption(label: 'Building oil refineries', emoji: '🏭')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day24/lesson2/question.png',
      imagePrompt: 'cartoon gold as inflation hedge',
      questionData: QuestionData(
        question: 'Gold is often used as:',
        options: ['A growth stock', 'An inflation hedge', 'A guaranteed return', 'A bond substitute'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Commodity Mission',
      imagePath: 'assets/images/lessons/day24/lesson2/mission.png',
      imagePrompt: 'cartoon understanding commodity risks',
      missionData: MissionData(
        mission: 'Commodity prices are affected by:',
        options: ['Nothing at all', 'Supply and demand factors', 'Only stock market performance', 'Government guarantees'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Commodity Pro', badgeIcon: '🥇')),
  ],
);
