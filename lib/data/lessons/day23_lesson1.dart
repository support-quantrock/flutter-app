import '../../models/lesson_models.dart';

final day23Lesson1 = LessonData(
  day: 23,
  title: "Real Estate Basics",
  emoji: '🏠',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Investing in Property',
      imagePath: 'assets/images/lessons/day23/lesson1/story.png',
      imagePrompt: 'cartoon house as investment with appreciation arrow and rent money flowing in',
      content: '''Real estate is one of the oldest investments.

You can make money from rent and property appreciation.

It offers unique benefits that stocks do not!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Real Estate',
      imagePath: 'assets/images/lessons/day23/lesson1/content1.png',
      imagePrompt: 'cartoon real estate benefits: tangible asset, income, appreciation, tax benefits',
      content: '''Benefits of real estate:''',
      bullets: [
        BulletPoint(icon: '🏠', title: 'Tangible', description: 'Physical asset you can see.'),
        BulletPoint(icon: '💵', title: 'Income', description: 'Rental payments provide cash flow.'),
        BulletPoint(icon: '📈', title: 'Appreciation', description: 'Property values tend to rise.'),
        BulletPoint(icon: '💰', title: 'Tax Benefits', description: 'Various deductions available.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Challenges',
      imagePath: 'assets/images/lessons/day23/lesson1/content2.png',
      imagePrompt: 'cartoon real estate challenges: large investment, management, illiquidity',
      content: '''Real estate challenges:''',
      bullets: [
        BulletPoint(icon: '💸', title: 'Capital Needed', description: 'Large upfront investment.'),
        BulletPoint(icon: '🔧', title: 'Management', description: 'Properties need maintenance.'),
        BulletPoint(icon: '🔒', title: 'Illiquid', description: 'Hard to sell quickly.'),
        BulletPoint(icon: '📍', title: 'Location Risk', description: 'Value depends on area.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Benefit Check',
      imagePath: 'assets/images/lessons/day23/lesson1/game1.png',
      imagePrompt: 'cartoon rental income benefit',
      gameData: GameData(
        type: 'choice',
        instruction: 'Real estate can provide regular income through:',
        options: [GameOption(label: 'Dividends', emoji: '📊'), GameOption(label: 'Rent payments', emoji: '💵')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Challenge Pop',
      imagePath: 'assets/images/lessons/day23/lesson1/game2.png',
      imagePrompt: 'cartoon real estate illiquidity',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Compared to stocks, real estate is:',
        options: [GameOption(label: 'Easy to sell quickly', emoji: '⚡'), GameOption(label: 'Harder to sell quickly', emoji: '🔒'), GameOption(label: 'Same liquidity', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day23/lesson1/question.png',
      imagePrompt: 'cartoon property appreciation',
      questionData: QuestionData(
        question: 'Real estate appreciation means:',
        options: ['Property loses value', 'Property gains value over time', 'Rent decreases', 'Taxes increase'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Real Estate Mission',
      imagePath: 'assets/images/lessons/day23/lesson1/mission.png',
      imagePrompt: 'cartoon real estate as tangible investment',
      missionData: MissionData(
        mission: 'What makes real estate different from stocks?',
        options: ['No difference', 'It is a tangible physical asset', 'Stocks are better', 'Real estate has no value'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Property Starter', badgeIcon: '🏠')),
  ],
);
