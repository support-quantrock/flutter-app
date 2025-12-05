import '../../models/lesson_models.dart';

final day8Lesson4 = LessonData(
  day: 8,
  title: "Ethereum & Smart Contracts",
  emoji: '💎',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The World Computer',
      imagePath: 'assets/images/lessons/day8/lesson4/story.png',
      imagePrompt: 'cartoon Ethereum as a programmable world computer, smart contracts flying around',
      content: '''Ethereum goes beyond just money.

It is a programmable blockchain - you can build apps on it!

Smart contracts automatically execute when conditions are met.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Smart Contracts',
      imagePath: 'assets/images/lessons/day8/lesson4/content1.png',
      imagePrompt: 'cartoon smart contract as vending machine: insert condition, get automatic result',
      content: '''Understanding smart contracts:''',
      bullets: [
        BulletPoint(icon: '🤖', title: 'Automatic', description: 'Execute when conditions are met.'),
        BulletPoint(icon: '📝', title: 'Code-Based', description: 'Written in programming language.'),
        BulletPoint(icon: '🔒', title: 'Trustless', description: 'No middleman needed.'),
        BulletPoint(icon: '⚡', title: 'Fast', description: 'Execute instantly when triggered.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Ethereum Enables',
      imagePath: 'assets/images/lessons/day8/lesson4/content2.png',
      imagePrompt: 'cartoon Ethereum applications: DeFi, NFTs, DAOs, gaming tokens',
      content: '''Built on Ethereum:''',
      bullets: [
        BulletPoint(icon: '🏦', title: 'DeFi', description: 'Decentralized finance apps.'),
        BulletPoint(icon: '🖼️', title: 'NFTs', description: 'Unique digital collectibles.'),
        BulletPoint(icon: '🏛️', title: 'DAOs', description: 'Decentralized organizations.'),
        BulletPoint(icon: '🎮', title: 'Gaming', description: 'Play-to-earn games.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Contract Check',
      imagePath: 'assets/images/lessons/day8/lesson4/game1.png',
      imagePrompt: 'cartoon smart contract execution visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'Smart contracts execute:',
        options: [GameOption(label: 'Only with bank approval', emoji: '🏦'), GameOption(label: 'Automatically when conditions are met', emoji: '🤖')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'ETH Apps',
      imagePath: 'assets/images/lessons/day8/lesson4/game2.png',
      imagePrompt: 'cartoon Ethereum ecosystem applications',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which of these is built on Ethereum?',
        options: [GameOption(label: 'Regular email', emoji: '📧'), GameOption(label: 'NFTs and DeFi', emoji: '🖼️'), GameOption(label: 'Paper documents', emoji: '📄')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day8/lesson4/question.png',
      imagePrompt: 'cartoon Ethereum vs Bitcoin comparison',
      questionData: QuestionData(
        question: 'How is Ethereum different from Bitcoin?',
        options: ['No difference', 'Ethereum is programmable for apps', 'Bitcoin is newer', 'Ethereum is controlled by banks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'ETH Mission',
      imagePath: 'assets/images/lessons/day8/lesson4/mission.png',
      imagePrompt: 'cartoon smart contract real-world application',
      missionData: MissionData(
        mission: 'What is a real use of smart contracts?',
        options: ['Nothing practical', 'Automatic payment when conditions are met', 'Only for games', 'They do not work'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Ethereum Pro', badgeIcon: '💎')),
  ],
);
