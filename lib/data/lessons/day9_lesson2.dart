import '../../models/lesson_models.dart';

final day9Lesson2 = LessonData(
  day: 9,
  title: "DeFi Explained",
  emoji: '🏦',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Banking Without Banks',
      imagePath: 'assets/images/lessons/day9/lesson2/story.png',
      imagePrompt: 'cartoon DeFi replacing traditional bank with smart contracts and code, decentralized finance',
      content: '''DeFi means Decentralized Finance.

It recreates banking services using blockchain.

Lending, borrowing, trading - all without banks!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What is DeFi',
      imagePath: 'assets/images/lessons/day9/lesson2/content1.png',
      imagePrompt: 'cartoon DeFi services: lending pool, exchange, yield farming, all connected by blockchain',
      content: '''DeFi financial services:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'Lending', description: 'Lend crypto and earn interest.'),
        BulletPoint(icon: '🏧', title: 'Borrowing', description: 'Borrow against your crypto.'),
        BulletPoint(icon: '🔄', title: 'Trading', description: 'Swap tokens on decentralized exchanges.'),
        BulletPoint(icon: '🌾', title: 'Yield Farming', description: 'Earn rewards for providing liquidity.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'DeFi Benefits',
      imagePath: 'assets/images/lessons/day9/lesson2/content2.png',
      imagePrompt: 'cartoon DeFi advantages: 24/7 access, global, permissionless, transparent code',
      content: '''Why DeFi is revolutionary:''',
      bullets: [
        BulletPoint(icon: '🌍', title: 'Global Access', description: 'Anyone with internet can use it.'),
        BulletPoint(icon: '🕐', title: '24/7', description: 'Never closes, works any time.'),
        BulletPoint(icon: '👀', title: 'Transparent', description: 'Code is open for anyone to verify.'),
        BulletPoint(icon: '🔓', title: 'No Permission', description: 'No credit checks or applications.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'DeFi Check',
      imagePath: 'assets/images/lessons/day9/lesson2/game1.png',
      imagePrompt: 'cartoon DeFi vs traditional banking',
      gameData: GameData(
        type: 'choice',
        instruction: 'DeFi provides banking services using:',
        options: [GameOption(label: 'Traditional banks', emoji: '🏦'), GameOption(label: 'Blockchain and smart contracts', emoji: '⛓️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Service Pop',
      imagePath: 'assets/images/lessons/day9/lesson2/game2.png',
      imagePrompt: 'cartoon DeFi services as balloons',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What can you do in DeFi?',
        options: [GameOption(label: 'Only buy Bitcoin', emoji: '₿'), GameOption(label: 'Lend, borrow, and trade', emoji: '💰'), GameOption(label: 'Only store photos', emoji: '📷')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day9/lesson2/question.png',
      imagePrompt: 'cartoon DeFi 24/7 availability',
      questionData: QuestionData(
        question: 'When is DeFi available?',
        options: ['Only weekdays', 'Bank hours only', '24/7 always', 'Once a week'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'DeFi Mission',
      imagePath: 'assets/images/lessons/day9/lesson2/mission.png',
      imagePrompt: 'cartoon global access to DeFi services',
      missionData: MissionData(
        mission: 'What makes DeFi accessible globally?',
        options: ['Physical branches everywhere', 'Only needs internet connection', 'Requires bank account', 'Mail-in applications'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'DeFi Pioneer', badgeIcon: '🏦')),
  ],
);
