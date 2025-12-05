import '../../models/lesson_models.dart';

final day9Lesson4 = LessonData(
  day: 9,
  title: "DAOs & Digital Communities",
  emoji: '🏛️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Community Ownership',
      imagePath: 'assets/images/lessons/day9/lesson4/story.png',
      imagePrompt: 'cartoon DAO as group of people voting together with tokens, decentralized organization',
      content: '''DAO stands for Decentralized Autonomous Organization.

It is like a company owned by its community!

Members vote on decisions using tokens.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How DAOs Work',
      imagePath: 'assets/images/lessons/day9/lesson4/content1.png',
      imagePrompt: 'cartoon DAO structure: token holders, voting mechanism, smart contract treasury',
      content: '''Understanding DAOs:''',
      bullets: [
        BulletPoint(icon: '🗳️', title: 'Token Voting', description: 'Holders vote on proposals.'),
        BulletPoint(icon: '💰', title: 'Treasury', description: 'Shared funds controlled by code.'),
        BulletPoint(icon: '📜', title: 'Rules in Code', description: 'Smart contracts enforce rules.'),
        BulletPoint(icon: '🌍', title: 'Global', description: 'Members from anywhere can join.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'DAO Examples',
      imagePath: 'assets/images/lessons/day9/lesson4/content2.png',
      imagePrompt: 'cartoon different DAO types: investment club, charity, protocol governance, collector group',
      content: '''Types of DAOs:''',
      bullets: [
        BulletPoint(icon: '💸', title: 'Investment DAOs', description: 'Pool money to invest together.'),
        BulletPoint(icon: '🤝', title: 'Protocol DAOs', description: 'Govern DeFi platforms.'),
        BulletPoint(icon: '🖼️', title: 'Collector DAOs', description: 'Buy art and collectibles together.'),
        BulletPoint(icon: '💝', title: 'Charity DAOs', description: 'Coordinate donations.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'DAO Check',
      imagePath: 'assets/images/lessons/day9/lesson4/game1.png',
      imagePrompt: 'cartoon DAO voting process',
      gameData: GameData(
        type: 'choice',
        instruction: 'In a DAO, decisions are made by:',
        options: [GameOption(label: 'One CEO', emoji: '👤'), GameOption(label: 'Token holder votes', emoji: '🗳️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Pop',
      imagePath: 'assets/images/lessons/day9/lesson4/game2.png',
      imagePrompt: 'cartoon DAO types as balloons',
      gameData: GameData(
        type: 'balloon',
        instruction: 'An investment DAO helps members:',
        options: [GameOption(label: 'Vote on art only', emoji: '🎨'), GameOption(label: 'Pool money to invest together', emoji: '💰'), GameOption(label: 'Only play games', emoji: '🎮')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day9/lesson4/question.png',
      imagePrompt: 'cartoon DAO smart contract treasury',
      questionData: QuestionData(
        question: 'What controls a DAO treasury?',
        options: ['One person', 'Smart contracts and votes', 'Random selection', 'No control'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'DAO Mission',
      imagePath: 'assets/images/lessons/day9/lesson4/mission.png',
      imagePrompt: 'cartoon global DAO community members',
      missionData: MissionData(
        mission: 'Why are DAOs considered decentralized?',
        options: ['One owner decides', 'Power is distributed among token holders', 'Government runs them', 'They are secret'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'DAO Master', badgeIcon: '🏛️')),
  ],
);
