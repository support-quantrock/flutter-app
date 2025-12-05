import '../../models/lesson_models.dart';

final day25Lesson3 = LessonData(
  day: 25,
  title: "The Myth of Market Timing",
  emoji: '⏰',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Can You Time the Market?',
      imagePath: 'assets/images/lessons/day25/lesson3/story.png',
      imagePrompt: 'cartoon investor trying to time market with crystal ball, question marks',
      content: '''Many investors try to time the market perfectly.

Buy low, sell high sounds easy!

But timing consistently is nearly impossible.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Timing Fails',
      imagePath: 'assets/images/lessons/day25/lesson3/content1.png',
      imagePrompt: 'cartoon reasons market timing fails: unpredictable, emotional decisions, missing best days',
      content: '''Problems with market timing:''',
      bullets: [
        BulletPoint(icon: '🔮', title: 'Unpredictable', description: 'No one knows the future.'),
        BulletPoint(icon: '😰', title: 'Emotional', description: 'Fear and greed cloud judgment.'),
        BulletPoint(icon: '📅', title: 'Missing Days', description: 'Best days follow worst days.'),
        BulletPoint(icon: '💸', title: 'Transaction Costs', description: 'Frequent trading is expensive.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Missing the Best Days',
      imagePath: 'assets/images/lessons/day25/lesson3/content2.png',
      imagePrompt: 'cartoon chart showing returns when missing best market days',
      content: '''The cost of missing rallies:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Best Days Matter', description: 'Few days drive most returns.'),
        BulletPoint(icon: '😱', title: 'After Crashes', description: 'Best days often follow worst.'),
        BulletPoint(icon: '💰', title: 'Huge Impact', description: 'Missing 10 best days cuts returns dramatically.'),
        BulletPoint(icon: '🧘', title: 'Stay Invested', description: 'Time in market beats timing.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Timing Check',
      imagePath: 'assets/images/lessons/day25/lesson3/game1.png',
      imagePrompt: 'cartoon time in market vs timing market',
      gameData: GameData(
        type: 'choice',
        instruction: 'Research shows that for most investors:',
        options: [GameOption(label: 'Timing the market works best', emoji: '⏰'), GameOption(label: 'Time in market beats timing', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Best Days Pop',
      imagePath: 'assets/images/lessons/day25/lesson3/game2.png',
      imagePrompt: 'cartoon best market days timing',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The best market days often occur:',
        options: [GameOption(label: 'During calm periods', emoji: '😌'), GameOption(label: 'Right after the worst days', emoji: '📈'), GameOption(label: 'At scheduled times', emoji: '📅')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day25/lesson3/question.png',
      imagePrompt: 'cartoon professional market timers',
      questionData: QuestionData(
        question: 'Even professional investors:',
        options: ['Always time markets perfectly', 'Rarely beat buy-and-hold consistently', 'Can predict every crash', 'Never lose money'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Timing Mission',
      imagePath: 'assets/images/lessons/day25/lesson3/mission.png',
      imagePrompt: 'cartoon staying invested through volatility',
      missionData: MissionData(
        mission: 'Instead of timing the market, most should:',
        options: ['Trade daily', 'Stay invested with a long-term plan', 'Wait for perfect entry', 'Only buy at all-time highs'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Timing Skeptic', badgeIcon: '⏰')),
  ],
);
