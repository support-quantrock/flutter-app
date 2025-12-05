import '../../models/lesson_models.dart';

final day24Lesson4 = LessonData(
  day: 24,
  title: "Collectibles & Tangible Assets",
  emoji: '🖼️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Investing in Things You Can Touch',
      imagePath: 'assets/images/lessons/day24/lesson4/story.png',
      imagePrompt: 'cartoon collectible investments: fine art, vintage wine, rare coins, classic cars, watches',
      content: '''Some people invest in physical collectibles.

Art, wine, coins, and cars can appreciate in value.

But they require expertise and careful storage!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Collectibles',
      imagePath: 'assets/images/lessons/day24/lesson4/content1.png',
      imagePrompt: 'cartoon collectible categories: art, wine, stamps, coins, sports memorabilia',
      content: '''Popular collectible investments:''',
      bullets: [
        BulletPoint(icon: '🖼️', title: 'Fine Art', description: 'Paintings and sculptures.'),
        BulletPoint(icon: '🍷', title: 'Fine Wine', description: 'Rare vintage bottles.'),
        BulletPoint(icon: '🪙', title: 'Rare Coins', description: 'Numismatic collectibles.'),
        BulletPoint(icon: '🚗', title: 'Classic Cars', description: 'Vintage automobiles.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Considerations',
      imagePath: 'assets/images/lessons/day24/lesson4/content2.png',
      imagePrompt: 'cartoon collectible investment challenges: storage, authentication, insurance, expertise',
      content: '''Important factors:''',
      bullets: [
        BulletPoint(icon: '🔍', title: 'Authentication', description: 'Verify items are genuine.'),
        BulletPoint(icon: '🏦', title: 'Storage', description: 'Proper care and security.'),
        BulletPoint(icon: '🛡️', title: 'Insurance', description: 'Protection against damage or theft.'),
        BulletPoint(icon: '📊', title: 'Illiquid', description: 'Can take time to sell.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Check',
      imagePath: 'assets/images/lessons/day24/lesson4/game1.png',
      imagePrompt: 'cartoon fine art investment',
      gameData: GameData(
        type: 'choice',
        instruction: 'Collectibles like art are considered:',
        options: [GameOption(label: 'Traditional investments', emoji: '📊'), GameOption(label: 'Alternative investments', emoji: '🎨')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Challenge Pop',
      imagePath: 'assets/images/lessons/day24/lesson4/game2.png',
      imagePrompt: 'cartoon authenticating collectibles',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Before buying collectibles, you should:',
        options: [GameOption(label: 'Buy without research', emoji: '🤷'), GameOption(label: 'Verify authenticity', emoji: '🔍'), GameOption(label: 'Ignore condition', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day24/lesson4/question.png',
      imagePrompt: 'cartoon collectible storage',
      questionData: QuestionData(
        question: 'Collectibles require special attention to:',
        options: ['Nothing special', 'Storage, insurance, and authentication', 'Only the purchase price', 'Daily trading'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Collectible Mission',
      imagePath: 'assets/images/lessons/day24/lesson4/mission.png',
      imagePrompt: 'cartoon selling collectibles',
      missionData: MissionData(
        mission: 'Collectibles are typically:',
        options: ['Very easy to sell quickly', 'Illiquid and may take time to sell', 'Traded on stock exchanges', 'Guaranteed to increase'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Collector', badgeIcon: '🖼️')),
  ],
);
