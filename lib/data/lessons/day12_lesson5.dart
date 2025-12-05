import '../../models/lesson_models.dart';

final day12Lesson5 = LessonData(
  day: 12,
  title: "Combining Indicators",
  emoji: '🔧',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Stronger Together',
      imagePath: 'assets/images/lessons/day12/lesson5/story.png',
      imagePrompt: 'cartoon multiple indicators working together like puzzle pieces on chart',
      content: '''No single indicator is perfect.

Smart traders combine multiple indicators.

When several agree, the signal is stronger!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Combine',
      imagePath: 'assets/images/lessons/day12/lesson5/content1.png',
      imagePrompt: 'cartoon single indicator sometimes wrong vs multiple indicators confirming signal',
      content: '''Benefits of combining indicators:''',
      bullets: [
        BulletPoint(icon: '✅', title: 'Confirmation', description: 'Multiple signals = stronger conviction.'),
        BulletPoint(icon: '🚫', title: 'Filter Fakes', description: 'Reduces false signals.'),
        BulletPoint(icon: '🔍', title: 'Different Views', description: 'Each indicator shows different aspects.'),
        BulletPoint(icon: '⚖️', title: 'Balance', description: 'Trend + momentum + volatility.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Common Combinations',
      imagePath: 'assets/images/lessons/day12/lesson5/content2.png',
      imagePrompt: 'cartoon popular indicator combinations: MA + RSI, MACD + Bollinger, support + volume',
      content: '''Popular indicator combinations:''',
      bullets: [
        BulletPoint(icon: '1️⃣', title: 'MA + RSI', description: 'Trend direction + momentum extremes.'),
        BulletPoint(icon: '2️⃣', title: 'MACD + Bollinger', description: 'Momentum + volatility context.'),
        BulletPoint(icon: '3️⃣', title: 'Support + Volume', description: 'Price levels + conviction.'),
        BulletPoint(icon: '⚠️', title: 'Do Not Overdo', description: 'Too many indicators cause confusion.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Combo Check',
      imagePath: 'assets/images/lessons/day12/lesson5/game1.png',
      imagePrompt: 'cartoon multiple confirming signals',
      gameData: GameData(
        type: 'choice',
        instruction: 'When multiple indicators agree, the signal is:',
        options: [GameOption(label: 'Weaker', emoji: '📉'), GameOption(label: 'Stronger', emoji: '💪')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Warning Pop',
      imagePath: 'assets/images/lessons/day12/lesson5/game2.png',
      imagePrompt: 'cartoon too many indicators causing confusion',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Using too many indicators can cause:',
        options: [GameOption(label: 'Perfect trading', emoji: '🎯'), GameOption(label: 'Confusion', emoji: '😵'), GameOption(label: 'Guaranteed profits', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day12/lesson5/question.png',
      imagePrompt: 'cartoon ideal indicator combination',
      questionData: QuestionData(
        question: 'A good indicator combination includes:',
        options: ['Only one type', 'Different aspects like trend and momentum', 'As many as possible', 'None needed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Combo Mission',
      imagePath: 'assets/images/lessons/day12/lesson5/mission.png',
      imagePrompt: 'cartoon trader with balanced indicator setup',
      missionData: MissionData(
        mission: 'Why should you NOT rely on a single indicator?',
        options: ['Single indicators always work', 'No indicator is perfect alone', 'More is always better', 'Indicators are useless'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Indicator Pro', badgeIcon: '🔧')),
  ],
);
