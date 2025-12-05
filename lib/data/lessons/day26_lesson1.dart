import '../../models/lesson_models.dart';

final day26Lesson1 = LessonData(
  day: 26,
  title: "Investment Tools Overview",
  emoji: '🧰',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Tools for Success',
      imagePath: 'assets/images/lessons/day26/lesson1/story.png',
      imagePrompt: 'cartoon investment tools: brokerage apps, calculators, research platforms, portfolio trackers',
      content: '''Modern investors have many tools available.

From brokerages to research platforms.

Using the right tools makes investing easier!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Essential Tools',
      imagePath: 'assets/images/lessons/day26/lesson1/content1.png',
      imagePrompt: 'cartoon essential investment tools: brokerage account, research sites, portfolio tracker',
      content: '''Key tools every investor needs:''',
      bullets: [
        BulletPoint(icon: '📱', title: 'Brokerage Account', description: 'Where you buy and sell.'),
        BulletPoint(icon: '🔍', title: 'Research Tools', description: 'Analyze investments.'),
        BulletPoint(icon: '📊', title: 'Portfolio Tracker', description: 'Monitor your holdings.'),
        BulletPoint(icon: '🧮', title: 'Calculators', description: 'Plan and project returns.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Brokerages',
      imagePath: 'assets/images/lessons/day26/lesson1/content2.png',
      imagePrompt: 'cartoon brokerage types: full-service, discount, robo-advisor',
      content: '''Brokerage options:''',
      bullets: [
        BulletPoint(icon: '👔', title: 'Full-Service', description: 'Personal advice, higher fees.'),
        BulletPoint(icon: '💰', title: 'Discount', description: 'DIY investing, low fees.'),
        BulletPoint(icon: '🤖', title: 'Robo-Advisor', description: 'Automated portfolio management.'),
        BulletPoint(icon: '📲', title: 'Mobile Apps', description: 'Trade on your phone.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Tool Check',
      imagePath: 'assets/images/lessons/day26/lesson1/game1.png',
      imagePrompt: 'cartoon brokerage account purpose',
      gameData: GameData(
        type: 'choice',
        instruction: 'A brokerage account is where you:',
        options: [GameOption(label: 'Store your cash only', emoji: '💵'), GameOption(label: 'Buy and sell investments', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Broker Pop',
      imagePath: 'assets/images/lessons/day26/lesson1/game2.png',
      imagePrompt: 'cartoon discount vs full-service broker',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Discount brokerages typically have:',
        options: [GameOption(label: 'Higher fees and advice', emoji: '👔'), GameOption(label: 'Lower fees, DIY approach', emoji: '💰'), GameOption(label: 'No investment options', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day26/lesson1/question.png',
      imagePrompt: 'cartoon robo-advisor',
      questionData: QuestionData(
        question: 'Robo-advisors provide:',
        options: ['Human financial planners', 'Automated portfolio management', 'Only savings accounts', 'No investment services'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Tool Mission',
      imagePath: 'assets/images/lessons/day26/lesson1/mission.png',
      imagePrompt: 'cartoon choosing right investment tools',
      missionData: MissionData(
        mission: 'The right tools depend on:',
        options: ['Nothing at all', 'Your needs, experience, and preferences', 'Only the lowest fees', 'Picking at random'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Tool Explorer', badgeIcon: '🧰')),
  ],
);
