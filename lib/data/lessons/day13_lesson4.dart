import '../../models/lesson_models.dart';

final day13Lesson4 = LessonData(
  day: 13,
  title: "Reading Financial Statements",
  emoji: '📑',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Three Statements',
      imagePath: 'assets/images/lessons/day13/lesson4/story.png',
      imagePrompt: 'cartoon three financial statement documents: income statement, balance sheet, cash flow',
      content: '''Every company produces three main financial statements.

Income Statement, Balance Sheet, and Cash Flow Statement.

Together they tell the complete financial story!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Income Statement',
      imagePath: 'assets/images/lessons/day13/lesson4/content1.png',
      imagePrompt: 'cartoon income statement: revenue minus expenses equals profit, P&L visualization',
      content: '''The income statement shows:''',
      bullets: [
        BulletPoint(icon: '💵', title: 'Revenue', description: 'Money coming in from sales.'),
        BulletPoint(icon: '💸', title: 'Expenses', description: 'Costs of running the business.'),
        BulletPoint(icon: '💰', title: 'Profit', description: 'What is left after expenses.'),
        BulletPoint(icon: '📅', title: 'Period', description: 'Shows results for a time period.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Balance Sheet & Cash Flow',
      imagePath: 'assets/images/lessons/day13/lesson4/content2.png',
      imagePrompt: 'cartoon balance sheet as scale with assets and liabilities, cash flow as money pipes',
      content: '''The other two statements:''',
      bullets: [
        BulletPoint(icon: '⚖️', title: 'Balance Sheet', description: 'Assets vs liabilities at a point in time.'),
        BulletPoint(icon: '🏠', title: 'Assets', description: 'What the company owns.'),
        BulletPoint(icon: '💳', title: 'Liabilities', description: 'What the company owes.'),
        BulletPoint(icon: '💧', title: 'Cash Flow', description: 'Actual cash moving in and out.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Statement Check',
      imagePath: 'assets/images/lessons/day13/lesson4/game1.png',
      imagePrompt: 'cartoon income statement purpose',
      gameData: GameData(
        type: 'choice',
        instruction: 'The income statement shows:',
        options: [GameOption(label: 'What company owns', emoji: '🏠'), GameOption(label: 'Revenue, expenses, and profit', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Pop',
      imagePath: 'assets/images/lessons/day13/lesson4/game2.png',
      imagePrompt: 'cartoon balance sheet assets vs liabilities',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The balance sheet compares:',
        options: [GameOption(label: 'Revenue and expenses', emoji: '💵'), GameOption(label: 'Assets and liabilities', emoji: '⚖️'), GameOption(label: 'Past and future', emoji: '⏰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day13/lesson4/question.png',
      imagePrompt: 'cartoon cash flow statement',
      questionData: QuestionData(
        question: 'The cash flow statement shows:',
        options: ['Only profits', 'Actual cash moving in and out', 'Stock price', 'Employee count'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Statements Mission',
      imagePath: 'assets/images/lessons/day13/lesson4/mission.png',
      imagePrompt: 'cartoon three financial statements together',
      missionData: MissionData(
        mission: 'Why look at all three financial statements?',
        options: ['One is enough', 'They tell different parts of the financial story', 'They all show the same thing', 'Only accountants need them'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Statement Reader', badgeIcon: '📑')),
  ],
);
