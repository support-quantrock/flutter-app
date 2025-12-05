import '../../models/lesson_models.dart';

final day8Lesson1 = LessonData(
  day: 8,
  title: "What is Cryptocurrency?",
  emoji: '₿',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Digital Money Revolution',
      imagePath: 'assets/images/lessons/day8/lesson1/story.png',
      imagePrompt: 'cartoon Bitcoin and other crypto coins floating in digital space, futuristic money concept',
      content: '''Cryptocurrency is digital money that works without banks.

It uses special technology to be secure and transparent.

Bitcoin started it all in 2009, and now there are thousands!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Crypto Basics',
      imagePath: 'assets/images/lessons/day8/lesson1/content1.png',
      imagePrompt: 'cartoon cryptocurrency features: decentralized network, digital coins, global access',
      content: '''What makes cryptocurrency special:''',
      bullets: [
        BulletPoint(icon: '🌐', title: 'Decentralized', description: 'No bank or government controls it.'),
        BulletPoint(icon: '💻', title: 'Digital Only', description: 'Exists only on computers and networks.'),
        BulletPoint(icon: '🔐', title: 'Cryptography', description: 'Math keeps it secure.'),
        BulletPoint(icon: '🌍', title: 'Global', description: 'Send anywhere, anytime.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Popular Cryptocurrencies',
      imagePath: 'assets/images/lessons/day8/lesson1/content2.png',
      imagePrompt: 'cartoon major cryptocurrencies as characters: Bitcoin gold, Ethereum diamond, others',
      content: '''The most well-known cryptocurrencies:''',
      bullets: [
        BulletPoint(icon: '₿', title: 'Bitcoin (BTC)', description: 'The first and most famous crypto.'),
        BulletPoint(icon: '💎', title: 'Ethereum (ETH)', description: 'Platform for smart contracts.'),
        BulletPoint(icon: '🪙', title: 'Altcoins', description: 'All other cryptocurrencies.'),
        BulletPoint(icon: '💵', title: 'Stablecoins', description: 'Cryptos pegged to regular money.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Crypto Check',
      imagePath: 'assets/images/lessons/day8/lesson1/game1.png',
      imagePrompt: 'cartoon cryptocurrency vs traditional money comparison',
      gameData: GameData(
        type: 'choice',
        instruction: 'What is cryptocurrency?',
        options: [GameOption(label: 'Physical coins', emoji: '🪙'), GameOption(label: 'Digital money on networks', emoji: '💻')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'First Finder',
      imagePath: 'assets/images/lessons/day8/lesson1/game2.png',
      imagePrompt: 'cartoon history of cryptocurrency with Bitcoin as pioneer',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which was the FIRST cryptocurrency?',
        options: [GameOption(label: 'Ethereum', emoji: '💎'), GameOption(label: 'Bitcoin', emoji: '₿'), GameOption(label: 'Dogecoin', emoji: '🐕')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day8/lesson1/question.png',
      imagePrompt: 'cartoon decentralized network concept',
      questionData: QuestionData(
        question: 'What does "decentralized" mean for crypto?',
        options: ['One bank controls it', 'No single entity controls it', 'It is always free', 'It cannot be traded'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Crypto Mission',
      imagePath: 'assets/images/lessons/day8/lesson1/mission.png',
      imagePrompt: 'cartoon cryptocurrency global network visualization',
      missionData: MissionData(
        mission: 'What technology keeps cryptocurrency secure?',
        options: ['Banks', 'Cryptography', 'Paper certificates', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Crypto Starter', badgeIcon: '₿')),
  ],
);
