import '../../models/lesson_models.dart';

final day8Lesson5 = LessonData(
  day: 8,
  title: "Crypto Risks & Safety",
  emoji: '🔐',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Stay Safe in Crypto',
      imagePath: 'assets/images/lessons/day8/lesson5/story.png',
      imagePrompt: 'cartoon shield protecting from crypto dangers: scams, hacks, volatility',
      content: '''Cryptocurrency can be risky if you are not careful.

Scams, hacks, and extreme price swings are real dangers.

Knowledge is your best protection!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Crypto Risks',
      imagePath: 'assets/images/lessons/day8/lesson5/content1.png',
      imagePrompt: 'cartoon crypto risks: price volatility chart, scammer character, hacker, lost keys',
      content: '''Major risks in cryptocurrency:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Volatility', description: 'Prices can drop 50% or more quickly.'),
        BulletPoint(icon: '🎭', title: 'Scams', description: 'Fake projects steal money.'),
        BulletPoint(icon: '🔓', title: 'Hacks', description: 'Exchanges can be hacked.'),
        BulletPoint(icon: '🔑', title: 'Lost Keys', description: 'Lose private key = lose crypto forever.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Staying Safe',
      imagePath: 'assets/images/lessons/day8/lesson5/content2.png',
      imagePrompt: 'cartoon security practices: hardware wallet, research, small investments, backup keys',
      content: '''How to protect yourself:''',
      bullets: [
        BulletPoint(icon: '🔍', title: 'Research', description: 'Study before investing.'),
        BulletPoint(icon: '🧊', title: 'Hardware Wallet', description: 'Store crypto offline.'),
        BulletPoint(icon: '📝', title: 'Backup Keys', description: 'Write down recovery phrases.'),
        BulletPoint(icon: '💰', title: 'Invest Wisely', description: 'Only what you can afford to lose.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Reality',
      imagePath: 'assets/images/lessons/day8/lesson5/game1.png',
      imagePrompt: 'cartoon crypto volatility warning',
      gameData: GameData(
        type: 'choice',
        instruction: 'Crypto prices are known for being:',
        options: [GameOption(label: 'Always stable', emoji: '➡️'), GameOption(label: 'Highly volatile', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Safety Pop',
      imagePath: 'assets/images/lessons/day8/lesson5/game2.png',
      imagePrompt: 'cartoon crypto safety tips balloons',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The safest way to store crypto is:',
        options: [GameOption(label: 'Share your keys online', emoji: '🌐'), GameOption(label: 'Hardware wallet offline', emoji: '🧊'), GameOption(label: 'Screenshot on phone', emoji: '📱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day8/lesson5/question.png',
      imagePrompt: 'cartoon wise crypto investment approach',
      questionData: QuestionData(
        question: 'How much should you invest in crypto?',
        options: ['Your entire savings', 'Only what you can afford to lose', 'Borrow money to invest', 'Everything you have'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Safety Mission',
      imagePath: 'assets/images/lessons/day8/lesson5/mission.png',
      imagePrompt: 'cartoon crypto investor doing research before buying',
      missionData: MissionData(
        mission: 'What should you do BEFORE investing in any crypto?',
        options: ['Buy immediately', 'Research thoroughly', 'Trust any advertisement', 'Ask strangers online'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Crypto Safe', badgeIcon: '🔐')),
  ],
);
