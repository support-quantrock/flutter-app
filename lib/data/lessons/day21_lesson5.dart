import '../../models/lesson_models.dart';

final day21Lesson5 = LessonData(
  day: 21,
  title: "Tax Planning Tips",
  emoji: '📋',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Smart Tax Moves',
      imagePath: 'assets/images/lessons/day21/lesson5/story.png',
      imagePrompt: 'cartoon investor with checklist of tax planning strategies, organized approach',
      content: '''Good tax planning is year-round.

Do not wait until tax season!

Small moves can add up to big savings over time.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Key Strategies',
      imagePath: 'assets/images/lessons/day21/lesson5/content1.png',
      imagePrompt: 'cartoon tax planning strategies: max contributions, hold long-term, use losses',
      content: '''Tax-saving strategies:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'Max Contributions', description: 'Use full 401k and IRA limits.'),
        BulletPoint(icon: '📅', title: 'Hold Long Term', description: 'Get lower capital gains rates.'),
        BulletPoint(icon: '🌾', title: 'Harvest Losses', description: 'Offset gains with losses.'),
        BulletPoint(icon: '🎁', title: 'Charitable Giving', description: 'Donate appreciated stock.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Things to Avoid',
      imagePath: 'assets/images/lessons/day21/lesson5/content2.png',
      imagePrompt: 'cartoon tax mistakes to avoid: frequent trading, ignoring accounts, missing deadlines',
      content: '''Common tax mistakes:''',
      bullets: [
        BulletPoint(icon: '🔄', title: 'Over-Trading', description: 'Creates short-term gains.'),
        BulletPoint(icon: '🙈', title: 'Ignoring Accounts', description: 'Missing tax-advantaged space.'),
        BulletPoint(icon: '⏰', title: 'Missing Deadlines', description: 'IRA contribution cutoffs.'),
        BulletPoint(icon: '📝', title: 'Poor Records', description: 'Hard to calculate cost basis.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Strategy Check',
      imagePath: 'assets/images/lessons/day21/lesson5/game1.png',
      imagePrompt: 'cartoon maxing retirement contributions',
      gameData: GameData(
        type: 'choice',
        instruction: 'A key tax strategy is:',
        options: [GameOption(label: 'Trade as often as possible', emoji: '🔄'), GameOption(label: 'Max retirement account contributions', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Mistake Pop',
      imagePath: 'assets/images/lessons/day21/lesson5/game2.png',
      imagePrompt: 'cartoon frequent trading tax problem',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Frequent trading is bad for taxes because it:',
        options: [GameOption(label: 'Reduces taxes', emoji: '📉'), GameOption(label: 'Creates short-term gains taxed higher', emoji: '💸'), GameOption(label: 'Has no effect', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day21/lesson5/question.png',
      imagePrompt: 'cartoon donating appreciated stock',
      questionData: QuestionData(
        question: 'Donating appreciated stock to charity:',
        options: ['Wastes money', 'Can be more tax-efficient than selling and donating cash', 'Is illegal', 'Increases taxes'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Planning Mission',
      imagePath: 'assets/images/lessons/day21/lesson5/mission.png',
      imagePrompt: 'cartoon year-round tax planning',
      missionData: MissionData(
        mission: 'When should you think about investment taxes?',
        options: ['Only in April', 'Year-round as part of your strategy', 'Never', 'Only when audited'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Tax Planner', badgeIcon: '📋')),
  ],
);
