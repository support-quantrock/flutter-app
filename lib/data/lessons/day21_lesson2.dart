import '../../models/lesson_models.dart';

final day21Lesson2 = LessonData(
  day: 21,
  title: "Tax-Advantaged Accounts",
  emoji: '🏦',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Shelter Your Gains',
      imagePath: 'assets/images/lessons/day21/lesson2/story.png',
      imagePrompt: 'cartoon tax-advantaged accounts as shields protecting investments from taxes',
      content: '''Some accounts offer special tax benefits.

Money can grow tax-free or tax-deferred!

Using these accounts wisely is a huge advantage.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Accounts',
      imagePath: 'assets/images/lessons/day21/lesson2/content1.png',
      imagePrompt: 'cartoon tax-advantaged account types: 401k, IRA, Roth IRA, brokerage',
      content: '''Common tax-advantaged accounts:''',
      bullets: [
        BulletPoint(icon: '🏢', title: '401(k)', description: 'Employer retirement - pre-tax contributions.'),
        BulletPoint(icon: '📊', title: 'Traditional IRA', description: 'Individual retirement - tax-deferred.'),
        BulletPoint(icon: '🌟', title: 'Roth IRA', description: 'Pay tax now, grow tax-free forever.'),
        BulletPoint(icon: '📈', title: 'Brokerage', description: 'Regular account - fully taxed.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Tax-Free vs Tax-Deferred',
      imagePath: 'assets/images/lessons/day21/lesson2/content2.png',
      imagePrompt: 'cartoon tax-deferred growing then taxed vs Roth never taxed on growth',
      content: '''Two main approaches:''',
      bullets: [
        BulletPoint(icon: '⏳', title: 'Tax-Deferred', description: 'Pay no tax now, pay later when you withdraw.'),
        BulletPoint(icon: '🆓', title: 'Tax-Free', description: 'Pay tax now, never pay on growth.'),
        BulletPoint(icon: '🤔', title: 'Which is Better?', description: 'Depends on future tax rates.'),
        BulletPoint(icon: '⚖️', title: 'Use Both', description: 'Diversify your tax exposure.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Account Check',
      imagePath: 'assets/images/lessons/day21/lesson2/game1.png',
      imagePrompt: 'cartoon Roth IRA benefit',
      gameData: GameData(
        type: 'choice',
        instruction: 'Roth IRA growth is:',
        options: [GameOption(label: 'Taxed every year', emoji: '💸'), GameOption(label: 'Tax-free forever', emoji: '🆓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Pop',
      imagePath: 'assets/images/lessons/day21/lesson2/game2.png',
      imagePrompt: 'cartoon 401k employer plan',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A 401(k) is typically offered by:',
        options: [GameOption(label: 'Banks only', emoji: '🏦'), GameOption(label: 'Employers', emoji: '🏢'), GameOption(label: 'Nobody', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day21/lesson2/question.png',
      imagePrompt: 'cartoon tax-deferred meaning',
      questionData: QuestionData(
        question: 'Tax-deferred means:',
        options: ['Never pay taxes', 'Pay taxes now', 'Pay taxes later when you withdraw', 'Pay double taxes'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Account Mission',
      imagePath: 'assets/images/lessons/day21/lesson2/mission.png',
      imagePrompt: 'cartoon using multiple account types',
      missionData: MissionData(
        mission: 'Why might you use both Roth and Traditional accounts?',
        options: ['No reason to', 'To diversify tax exposure', 'Traditional is always better', 'Roth is always better'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Account Expert', badgeIcon: '🏦')),
  ],
);
