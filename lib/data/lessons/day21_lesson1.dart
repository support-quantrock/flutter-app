import '../../models/lesson_models.dart';

final day21Lesson1 = LessonData(
  day: 21,
  title: "Why Taxes Matter",
  emoji: '💰',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Taxes Eat Returns',
      imagePath: 'assets/images/lessons/day21/lesson1/story.png',
      imagePrompt: 'cartoon investment gains with portion going to taxes, after-tax returns smaller',
      content: '''Taxes can take a big bite from your returns.

What you keep after taxes is what really matters.

Smart tax planning can significantly boost your wealth!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Tax Basics for Investors',
      imagePath: 'assets/images/lessons/day21/lesson1/content1.png',
      imagePrompt: 'cartoon investment taxes: capital gains, dividends, interest income',
      content: '''How investments are taxed:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Capital Gains', description: 'Tax on profit when you sell.'),
        BulletPoint(icon: '💵', title: 'Dividends', description: 'Tax on dividend payments.'),
        BulletPoint(icon: '🏦', title: 'Interest', description: 'Tax on bond and savings interest.'),
        BulletPoint(icon: '📊', title: 'Rate Varies', description: 'Different rates for different income.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Short vs Long Term',
      imagePath: 'assets/images/lessons/day21/lesson1/content2.png',
      imagePrompt: 'cartoon short-term vs long-term capital gains: short higher tax, long lower tax',
      content: '''Holding period matters:''',
      bullets: [
        BulletPoint(icon: '⏱️', title: 'Short Term', description: 'Held less than 1 year - higher tax.'),
        BulletPoint(icon: '📅', title: 'Long Term', description: 'Held over 1 year - lower tax.'),
        BulletPoint(icon: '💡', title: 'Patience Pays', description: 'Holding longer often saves taxes.'),
        BulletPoint(icon: '📊', title: 'Big Difference', description: 'Can be 20%+ tax savings.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Tax Check',
      imagePath: 'assets/images/lessons/day21/lesson1/game1.png',
      imagePrompt: 'cartoon capital gains tax meaning',
      gameData: GameData(
        type: 'choice',
        instruction: 'Capital gains tax applies when you:',
        options: [GameOption(label: 'Buy an investment', emoji: '🛒'), GameOption(label: 'Sell an investment for profit', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Term Pop',
      imagePath: 'assets/images/lessons/day21/lesson1/game2.png',
      imagePrompt: 'cartoon long-term vs short-term rates',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Long-term capital gains are taxed:',
        options: [GameOption(label: 'Higher than short-term', emoji: '📈'), GameOption(label: 'Lower than short-term', emoji: '📉'), GameOption(label: 'Same as short-term', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day21/lesson1/question.png',
      imagePrompt: 'cartoon one year holding period',
      questionData: QuestionData(
        question: 'To qualify for long-term capital gains, you must hold:',
        options: ['One day', 'One week', 'Over one year', 'Exactly six months'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Tax Mission',
      imagePath: 'assets/images/lessons/day21/lesson1/mission.png',
      imagePrompt: 'cartoon after-tax returns importance',
      missionData: MissionData(
        mission: 'What matters most for building wealth?',
        options: ['Pre-tax returns only', 'After-tax returns - what you keep', 'Gross income', 'Trade frequency'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Tax Aware', badgeIcon: '💰')),
  ],
);
