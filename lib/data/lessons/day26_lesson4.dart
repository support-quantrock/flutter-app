import '../../models/lesson_models.dart';

final day26Lesson4 = LessonData(
  day: 26,
  title: "Financial Calculators",
  emoji: '🧮',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Planning with Numbers',
      imagePath: 'assets/images/lessons/day26/lesson4/story.png',
      imagePrompt: 'cartoon financial calculators: compound interest, retirement, investment growth',
      content: '''Calculators help you plan your financial future.

See how investments can grow over time.

Numbers turn dreams into achievable goals!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Useful Calculators',
      imagePath: 'assets/images/lessons/day26/lesson4/content1.png',
      imagePrompt: 'cartoon types of financial calculators: compound interest, retirement, loan',
      content: '''Essential financial calculators:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Compound Interest', description: 'See how money grows.'),
        BulletPoint(icon: '🏖️', title: 'Retirement', description: 'Plan for the future.'),
        BulletPoint(icon: '🎯', title: 'Goal Planning', description: 'How much to save.'),
        BulletPoint(icon: '💳', title: 'Loan Payoff', description: 'Debt repayment plans.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Key Inputs',
      imagePath: 'assets/images/lessons/day26/lesson4/content2.png',
      imagePrompt: 'cartoon calculator inputs: principal, rate, time, contributions',
      content: '''What calculators need:''',
      bullets: [
        BulletPoint(icon: '💵', title: 'Starting Amount', description: 'Your initial investment.'),
        BulletPoint(icon: '📊', title: 'Expected Return', description: 'Projected annual growth.'),
        BulletPoint(icon: '⏰', title: 'Time Horizon', description: 'Years until goal.'),
        BulletPoint(icon: '➕', title: 'Contributions', description: 'Regular additions.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Calculator Check',
      imagePath: 'assets/images/lessons/day26/lesson4/game1.png',
      imagePrompt: 'cartoon compound interest calculator',
      gameData: GameData(
        type: 'choice',
        instruction: 'A compound interest calculator shows:',
        options: [GameOption(label: 'Only simple interest', emoji: '➖'), GameOption(label: 'How money grows over time with compounding', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Input Pop',
      imagePath: 'assets/images/lessons/day26/lesson4/game2.png',
      imagePrompt: 'cartoon investment calculator time horizon',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Time horizon in calculators refers to:',
        options: [GameOption(label: 'Current time of day', emoji: '🕐'), GameOption(label: 'Years until your goal', emoji: '⏰'), GameOption(label: 'Your age today', emoji: '🎂')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day26/lesson4/question.png',
      imagePrompt: 'cartoon retirement calculator',
      questionData: QuestionData(
        question: 'Retirement calculators help you:',
        options: ['Retire tomorrow', 'Plan how much to save for retirement', 'Avoid saving', 'Spend more today'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Planning Mission',
      imagePath: 'assets/images/lessons/day26/lesson4/mission.png',
      imagePrompt: 'cartoon using calculators for financial planning',
      missionData: MissionData(
        mission: 'Financial calculators are useful for:',
        options: ['Entertainment only', 'Setting realistic goals and plans', 'Guessing randomly', 'Avoiding planning'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Number Cruncher', badgeIcon: '🧮')),
  ],
);
