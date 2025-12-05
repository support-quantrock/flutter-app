import '../../models/lesson_models.dart';

final day16Lesson5 = LessonData(
  day: 16,
  title: "Dollar Cost Averaging",
  emoji: '📅',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Invest Steadily',
      imagePath: 'assets/images/lessons/day16/lesson5/story.png',
      imagePrompt: 'cartoon investor adding same amount monthly, calm during market ups and downs',
      content: '''Dollar cost averaging means investing the same amount regularly.

Market up? You buy less shares.
Market down? You buy more shares.

Over time, you average out the price!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How DCA Works',
      imagePath: 'assets/images/lessons/day16/lesson5/content1.png',
      imagePrompt: 'cartoon monthly investment buying different share quantities at different prices',
      content: '''Dollar cost averaging explained:''',
      bullets: [
        BulletPoint(icon: '💵', title: 'Fixed Amount', description: 'Invest same dollar amount regularly.'),
        BulletPoint(icon: '📈', title: 'Prices High', description: 'Buy fewer shares.'),
        BulletPoint(icon: '📉', title: 'Prices Low', description: 'Buy more shares.'),
        BulletPoint(icon: '⚖️', title: 'Average Out', description: 'Smooths your purchase price.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'DCA Benefits',
      imagePath: 'assets/images/lessons/day16/lesson5/content2.png',
      imagePrompt: 'cartoon DCA benefits: removes emotion, no timing needed, disciplined habit',
      content: '''Why DCA works well:''',
      bullets: [
        BulletPoint(icon: '🧠', title: 'Removes Emotion', description: 'No panic buying or selling.'),
        BulletPoint(icon: '⏰', title: 'No Timing', description: 'Do not need to predict market.'),
        BulletPoint(icon: '🎯', title: 'Discipline', description: 'Builds consistent investing habit.'),
        BulletPoint(icon: '😌', title: 'Less Stress', description: 'Do not worry about perfect entry.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'DCA Check',
      imagePath: 'assets/images/lessons/day16/lesson5/game1.png',
      imagePrompt: 'cartoon DCA during market dip',
      gameData: GameData(
        type: 'choice',
        instruction: 'When prices drop, DCA means you:',
        options: [GameOption(label: 'Buy fewer shares', emoji: '📉'), GameOption(label: 'Buy more shares', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Benefit Pop',
      imagePath: 'assets/images/lessons/day16/lesson5/game2.png',
      imagePrompt: 'cartoon DCA emotional benefit',
      gameData: GameData(
        type: 'balloon',
        instruction: 'DCA helps remove:',
        options: [GameOption(label: 'Profits', emoji: '💰'), GameOption(label: 'Emotional decisions', emoji: '🧠'), GameOption(label: 'All risk', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day16/lesson5/question.png',
      imagePrompt: 'cartoon DCA regular investing',
      questionData: QuestionData(
        question: 'DCA means investing:',
        options: ['All at once', 'Same amount at regular intervals', 'Only when market is low', 'Random amounts randomly'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'DCA Mission',
      imagePath: 'assets/images/lessons/day16/lesson5/mission.png',
      imagePrompt: 'cartoon DCA vs market timing',
      missionData: MissionData(
        mission: 'Why is DCA good for beginners?',
        options: ['Requires perfect timing', 'No need to time the market', 'Only for experts', 'Guarantees losses'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Steady Investor', badgeIcon: '📅')),
  ],
);
