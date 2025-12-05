import '../../models/lesson_models.dart';

final day7Lesson2 = LessonData(
  day: 7,
  title: "Call & Put Options",
  emoji: '📞',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Right to Choose',
      imagePath: 'assets/images/lessons/day7/lesson2/story.png',
      imagePrompt: 'cartoon two doors: one labeled CALL with up arrow, one labeled PUT with down arrow, options trading concept',
      content: '''Options give you the right, but not the obligation, to buy or sell.

A CALL option lets you buy at a set price.
A PUT option lets you sell at a set price.

You pay a small fee called a premium for this right!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Call Options',
      imagePath: 'assets/images/lessons/day7/lesson2/content1.png',
      imagePrompt: 'cartoon call option as ticket to buy stock at fixed price, upward arrow showing profit potential',
      content: '''Call options explained simply:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Right to Buy', description: 'Buy an asset at a specific price.'),
        BulletPoint(icon: '🎫', title: 'Premium', description: 'Pay a small fee for this right.'),
        BulletPoint(icon: '⏰', title: 'Expiration', description: 'Options have an end date.'),
        BulletPoint(icon: '💰', title: 'Profit When', description: 'Price goes UP above your strike price.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Put Options',
      imagePath: 'assets/images/lessons/day7/lesson2/content2.png',
      imagePrompt: 'cartoon put option as insurance policy, protecting against price drops with downward arrow',
      content: '''Put options explained simply:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Right to Sell', description: 'Sell an asset at a specific price.'),
        BulletPoint(icon: '🛡️', title: 'Protection', description: 'Like insurance against price drops.'),
        BulletPoint(icon: '💵', title: 'Premium Cost', description: 'You pay for this protection.'),
        BulletPoint(icon: '💰', title: 'Profit When', description: 'Price goes DOWN below your strike price.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Option Type',
      imagePath: 'assets/images/lessons/day7/lesson2/game1.png',
      imagePrompt: 'cartoon call vs put options comparison',
      gameData: GameData(
        type: 'choice',
        instruction: 'A CALL option gives you the right to:',
        options: [GameOption(label: 'Sell at a fixed price', emoji: '📉'), GameOption(label: 'Buy at a fixed price', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Put Purpose',
      imagePath: 'assets/images/lessons/day7/lesson2/game2.png',
      imagePrompt: 'cartoon put option balloon protecting portfolio',
      gameData: GameData(
        type: 'balloon',
        instruction: 'When would you profit from a PUT option?',
        options: [GameOption(label: 'Price goes up', emoji: '📈'), GameOption(label: 'Price goes down', emoji: '📉'), GameOption(label: 'Price stays same', emoji: '➡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day7/lesson2/question.png',
      imagePrompt: 'cartoon option premium payment concept',
      questionData: QuestionData(
        question: 'What is the fee you pay for an option called?',
        options: ['Commission', 'Premium', 'Interest', 'Dividend'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Options Mission',
      imagePath: 'assets/images/lessons/day7/lesson2/mission.png',
      imagePrompt: 'cartoon trader choosing between call and put options',
      missionData: MissionData(
        mission: 'If you think a stock price will RISE, which option helps you profit?',
        options: ['Put option', 'Call option', 'Neither', 'Both equally'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Options Learner', badgeIcon: '📞')),
  ],
);
