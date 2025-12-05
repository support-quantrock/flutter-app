import '../../models/lesson_models.dart';

final day26Lesson2 = LessonData(
  day: 26,
  title: "Research Resources",
  emoji: '🔬',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Doing Your Homework',
      imagePath: 'assets/images/lessons/day26/lesson2/story.png',
      imagePrompt: 'cartoon investor researching: reading reports, analyzing data, checking news',
      content: '''Good investors research before buying.

Many free and paid resources exist.

Knowledge is your best investment tool!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Free Resources',
      imagePath: 'assets/images/lessons/day26/lesson2/content1.png',
      imagePrompt: 'cartoon free investment research: company filings, financial news, stock screeners',
      content: '''Free research tools:''',
      bullets: [
        BulletPoint(icon: '📄', title: 'SEC Filings', description: 'Official company reports (EDGAR).'),
        BulletPoint(icon: '📰', title: 'Financial News', description: 'Market updates and analysis.'),
        BulletPoint(icon: '🔍', title: 'Stock Screeners', description: 'Filter stocks by criteria.'),
        BulletPoint(icon: '📊', title: 'Yahoo Finance', description: 'Free quotes and data.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Paid Resources',
      imagePath: 'assets/images/lessons/day26/lesson2/content2.png',
      imagePrompt: 'cartoon premium research: analyst reports, premium data services, research subscriptions',
      content: '''Premium research options:''',
      bullets: [
        BulletPoint(icon: '📋', title: 'Analyst Reports', description: 'Professional research.'),
        BulletPoint(icon: '💹', title: 'Premium Data', description: 'Detailed financial data.'),
        BulletPoint(icon: '🎓', title: 'Research Services', description: 'Morningstar, etc.'),
        BulletPoint(icon: '📈', title: 'Trading Platforms', description: 'Advanced analysis tools.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Source Check',
      imagePath: 'assets/images/lessons/day26/lesson2/game1.png',
      imagePrompt: 'cartoon SEC EDGAR filings',
      gameData: GameData(
        type: 'choice',
        instruction: 'Official company filings can be found at:',
        options: [GameOption(label: 'Random blogs', emoji: '📝'), GameOption(label: 'SEC EDGAR database', emoji: '📄')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Research Pop',
      imagePath: 'assets/images/lessons/day26/lesson2/game2.png',
      imagePrompt: 'cartoon stock screener',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Stock screeners help you:',
        options: [GameOption(label: 'Watch movies', emoji: '🎬'), GameOption(label: 'Filter stocks by criteria', emoji: '🔍'), GameOption(label: 'Send emails', emoji: '📧')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day26/lesson2/question.png',
      imagePrompt: 'cartoon investment research importance',
      questionData: QuestionData(
        question: 'Before investing, you should:',
        options: ['Never research', 'Research the investment thoroughly', 'Only follow tips', 'Guess randomly'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Research Mission',
      imagePath: 'assets/images/lessons/day26/lesson2/mission.png',
      imagePrompt: 'cartoon multiple research sources',
      missionData: MissionData(
        mission: 'Good research involves:',
        options: ['One source only', 'Multiple reliable sources', 'No research needed', 'Only social media'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Researcher', badgeIcon: '🔬')),
  ],
);
