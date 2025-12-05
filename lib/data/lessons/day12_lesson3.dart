import '../../models/lesson_models.dart';

final day12Lesson3 = LessonData(
  day: 12,
  title: "MACD Indicator",
  emoji: '📶',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Trend and Momentum Together',
      imagePath: 'assets/images/lessons/day12/lesson3/story.png',
      imagePrompt: 'cartoon MACD histogram with signal line, showing trend direction and momentum',
      content: '''MACD means Moving Average Convergence Divergence.

It combines two moving averages to show trend and momentum.

When lines cross, traders pay attention!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'MACD Components',
      imagePath: 'assets/images/lessons/day12/lesson3/content1.png',
      imagePrompt: 'cartoon MACD parts labeled: MACD line, signal line, histogram bars',
      content: '''Three parts of MACD:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'MACD Line', description: '12-day EMA minus 26-day EMA.'),
        BulletPoint(icon: '📈', title: 'Signal Line', description: '9-day EMA of the MACD line.'),
        BulletPoint(icon: '📉', title: 'Histogram', description: 'Difference between MACD and signal.'),
        BulletPoint(icon: '0️⃣', title: 'Zero Line', description: 'When MACD is above/below zero.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'MACD Signals',
      imagePath: 'assets/images/lessons/day12/lesson3/content2.png',
      imagePrompt: 'cartoon MACD crossover signals: bullish cross up, bearish cross down',
      content: '''How to read MACD:''',
      bullets: [
        BulletPoint(icon: '🟢', title: 'Bullish Cross', description: 'MACD crosses above signal line.'),
        BulletPoint(icon: '🔴', title: 'Bearish Cross', description: 'MACD crosses below signal line.'),
        BulletPoint(icon: '⬆️', title: 'Above Zero', description: 'Overall upward momentum.'),
        BulletPoint(icon: '⬇️', title: 'Below Zero', description: 'Overall downward momentum.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'MACD Check',
      imagePath: 'assets/images/lessons/day12/lesson3/game1.png',
      imagePrompt: 'cartoon MACD bullish crossover',
      gameData: GameData(
        type: 'choice',
        instruction: 'A bullish MACD signal occurs when:',
        options: [GameOption(label: 'MACD crosses below signal', emoji: '📉'), GameOption(label: 'MACD crosses above signal', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Part Pop',
      imagePath: 'assets/images/lessons/day12/lesson3/game2.png',
      imagePrompt: 'cartoon MACD histogram',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The MACD histogram shows:',
        options: [GameOption(label: 'Trading volume', emoji: '📊'), GameOption(label: 'Difference between MACD and signal line', emoji: '📶'), GameOption(label: 'Company earnings', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day12/lesson3/question.png',
      imagePrompt: 'cartoon MACD above zero line',
      questionData: QuestionData(
        question: 'When MACD is above zero, it suggests:',
        options: ['Downward momentum', 'Upward momentum', 'No movement', 'Market closed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'MACD Mission',
      imagePath: 'assets/images/lessons/day12/lesson3/mission.png',
      imagePrompt: 'cartoon trader watching MACD crossover',
      missionData: MissionData(
        mission: 'Why do traders watch MACD crossovers?',
        options: ['For fun', 'They signal potential trend changes', 'MACD is always right', 'No reason'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'MACD Master', badgeIcon: '📶')),
  ],
);
