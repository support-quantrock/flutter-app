import '../../models/lesson_models.dart';

final day12Lesson1 = LessonData(
  day: 12,
  title: "Moving Averages",
  emoji: '〰️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Smoothing the Noise',
      imagePath: 'assets/images/lessons/day12/lesson1/story.png',
      imagePrompt: 'cartoon jagged price line with smooth moving average line overlay, noise reduction concept',
      content: '''Moving averages smooth out price data.

They show the average price over a period of time.

This helps you see the real trend without the daily noise!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Moving Averages',
      imagePath: 'assets/images/lessons/day12/lesson1/content1.png',
      imagePrompt: 'cartoon SMA vs EMA comparison, simple calculation vs weighted recent prices',
      content: '''Two main types:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'SMA', description: 'Simple Moving Average - equal weight to all prices.'),
        BulletPoint(icon: '⚡', title: 'EMA', description: 'Exponential MA - more weight to recent prices.'),
        BulletPoint(icon: '🐢', title: 'SMA Slower', description: 'Reacts more slowly to price changes.'),
        BulletPoint(icon: '🐇', title: 'EMA Faster', description: 'Reacts quicker to new price moves.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Popular Periods',
      imagePath: 'assets/images/lessons/day12/lesson1/content2.png',
      imagePrompt: 'cartoon different moving average periods: 20, 50, 200 day lines on chart',
      content: '''Commonly used moving averages:''',
      bullets: [
        BulletPoint(icon: '2️⃣0️⃣', title: '20-Day', description: 'Short-term trend indicator.'),
        BulletPoint(icon: '5️⃣0️⃣', title: '50-Day', description: 'Medium-term trend indicator.'),
        BulletPoint(icon: '💯', title: '200-Day', description: 'Long-term trend indicator.'),
        BulletPoint(icon: '✨', title: 'Golden/Death Cross', description: '50 crossing 200 is big signal.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'MA Check',
      imagePath: 'assets/images/lessons/day12/lesson1/game1.png',
      imagePrompt: 'cartoon moving average purpose',
      gameData: GameData(
        type: 'choice',
        instruction: 'Moving averages help you see:',
        options: [GameOption(label: 'More noise', emoji: '📢'), GameOption(label: 'The underlying trend', emoji: '〰️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Pop',
      imagePath: 'assets/images/lessons/day12/lesson1/game2.png',
      imagePrompt: 'cartoon EMA vs SMA speed comparison',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which moving average reacts faster?',
        options: [GameOption(label: 'SMA', emoji: '🐢'), GameOption(label: 'EMA', emoji: '🐇'), GameOption(label: 'Both same', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day12/lesson1/question.png',
      imagePrompt: 'cartoon 200-day moving average',
      questionData: QuestionData(
        question: 'The 200-day moving average shows:',
        options: ['Short-term trend', 'Long-term trend', 'No trend', 'Daily volatility'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'MA Mission',
      imagePath: 'assets/images/lessons/day12/lesson1/mission.png',
      imagePrompt: 'cartoon golden cross signal on chart',
      missionData: MissionData(
        mission: 'What is a "golden cross"?',
        options: ['A type of jewelry', '50-day MA crosses above 200-day MA', 'Any price increase', 'A trading error'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'MA Expert', badgeIcon: '〰️')),
  ],
);
