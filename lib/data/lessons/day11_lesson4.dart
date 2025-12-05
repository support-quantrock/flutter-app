import '../../models/lesson_models.dart';

final day11Lesson4 = LessonData(
  day: 11,
  title: "Trend Lines",
  emoji: '📈',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Following the Trend',
      imagePath: 'assets/images/lessons/day11/lesson4/story.png',
      imagePrompt: 'cartoon trend lines drawn on price chart, uptrend and downtrend visualization',
      content: '''The trend is your friend - until it ends!

Trend lines connect price points to show direction.

Uptrend, downtrend, or sideways - knowing the trend helps you trade!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Trends',
      imagePath: 'assets/images/lessons/day11/lesson4/content1.png',
      imagePrompt: 'cartoon three trend types: uptrend stairs up, downtrend stairs down, sideways flat',
      content: '''The three market trends:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Uptrend', description: 'Higher highs and higher lows.'),
        BulletPoint(icon: '📉', title: 'Downtrend', description: 'Lower highs and lower lows.'),
        BulletPoint(icon: '➡️', title: 'Sideways', description: 'Price moves in a range.'),
        BulletPoint(icon: '⏰', title: 'Timeframes', description: 'Trends exist in all timeframes.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Drawing Trend Lines',
      imagePath: 'assets/images/lessons/day11/lesson4/content2.png',
      imagePrompt: 'cartoon how to draw trend lines connecting lows in uptrend and highs in downtrend',
      content: '''How to draw trend lines:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Uptrend Line', description: 'Connect the rising lows.'),
        BulletPoint(icon: '📉', title: 'Downtrend Line', description: 'Connect the falling highs.'),
        BulletPoint(icon: '✌️', title: 'Two Points Minimum', description: 'Need at least 2 points to draw.'),
        BulletPoint(icon: '💪', title: 'More Touches', description: 'More touches = stronger trend line.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Trend Check',
      imagePath: 'assets/images/lessons/day11/lesson4/game1.png',
      imagePrompt: 'cartoon uptrend pattern',
      gameData: GameData(
        type: 'choice',
        instruction: 'An uptrend shows:',
        options: [GameOption(label: 'Lower highs and lower lows', emoji: '📉'), GameOption(label: 'Higher highs and higher lows', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Draw Pop',
      imagePath: 'assets/images/lessons/day11/lesson4/game2.png',
      imagePrompt: 'cartoon trend line drawing',
      gameData: GameData(
        type: 'balloon',
        instruction: 'In an uptrend, you connect:',
        options: [GameOption(label: 'The highs', emoji: '⬆️'), GameOption(label: 'The lows', emoji: '⬇️'), GameOption(label: 'Random points', emoji: '❓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day11/lesson4/question.png',
      imagePrompt: 'cartoon trend line strength',
      questionData: QuestionData(
        question: 'A trend line is stronger when it has:',
        options: ['Only one touch', 'Multiple touches', 'No touches', 'Different colors'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Trend Mission',
      imagePath: 'assets/images/lessons/day11/lesson4/mission.png',
      imagePrompt: 'cartoon trader following the trend',
      missionData: MissionData(
        mission: 'Why is "the trend is your friend" a common saying?',
        options: ['Trends are always friendly', 'Trading with the trend often works better', 'Trends never end', 'It rhymes nicely'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Trend Tracker', badgeIcon: '📈')),
  ],
);
