import '../../models/lesson_models.dart';

final day9Lesson3 = LessonData(
  day: 9,
  title: "NFTs Explained",
  emoji: '🖼️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Digital Ownership',
      imagePath: 'assets/images/lessons/day9/lesson3/story.png',
      imagePrompt: 'cartoon NFT as certificate of authenticity for digital art, unique digital collectible',
      content: '''NFT stands for Non-Fungible Token.

Unlike Bitcoin where each coin is the same, each NFT is unique!

It proves you own a specific digital item.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding NFTs',
      imagePath: 'assets/images/lessons/day9/lesson3/content1.png',
      imagePrompt: 'cartoon NFT features: unique ID, ownership proof, blockchain verified, digital certificate',
      content: '''What makes NFTs special:''',
      bullets: [
        BulletPoint(icon: '🆔', title: 'Unique', description: 'Each NFT is one-of-a-kind.'),
        BulletPoint(icon: '📜', title: 'Proof of Ownership', description: 'Blockchain verifies you own it.'),
        BulletPoint(icon: '🔄', title: 'Tradeable', description: 'Can be bought and sold.'),
        BulletPoint(icon: '🎨', title: 'Digital Assets', description: 'Art, music, videos, and more.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'NFT Uses',
      imagePath: 'assets/images/lessons/day9/lesson3/content2.png',
      imagePrompt: 'cartoon NFT applications: art gallery, game items, music records, event tickets',
      content: '''Where NFTs are used:''',
      bullets: [
        BulletPoint(icon: '🎨', title: 'Digital Art', description: 'Artists sell unique digital works.'),
        BulletPoint(icon: '🎮', title: 'Gaming', description: 'Own in-game items truly.'),
        BulletPoint(icon: '🎵', title: 'Music', description: 'Musicians sell directly to fans.'),
        BulletPoint(icon: '🎫', title: 'Tickets', description: 'Event access and collectibles.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'NFT Check',
      imagePath: 'assets/images/lessons/day9/lesson3/game1.png',
      imagePrompt: 'cartoon NFT uniqueness concept',
      gameData: GameData(
        type: 'choice',
        instruction: 'What does "Non-Fungible" mean?',
        options: [GameOption(label: 'All the same', emoji: '='), GameOption(label: 'Each one is unique', emoji: '🌟')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Use Pop',
      imagePath: 'assets/images/lessons/day9/lesson3/game2.png',
      imagePrompt: 'cartoon NFT uses as balloons',
      gameData: GameData(
        type: 'balloon',
        instruction: 'NFTs can represent:',
        options: [GameOption(label: 'Only cat pictures', emoji: '🐱'), GameOption(label: 'Art, music, games, and more', emoji: '🎨'), GameOption(label: 'Nothing real', emoji: '❓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day9/lesson3/question.png',
      imagePrompt: 'cartoon NFT ownership verification',
      questionData: QuestionData(
        question: 'How do you prove NFT ownership?',
        options: ['Paper certificate', 'Blockchain record', 'Just trust', 'No way to prove'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'NFT Mission',
      imagePath: 'assets/images/lessons/day9/lesson3/mission.png',
      imagePrompt: 'cartoon artist selling NFT directly to collector',
      missionData: MissionData(
        mission: 'How can artists benefit from NFTs?',
        options: ['They cannot', 'Sell directly to fans and prove authenticity', 'Only big companies benefit', 'NFTs hurt artists'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'NFT Expert', badgeIcon: '🖼️')),
  ],
);
