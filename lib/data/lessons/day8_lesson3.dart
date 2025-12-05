import '../../models/lesson_models.dart';

final day8Lesson3 = LessonData(
  day: 8,
  title: "Bitcoin Deep Dive",
  emoji: '🪙',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Digital Gold',
      imagePath: 'assets/images/lessons/day8/lesson3/story.png',
      imagePrompt: 'cartoon Bitcoin as digital gold bars, scarce and valuable, mining concept',
      content: '''Bitcoin is often called digital gold.

Created in 2009 by the mysterious Satoshi Nakamoto.

Only 21 million Bitcoin will ever exist - making it scarce!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Bitcoin Features',
      imagePath: 'assets/images/lessons/day8/lesson3/content1.png',
      imagePrompt: 'cartoon Bitcoin key features: limited supply counter, decentralized network, mining pickaxe',
      content: '''What makes Bitcoin unique:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Limited Supply', description: 'Only 21 million will ever exist.'),
        BulletPoint(icon: '⛏️', title: 'Mining', description: 'Computers solve puzzles to create new Bitcoin.'),
        BulletPoint(icon: '✂️', title: 'Halving', description: 'Mining rewards cut in half every 4 years.'),
        BulletPoint(icon: '🏆', title: 'First Mover', description: 'The original cryptocurrency.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Bitcoin Wallets',
      imagePath: 'assets/images/lessons/day8/lesson3/content2.png',
      imagePrompt: 'cartoon Bitcoin wallet with private and public keys, digital safe concept',
      content: '''Storing Bitcoin safely:''',
      bullets: [
        BulletPoint(icon: '👛', title: 'Wallet', description: 'Software that holds your Bitcoin.'),
        BulletPoint(icon: '🔑', title: 'Private Key', description: 'Secret code - never share!'),
        BulletPoint(icon: '📫', title: 'Public Address', description: 'Share this to receive Bitcoin.'),
        BulletPoint(icon: '🧊', title: 'Cold Storage', description: 'Offline wallet for security.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Supply Check',
      imagePath: 'assets/images/lessons/day8/lesson3/game1.png',
      imagePrompt: 'cartoon Bitcoin supply cap visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'How many Bitcoin will ever exist?',
        options: [GameOption(label: 'Unlimited', emoji: '♾️'), GameOption(label: '21 million', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Key Knowledge',
      imagePath: 'assets/images/lessons/day8/lesson3/game2.png',
      imagePrompt: 'cartoon private key as secret treasure',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Your Bitcoin private key should be:',
        options: [GameOption(label: 'Shared publicly', emoji: '📢'), GameOption(label: 'Kept secret', emoji: '🤫'), GameOption(label: 'Posted online', emoji: '🌐')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day8/lesson3/question.png',
      imagePrompt: 'cartoon Bitcoin mining process',
      questionData: QuestionData(
        question: 'How are new Bitcoins created?',
        options: ['Banks print them', 'Mining by computers', 'They appear randomly', 'Government creates them'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Bitcoin Mission',
      imagePath: 'assets/images/lessons/day8/lesson3/mission.png',
      imagePrompt: 'cartoon Bitcoin scarcity concept',
      missionData: MissionData(
        mission: 'Why is Bitcoin compared to gold?',
        options: ['Same color', 'Both are limited and scarce', 'Both are heavy', 'Both are controlled by banks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Bitcoin Expert', badgeIcon: '🪙')),
  ],
);
