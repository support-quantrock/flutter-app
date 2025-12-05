import '../../models/lesson_models.dart';

final day16Lesson4 = LessonData(
  day: 16,
  title: "Index Investing",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Own the Whole Market',
      imagePath: 'assets/images/lessons/day16/lesson4/story.png',
      imagePrompt: 'cartoon index fund as basket containing all stocks in market, simple investing',
      content: '''Index investing buys the whole market at once.

Instead of picking winners, you own everything!

Simple, low-cost, and beats most active managers.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Index Funds Work',
      imagePath: 'assets/images/lessons/day16/lesson4/content1.png',
      imagePrompt: 'cartoon index fund tracking S&P 500, automatic diversification',
      content: '''Index fund basics:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Track Index', description: 'Match a market index like S&P 500.'),
        BulletPoint(icon: '💰', title: 'Low Cost', description: 'Minimal management = low fees.'),
        BulletPoint(icon: '🌈', title: 'Diversified', description: 'Own hundreds of stocks at once.'),
        BulletPoint(icon: '🤖', title: 'Passive', description: 'No active stock picking.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Index Funds Win',
      imagePath: 'assets/images/lessons/day16/lesson4/content2.png',
      imagePrompt: 'cartoon index fund beating most active managers over time, low fees winning',
      content: '''The case for index investing:''',
      bullets: [
        BulletPoint(icon: '🏆', title: 'Beat Most', description: 'Outperform most active managers.'),
        BulletPoint(icon: '📉', title: 'Low Fees', description: 'Fees compound - lower is better.'),
        BulletPoint(icon: '😌', title: 'Simple', description: 'No research or timing needed.'),
        BulletPoint(icon: '🎯', title: 'Market Returns', description: 'Get what the market gives.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Index Check',
      imagePath: 'assets/images/lessons/day16/lesson4/game1.png',
      imagePrompt: 'cartoon index fund diversification',
      gameData: GameData(
        type: 'choice',
        instruction: 'Index funds provide:',
        options: [GameOption(label: 'Single stock focus', emoji: '1️⃣'), GameOption(label: 'Instant diversification', emoji: '🌈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Fee Pop',
      imagePath: 'assets/images/lessons/day16/lesson4/game2.png',
      imagePrompt: 'cartoon low fee advantage',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Index funds typically have:',
        options: [GameOption(label: 'High fees', emoji: '💸'), GameOption(label: 'Low fees', emoji: '💰'), GameOption(label: 'No returns', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day16/lesson4/question.png',
      imagePrompt: 'cartoon index fund vs active manager performance',
      questionData: QuestionData(
        question: 'Over time, index funds beat:',
        options: ['No one', 'Most active fund managers', 'All investments', 'Only bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Index Mission',
      imagePath: 'assets/images/lessons/day16/lesson4/mission.png',
      imagePrompt: 'cartoon S&P 500 index fund',
      missionData: MissionData(
        mission: 'An S&P 500 index fund holds:',
        options: ['One company', '500 largest US companies', 'Only tech stocks', 'Only bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Index Investor', badgeIcon: '📊')),
  ],
);
