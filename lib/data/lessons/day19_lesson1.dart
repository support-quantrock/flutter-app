import '../../models/lesson_models.dart';

final day19Lesson1 = LessonData(
  day: 19,
  title: "Active vs Passive Debate",
  emoji: '⚔️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Two Investment Styles',
      imagePath: 'assets/images/lessons/day19/lesson1/story.png',
      imagePrompt: 'cartoon active manager working hard picking stocks vs passive investor relaxing with index fund',
      content: '''There are two main ways to invest.

Active: Try to beat the market.
Passive: Match the market.

This debate has raged for decades!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Active Investing',
      imagePath: 'assets/images/lessons/day19/lesson1/content1.png',
      imagePrompt: 'cartoon active manager analyzing stocks, trying to find winners',
      content: '''What active investing means:''',
      bullets: [
        BulletPoint(icon: '🔍', title: 'Stock Picking', description: 'Try to find winning stocks.'),
        BulletPoint(icon: '⏰', title: 'Market Timing', description: 'Try to buy low, sell high.'),
        BulletPoint(icon: '💰', title: 'Higher Fees', description: 'Pay for manager expertise.'),
        BulletPoint(icon: '🎯', title: 'Beat Market', description: 'Goal is to outperform indexes.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Passive Investing',
      imagePath: 'assets/images/lessons/day19/lesson1/content2.png',
      imagePrompt: 'cartoon passive investor simply tracking index, low cost, simple approach',
      content: '''What passive investing means:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Track Index', description: 'Match market returns.'),
        BulletPoint(icon: '💵', title: 'Low Fees', description: 'Minimal management costs.'),
        BulletPoint(icon: '😌', title: 'Simple', description: 'No research or timing needed.'),
        BulletPoint(icon: '⏳', title: 'Long Term', description: 'Buy and hold approach.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Style Check',
      imagePath: 'assets/images/lessons/day19/lesson1/game1.png',
      imagePrompt: 'cartoon active vs passive comparison',
      gameData: GameData(
        type: 'choice',
        instruction: 'Active investing tries to:',
        options: [GameOption(label: 'Match the market', emoji: '='), GameOption(label: 'Beat the market', emoji: '🏆')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Fee Pop',
      imagePath: 'assets/images/lessons/day19/lesson1/game2.png',
      imagePrompt: 'cartoon fee comparison active vs passive',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Passive investing typically has:',
        options: [GameOption(label: 'Higher fees', emoji: '💸'), GameOption(label: 'Lower fees', emoji: '💵'), GameOption(label: 'Same fees', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day19/lesson1/question.png',
      imagePrompt: 'cartoon index tracking concept',
      questionData: QuestionData(
        question: 'Passive investing aims to:',
        options: ['Beat the market', 'Match the market', 'Avoid all stocks', 'Trade daily'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Debate Mission',
      imagePath: 'assets/images/lessons/day19/lesson1/mission.png',
      imagePrompt: 'cartoon investor choosing between active and passive',
      missionData: MissionData(
        mission: 'The main difference between active and passive is:',
        options: ['No difference', 'Active tries to beat market, passive matches it', 'Passive is always better', 'Active is always better'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Style Scholar', badgeIcon: '⚔️')),
  ],
);
