import '../../models/lesson_models.dart';

final day9Lesson5 = LessonData(
  day: 9,
  title: "Web3 Risks & Future",
  emoji: '🔮',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Navigate Carefully',
      imagePath: 'assets/images/lessons/day9/lesson5/story.png',
      imagePrompt: 'cartoon Web3 landscape with both opportunities and dangers, caution signs',
      content: '''Web3 is exciting but still new and risky.

Scams, hacks, and failed projects are common.

Understanding the risks helps you navigate safely!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Web3 Risks',
      imagePath: 'assets/images/lessons/day9/lesson5/content1.png',
      imagePrompt: 'cartoon Web3 dangers: rug pull, smart contract bug, phishing hook, hacker',
      content: '''Common Web3 dangers:''',
      bullets: [
        BulletPoint(icon: '🎭', title: 'Rug Pulls', description: 'Projects that steal money and disappear.'),
        BulletPoint(icon: '🐛', title: 'Smart Contract Bugs', description: 'Code errors can lose funds.'),
        BulletPoint(icon: '🎣', title: 'Phishing', description: 'Fake sites steal your keys.'),
        BulletPoint(icon: '📉', title: 'Volatility', description: 'Values can crash dramatically.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Future',
      imagePath: 'assets/images/lessons/day9/lesson5/content2.png',
      imagePrompt: 'cartoon Web3 future: digital identity, ownership economy, global participation',
      content: '''Where Web3 is heading:''',
      bullets: [
        BulletPoint(icon: '🆔', title: 'Digital Identity', description: 'Own your online identity.'),
        BulletPoint(icon: '🎮', title: 'Gaming Evolution', description: 'True ownership of game assets.'),
        BulletPoint(icon: '🏦', title: 'Finance Access', description: 'Banking for everyone globally.'),
        BulletPoint(icon: '🌐', title: 'Creator Economy', description: 'Direct creator-to-fan relationships.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Check',
      imagePath: 'assets/images/lessons/day9/lesson5/game1.png',
      imagePrompt: 'cartoon rug pull warning',
      gameData: GameData(
        type: 'choice',
        instruction: 'A "rug pull" is when:',
        options: [GameOption(label: 'Project succeeds', emoji: '✅'), GameOption(label: 'Project steals money and disappears', emoji: '🏃')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Future Pop',
      imagePath: 'assets/images/lessons/day9/lesson5/game2.png',
      imagePrompt: 'cartoon Web3 future possibilities',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Web3 could enable:',
        options: [GameOption(label: 'Less digital ownership', emoji: '❌'), GameOption(label: 'True ownership of digital assets', emoji: '🔑'), GameOption(label: 'Only offline activities', emoji: '📴')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day9/lesson5/question.png',
      imagePrompt: 'cartoon phishing attack warning',
      questionData: QuestionData(
        question: 'How can you avoid phishing in Web3?',
        options: ['Click any link', 'Verify websites carefully before connecting wallet', 'Share your keys', 'Trust all messages'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Future Mission',
      imagePath: 'assets/images/lessons/day9/lesson5/mission.png',
      imagePrompt: 'cartoon careful Web3 explorer doing research',
      missionData: MissionData(
        mission: 'What is the BEST approach to Web3?',
        options: ['Jump in without research', 'Learn, verify, and start small', 'Trust everything', 'Ignore all warnings'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Web3 Ready', badgeIcon: '🔮')),
  ],
);
