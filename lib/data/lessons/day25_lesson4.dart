import '../../models/lesson_models.dart';

final day25Lesson4 = LessonData(
  day: 25,
  title: "Dollar-Cost Averaging Revisited",
  emoji: '💵',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'A Better Approach',
      imagePath: 'assets/images/lessons/day25/lesson4/story.png',
      imagePrompt: 'cartoon dollar-cost averaging: regular monthly investments through market ups and downs',
      content: '''Dollar-cost averaging beats timing attempts.

Invest the same amount regularly.

You buy more shares when prices are low!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How DCA Works',
      imagePath: 'assets/images/lessons/day25/lesson4/content1.png',
      imagePrompt: 'cartoon DCA mechanics: same dollar amount, more shares when cheap, fewer when expensive',
      content: '''The DCA strategy:''',
      bullets: [
        BulletPoint(icon: '📅', title: 'Regular Schedule', description: 'Invest weekly or monthly.'),
        BulletPoint(icon: '💵', title: 'Fixed Amount', description: 'Same dollars each time.'),
        BulletPoint(icon: '📉', title: 'Low Prices', description: 'Buy more shares cheap.'),
        BulletPoint(icon: '📈', title: 'High Prices', description: 'Buy fewer shares expensive.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'DCA Benefits',
      imagePath: 'assets/images/lessons/day25/lesson4/content2.png',
      imagePrompt: 'cartoon DCA benefits: removes emotion, automatic, average cost',
      content: '''Why DCA works well:''',
      bullets: [
        BulletPoint(icon: '🧠', title: 'Removes Emotion', description: 'No timing decisions needed.'),
        BulletPoint(icon: '🤖', title: 'Automatic', description: 'Set it and forget it.'),
        BulletPoint(icon: '⚖️', title: 'Average Cost', description: 'Smooths out price fluctuations.'),
        BulletPoint(icon: '😌', title: 'Less Stress', description: 'No worry about entry points.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'DCA Check',
      imagePath: 'assets/images/lessons/day25/lesson4/game1.png',
      imagePrompt: 'cartoon DCA buying more when prices drop',
      gameData: GameData(
        type: 'choice',
        instruction: 'With DCA, when prices drop you:',
        options: [GameOption(label: 'Buy fewer shares', emoji: '📉'), GameOption(label: 'Buy more shares with the same money', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Benefit Pop',
      imagePath: 'assets/images/lessons/day25/lesson4/game2.png',
      imagePrompt: 'cartoon DCA removing emotion',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A key benefit of DCA is:',
        options: [GameOption(label: 'Guaranteeing profits', emoji: '💰'), GameOption(label: 'Removing emotional decisions', emoji: '🧠'), GameOption(label: 'Timing the market perfectly', emoji: '⏰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day25/lesson4/question.png',
      imagePrompt: 'cartoon DCA schedule',
      questionData: QuestionData(
        question: 'Dollar-cost averaging involves investing:',
        options: ['All at once when prices seem low', 'Fixed amounts at regular intervals', 'Only during bull markets', 'Random amounts randomly'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'DCA Mission',
      imagePath: 'assets/images/lessons/day25/lesson4/mission.png',
      imagePrompt: 'cartoon setting up automatic investments',
      missionData: MissionData(
        mission: 'The best way to implement DCA is:',
        options: ['Manual trades when you remember', 'Automatic recurring investments', 'Waiting for perfect prices', 'Trading daily'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'DCA Master', badgeIcon: '💵')),
  ],
);
