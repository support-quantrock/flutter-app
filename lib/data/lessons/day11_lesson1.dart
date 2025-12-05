import '../../models/lesson_models.dart';

final day11Lesson1 = LessonData(
  day: 11,
  title: "What is Technical Analysis?",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Reading the Charts',
      imagePath: 'assets/images/lessons/day11/lesson1/story.png',
      imagePrompt: 'cartoon trader studying price charts with patterns and indicators, detective style',
      content: '''Technical analysis studies price charts and patterns.

It believes that past price movements can predict future ones.

Charts tell a story - technical analysts learn to read it!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Technical vs Fundamental',
      imagePath: 'assets/images/lessons/day11/lesson1/content1.png',
      imagePrompt: 'cartoon comparison: technical analyst with charts vs fundamental analyst with company reports',
      content: '''Two main approaches to analysis:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Technical', description: 'Studies price charts and patterns.'),
        BulletPoint(icon: '📈', title: 'Fundamental', description: 'Studies company value and financials.'),
        BulletPoint(icon: '🤝', title: 'Both Work', description: 'Many investors use both approaches.'),
        BulletPoint(icon: '⏰', title: 'Timing', description: 'Technical helps with entry and exit timing.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Core Beliefs',
      imagePath: 'assets/images/lessons/day11/lesson1/content2.png',
      imagePrompt: 'cartoon three pillars of technical analysis: price includes all, patterns repeat, trends continue',
      content: '''Technical analysis beliefs:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'Price is Everything', description: 'All known info is in the price.'),
        BulletPoint(icon: '🔄', title: 'History Repeats', description: 'Patterns happen again and again.'),
        BulletPoint(icon: '➡️', title: 'Trends Continue', description: 'Prices tend to move in trends.'),
        BulletPoint(icon: '😰', title: 'Psychology Matters', description: 'Crowd behavior creates patterns.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Analysis Check',
      imagePath: 'assets/images/lessons/day11/lesson1/game1.png',
      imagePrompt: 'cartoon technical analysis focus',
      gameData: GameData(
        type: 'choice',
        instruction: 'Technical analysis focuses on:',
        options: [GameOption(label: 'Company financials', emoji: '📄'), GameOption(label: 'Price charts and patterns', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Belief Pop',
      imagePath: 'assets/images/lessons/day11/lesson1/game2.png',
      imagePrompt: 'cartoon technical analysis beliefs',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Technical analysts believe:',
        options: [GameOption(label: 'Charts are useless', emoji: '❌'), GameOption(label: 'Patterns tend to repeat', emoji: '🔄'), GameOption(label: 'Only news matters', emoji: '📰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day11/lesson1/question.png',
      imagePrompt: 'cartoon trend continuation concept',
      questionData: QuestionData(
        question: 'What do technical analysts believe about trends?',
        options: ['They are random', 'They tend to continue', 'They never exist', 'They always reverse immediately'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'TA Mission',
      imagePath: 'assets/images/lessons/day11/lesson1/mission.png',
      imagePrompt: 'cartoon trader using both analysis types',
      missionData: MissionData(
        mission: 'Why do many investors use technical analysis?',
        options: ['It is the only method', 'Helps with timing buys and sells', 'Replaces all research', 'It guarantees profits'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Chart Reader', badgeIcon: '📊')),
  ],
);
