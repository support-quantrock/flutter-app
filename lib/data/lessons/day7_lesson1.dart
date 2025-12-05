import '../../models/lesson_models.dart';

final day7Lesson1 = LessonData(
  day: 7,
  title: "What Are Derivatives?",
  emoji: '📄',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Contracts About Contracts',
      imagePath: 'assets/images/lessons/day7/lesson1/story.png',
      imagePrompt: 'cartoon derivative contract paper with underlying asset (stock, gold) shown underneath, financial documents style',
      content: '''Derivatives are special financial contracts.

Their value comes from something else - like stocks, commodities, or currencies.

Think of them as agreements about future prices!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding Derivatives',
      imagePath: 'assets/images/lessons/day7/lesson1/content1.png',
      imagePrompt: 'cartoon derivative diagram showing contract linked to underlying assets like stocks and gold',
      content: '''What exactly are derivatives?''',
      bullets: [
        BulletPoint(icon: '📝', title: 'Contracts', description: 'Agreements between two parties about future transactions.'),
        BulletPoint(icon: '🔗', title: 'Derived Value', description: 'Price depends on an underlying asset.'),
        BulletPoint(icon: '🎯', title: 'Purpose', description: 'Used for hedging risk or speculation.'),
        BulletPoint(icon: '📊', title: 'Examples', description: 'Options, futures, swaps, forwards.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Derivatives Exist',
      imagePath: 'assets/images/lessons/day7/lesson1/content2.png',
      imagePrompt: 'cartoon farmer protecting crops with umbrella labeled "hedge", price protection concept',
      content: '''Derivatives serve important purposes:''',
      bullets: [
        BulletPoint(icon: '🛡️', title: 'Hedging', description: 'Protect against price changes.'),
        BulletPoint(icon: '💰', title: 'Speculation', description: 'Bet on future price movements.'),
        BulletPoint(icon: '⚖️', title: 'Price Discovery', description: 'Help determine fair market prices.'),
        BulletPoint(icon: '🌊', title: 'Liquidity', description: 'Add more trading options to markets.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Derivative Check',
      imagePath: 'assets/images/lessons/day7/lesson1/game1.png',
      imagePrompt: 'cartoon derivative contract with question mark about its value source',
      gameData: GameData(
        type: 'choice',
        instruction: 'A derivative gets its value from:',
        options: [GameOption(label: 'Nothing', emoji: '❌'), GameOption(label: 'An underlying asset', emoji: '🔗')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Purpose Pop',
      imagePath: 'assets/images/lessons/day7/lesson1/game2.png',
      imagePrompt: 'cartoon balloons with different derivative purposes',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Derivatives can be used for:',
        options: [GameOption(label: 'Only gambling', emoji: '🎰'), GameOption(label: 'Protection and speculation', emoji: '🛡️'), GameOption(label: 'Nothing useful', emoji: '❓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day7/lesson1/question.png',
      imagePrompt: 'cartoon various derivative types displayed',
      questionData: QuestionData(
        question: 'Which of these is a type of derivative?',
        options: ['Savings account', 'Options contract', 'Bank loan', 'Credit card'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Derivative Mission',
      imagePath: 'assets/images/lessons/day7/lesson1/mission.png',
      imagePrompt: 'cartoon investor studying derivative contracts with magnifying glass',
      missionData: MissionData(
        mission: 'What makes derivatives unique?',
        options: ['They have no value', 'Their value comes from other assets', 'They are only for banks', 'They never change price'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Derivative Starter', badgeIcon: '📄')),
  ],
);
