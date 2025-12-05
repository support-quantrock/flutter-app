import '../../models/lesson_models.dart';

final day26Lesson3 = LessonData(
  day: 26,
  title: "Portfolio Tracking",
  emoji: '📈',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Know Your Holdings',
      imagePath: 'assets/images/lessons/day26/lesson3/story.png',
      imagePrompt: 'cartoon portfolio tracker showing holdings, performance, allocation charts',
      content: '''Track your investments to stay on target.

Portfolio trackers show your performance.

Regular monitoring keeps you informed!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What to Track',
      imagePath: 'assets/images/lessons/day26/lesson3/content1.png',
      imagePrompt: 'cartoon portfolio metrics: total value, returns, allocation, dividends',
      content: '''Key metrics to monitor:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'Total Value', description: 'What your portfolio is worth.'),
        BulletPoint(icon: '📊', title: 'Returns', description: 'Gains or losses over time.'),
        BulletPoint(icon: '🥧', title: 'Allocation', description: 'How assets are distributed.'),
        BulletPoint(icon: '💵', title: 'Income', description: 'Dividends and interest received.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Tracking Tools',
      imagePath: 'assets/images/lessons/day26/lesson3/content2.png',
      imagePrompt: 'cartoon portfolio tracking options: brokerage tools, apps, spreadsheets',
      content: '''Ways to track your portfolio:''',
      bullets: [
        BulletPoint(icon: '🏦', title: 'Brokerage Tools', description: 'Built-in tracking features.'),
        BulletPoint(icon: '📱', title: 'Apps', description: 'Dedicated portfolio apps.'),
        BulletPoint(icon: '📋', title: 'Spreadsheets', description: 'DIY with Excel or Sheets.'),
        BulletPoint(icon: '🔗', title: 'Aggregators', description: 'Link multiple accounts.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Metric Check',
      imagePath: 'assets/images/lessons/day26/lesson3/game1.png',
      imagePrompt: 'cartoon asset allocation pie chart',
      gameData: GameData(
        type: 'choice',
        instruction: 'Asset allocation shows:',
        options: [GameOption(label: 'Only your total balance', emoji: '💰'), GameOption(label: 'How your investments are distributed', emoji: '🥧')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Tool Pop',
      imagePath: 'assets/images/lessons/day26/lesson3/game2.png',
      imagePrompt: 'cartoon portfolio aggregator',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Portfolio aggregators help you:',
        options: [GameOption(label: 'Track one account only', emoji: '1️⃣'), GameOption(label: 'View multiple accounts together', emoji: '🔗'), GameOption(label: 'Delete your investments', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day26/lesson3/question.png',
      imagePrompt: 'cartoon regular portfolio review',
      questionData: QuestionData(
        question: 'How often should you review your portfolio?',
        options: ['Never', 'Every minute', 'Regularly but not obsessively', 'Only when selling'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Tracking Mission',
      imagePath: 'assets/images/lessons/day26/lesson3/mission.png',
      imagePrompt: 'cartoon portfolio tracking purpose',
      missionData: MissionData(
        mission: 'Portfolio tracking helps you:',
        options: ['Ignore your investments', 'Stay informed and on target', 'Trade more often', 'Panic about daily changes'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Tracker Pro', badgeIcon: '📈')),
  ],
);
