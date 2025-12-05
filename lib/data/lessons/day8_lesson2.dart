import '../../models/lesson_models.dart';

final day8Lesson2 = LessonData(
  day: 8,
  title: "Blockchain Technology",
  emoji: '⛓️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Chain of Blocks',
      imagePath: 'assets/images/lessons/day8/lesson2/story.png',
      imagePrompt: 'cartoon blockchain as connected blocks in a chain, each block containing transaction data',
      content: '''Blockchain is the technology behind cryptocurrency.

Imagine a shared notebook that everyone can see but nobody can erase.

Every transaction is recorded in blocks, linked together forever!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Blockchain Works',
      imagePath: 'assets/images/lessons/day8/lesson2/content1.png',
      imagePrompt: 'cartoon blockchain process: transaction, verification, block creation, chain addition',
      content: '''Understanding blockchain step by step:''',
      bullets: [
        BulletPoint(icon: '📝', title: 'Transactions', description: 'People send cryptocurrency.'),
        BulletPoint(icon: '✅', title: 'Verification', description: 'Network confirms the transaction.'),
        BulletPoint(icon: '📦', title: 'Block Creation', description: 'Transactions grouped into blocks.'),
        BulletPoint(icon: '🔗', title: 'Chain Addition', description: 'New block links to previous ones.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Blockchain Matters',
      imagePath: 'assets/images/lessons/day8/lesson2/content2.png',
      imagePrompt: 'cartoon blockchain benefits: transparency, security, immutability, no middlemen',
      content: '''Blockchain has special properties:''',
      bullets: [
        BulletPoint(icon: '👀', title: 'Transparent', description: 'Anyone can view transactions.'),
        BulletPoint(icon: '🔒', title: 'Secure', description: 'Nearly impossible to hack.'),
        BulletPoint(icon: '📜', title: 'Immutable', description: 'Records cannot be changed.'),
        BulletPoint(icon: '🤝', title: 'Trustless', description: 'No need to trust middlemen.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Block Basics',
      imagePath: 'assets/images/lessons/day8/lesson2/game1.png',
      imagePrompt: 'cartoon blockchain structure visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'In blockchain, transactions are stored in:',
        options: [GameOption(label: 'Random files', emoji: '📄'), GameOption(label: 'Connected blocks', emoji: '⛓️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Property Pop',
      imagePath: 'assets/images/lessons/day8/lesson2/game2.png',
      imagePrompt: 'cartoon blockchain features as balloons',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What makes blockchain records hard to change?',
        options: [GameOption(label: 'They are secret', emoji: '🤫'), GameOption(label: 'They are immutable', emoji: '🔒'), GameOption(label: 'They are deleted daily', emoji: '🗑️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day8/lesson2/question.png',
      imagePrompt: 'cartoon transparent blockchain ledger',
      questionData: QuestionData(
        question: 'Who can view transactions on a public blockchain?',
        options: ['Only banks', 'Only governments', 'Anyone', 'Only the sender'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Chain Mission',
      imagePath: 'assets/images/lessons/day8/lesson2/mission.png',
      imagePrompt: 'cartoon blockchain network distributed across globe',
      missionData: MissionData(
        mission: 'Why is blockchain called "trustless"?',
        options: ['You cannot trust it', 'You do not need to trust a middleman', 'It has no security', 'It is dishonest'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Blockchain Explorer', badgeIcon: '⛓️')),
  ],
);
