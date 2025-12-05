import '../../models/lesson_models.dart';

final day22Lesson3 = LessonData(
  day: 22,
  title: "Retirement Account Types",
  emoji: '🗃️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Tools for Retirement',
      imagePath: 'assets/images/lessons/day22/lesson3/story.png',
      imagePrompt: 'cartoon different retirement account containers: 401k box, IRA jar, Roth piggy bank',
      content: '''Many account types help you save for retirement.

Each has different rules and tax benefits.

Understanding them helps you save more efficiently!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Employer Plans',
      imagePath: 'assets/images/lessons/day22/lesson3/content1.png',
      imagePrompt: 'cartoon 401k with employer match as free money, workplace retirement plan',
      content: '''Workplace retirement accounts:''',
      bullets: [
        BulletPoint(icon: '🏢', title: '401(k)', description: 'Most common US employer plan.'),
        BulletPoint(icon: '🎁', title: 'Match', description: 'Employer may match your contributions.'),
        BulletPoint(icon: '💵', title: 'High Limits', description: 'Can save more than IRA.'),
        BulletPoint(icon: '🔄', title: 'Automatic', description: 'Deducted from paycheck.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Individual Accounts',
      imagePath: 'assets/images/lessons/day22/lesson3/content2.png',
      imagePrompt: 'cartoon Traditional vs Roth IRA comparison: tax now vs tax later',
      content: '''Personal retirement accounts:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Traditional IRA', description: 'Tax-deductible now, taxed later.'),
        BulletPoint(icon: '🌟', title: 'Roth IRA', description: 'Taxed now, tax-free later.'),
        BulletPoint(icon: '📏', title: 'Income Limits', description: 'Roth has income restrictions.'),
        BulletPoint(icon: '🎯', title: 'Choose Wisely', description: 'Based on current vs future tax rate.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Match Check',
      imagePath: 'assets/images/lessons/day22/lesson3/game1.png',
      imagePrompt: 'cartoon employer match as free money',
      gameData: GameData(
        type: 'choice',
        instruction: 'An employer 401(k) match is essentially:',
        options: [GameOption(label: 'A loan', emoji: '💳'), GameOption(label: 'Free money', emoji: '🎁')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Pop',
      imagePath: 'assets/images/lessons/day22/lesson3/game2.png',
      imagePrompt: 'cartoon Roth IRA tax-free growth',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Roth IRA withdrawals in retirement are:',
        options: [GameOption(label: 'Fully taxed', emoji: '💸'), GameOption(label: 'Tax-free', emoji: '🆓'), GameOption(label: 'Penalized', emoji: '⚠️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day22/lesson3/question.png',
      imagePrompt: 'cartoon 401k high contribution limit',
      questionData: QuestionData(
        question: 'Compared to IRAs, 401(k)s typically have:',
        options: ['Lower contribution limits', 'Higher contribution limits', 'Same limits', 'No limits'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Account Mission',
      imagePath: 'assets/images/lessons/day22/lesson3/mission.png',
      imagePrompt: 'cartoon maximizing employer match',
      missionData: MissionData(
        mission: 'If your employer offers a 401(k) match, you should:',
        options: ['Ignore it', 'At minimum, contribute enough to get the full match', 'Wait until older', 'Only use IRA'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Account Master', badgeIcon: '🗃️')),
  ],
);
