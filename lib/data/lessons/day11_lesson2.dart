import '../../models/lesson_models.dart';

final day11Lesson2 = LessonData(
  day: 11,
  title: "Candlestick Charts",
  emoji: '🕯️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Language of Candles',
      imagePath: 'assets/images/lessons/day11/lesson2/story.png',
      imagePrompt: 'cartoon candlestick chart with individual candles explained, showing green and red candles',
      content: '''Candlestick charts are the most popular chart type.

Each candle shows open, high, low, and close prices.

Green means price went up, red means it went down!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Reading a Candle',
      imagePath: 'assets/images/lessons/day11/lesson2/content1.png',
      imagePrompt: 'cartoon single candlestick anatomy: body, wicks, open, close, high, low labeled',
      content: '''Parts of a candlestick:''',
      bullets: [
        BulletPoint(icon: '📦', title: 'Body', description: 'Thick part shows open to close range.'),
        BulletPoint(icon: '📍', title: 'Wicks/Shadows', description: 'Thin lines show high and low.'),
        BulletPoint(icon: '🟢', title: 'Green/White', description: 'Close higher than open (bullish).'),
        BulletPoint(icon: '🔴', title: 'Red/Black', description: 'Close lower than open (bearish).'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Common Candle Patterns',
      imagePath: 'assets/images/lessons/day11/lesson2/content2.png',
      imagePrompt: 'cartoon common candlestick patterns: doji, hammer, engulfing, shooting star',
      content: '''Popular candlestick patterns:''',
      bullets: [
        BulletPoint(icon: '➕', title: 'Doji', description: 'Open and close nearly equal - indecision.'),
        BulletPoint(icon: '🔨', title: 'Hammer', description: 'Long lower wick - potential reversal up.'),
        BulletPoint(icon: '⭐', title: 'Shooting Star', description: 'Long upper wick - potential reversal down.'),
        BulletPoint(icon: '🌊', title: 'Engulfing', description: 'Big candle swallows previous one.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Candle Colors',
      imagePath: 'assets/images/lessons/day11/lesson2/game1.png',
      imagePrompt: 'cartoon green vs red candlestick',
      gameData: GameData(
        type: 'choice',
        instruction: 'A green candlestick means:',
        options: [GameOption(label: 'Price went down', emoji: '📉'), GameOption(label: 'Price went up', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pattern Pop',
      imagePath: 'assets/images/lessons/day11/lesson2/game2.png',
      imagePrompt: 'cartoon candlestick patterns',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A doji candle shows:',
        options: [GameOption(label: 'Strong trend', emoji: '💪'), GameOption(label: 'Market indecision', emoji: '🤔'), GameOption(label: 'Guaranteed reversal', emoji: '🔄')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day11/lesson2/question.png',
      imagePrompt: 'cartoon hammer candlestick pattern',
      questionData: QuestionData(
        question: 'A hammer pattern with a long lower wick suggests:',
        options: ['Definite crash', 'Potential reversal upward', 'Nothing', 'Guaranteed profit'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Candle Mission',
      imagePath: 'assets/images/lessons/day11/lesson2/mission.png',
      imagePrompt: 'cartoon reading candlestick chart',
      missionData: MissionData(
        mission: 'What information does one candlestick show?',
        options: ['Only the close price', 'Open, high, low, and close prices', 'Only volume', 'Company earnings'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Candle Expert', badgeIcon: '🕯️')),
  ],
);
