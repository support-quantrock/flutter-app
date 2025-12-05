import '../../models/lesson_models.dart';

final day9Lesson1 = LessonData(
  day: 9,
  title: "Welcome to Web3",
  emoji: '🌐',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Next Internet',
      imagePath: 'assets/images/lessons/day9/lesson1/story.png',
      imagePrompt: 'cartoon evolution from Web1 to Web2 to Web3, user gaining ownership and control',
      content: '''Web3 is the next evolution of the internet.

Web1 was read-only. Web2 added interaction.
Web3 adds ownership!

You own your data, your digital assets, your online identity.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Web Evolution',
      imagePath: 'assets/images/lessons/day9/lesson1/content1.png',
      imagePrompt: 'cartoon timeline: Web1 newspaper, Web2 social media, Web3 blockchain ownership',
      content: '''The three eras of the web:''',
      bullets: [
        BulletPoint(icon: '📰', title: 'Web1', description: 'Read only - websites like newspapers.'),
        BulletPoint(icon: '📱', title: 'Web2', description: 'Read and write - social media, apps.'),
        BulletPoint(icon: '🔑', title: 'Web3', description: 'Read, write, and OWN.'),
        BulletPoint(icon: '⛓️', title: 'Built On', description: 'Blockchain technology powers Web3.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Web3 Features',
      imagePath: 'assets/images/lessons/day9/lesson1/content2.png',
      imagePrompt: 'cartoon Web3 benefits: ownership key, decentralized network, token economy',
      content: '''What makes Web3 special:''',
      bullets: [
        BulletPoint(icon: '👤', title: 'Self-Custody', description: 'You control your data and assets.'),
        BulletPoint(icon: '🌍', title: 'Decentralized', description: 'No single company controls it.'),
        BulletPoint(icon: '🪙', title: 'Token Economy', description: 'Digital assets with real value.'),
        BulletPoint(icon: '🔓', title: 'Permissionless', description: 'Anyone can participate.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Web Check',
      imagePath: 'assets/images/lessons/day9/lesson1/game1.png',
      imagePrompt: 'cartoon Web3 ownership concept',
      gameData: GameData(
        type: 'choice',
        instruction: 'What does Web3 add compared to Web2?',
        options: [GameOption(label: 'Just faster speeds', emoji: '⚡'), GameOption(label: 'Ownership and control', emoji: '🔑')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Era Pop',
      imagePath: 'assets/images/lessons/day9/lesson1/game2.png',
      imagePrompt: 'cartoon web eras as balloons',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which era is "read, write, and own"?',
        options: [GameOption(label: 'Web1', emoji: '📰'), GameOption(label: 'Web2', emoji: '📱'), GameOption(label: 'Web3', emoji: '🌐')],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day9/lesson1/question.png',
      imagePrompt: 'cartoon Web3 foundation technology',
      questionData: QuestionData(
        question: 'What technology powers Web3?',
        options: ['Traditional servers', 'Blockchain', 'Paper records', 'Fax machines'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Web3 Mission',
      imagePath: 'assets/images/lessons/day9/lesson1/mission.png',
      imagePrompt: 'cartoon user with Web3 ownership and control',
      missionData: MissionData(
        mission: 'In Web3, who controls your data?',
        options: ['Big companies', 'Governments', 'YOU do', 'No one'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Web3 Explorer', badgeIcon: '🌐')),
  ],
);
