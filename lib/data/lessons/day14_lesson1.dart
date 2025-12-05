import '../../models/lesson_models.dart';

final day14Lesson1 = LessonData(
  day: 14,
  title: "Why Economics Matter",
  emoji: '🌍',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Big Picture',
      imagePath: 'assets/images/lessons/day14/lesson1/story.png',
      imagePrompt: 'cartoon economy as ocean with ships (companies) rising and falling with tides',
      content: '''The economy affects all investments.

When the economy grows, stocks usually do well.
When it shrinks, investments often struggle.

Understanding the big picture helps you invest smarter!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Economic Indicators',
      imagePath: 'assets/images/lessons/day14/lesson1/content1.png',
      imagePrompt: 'cartoon dashboard of economic indicators: GDP meter, inflation gauge, employment counter',
      content: '''Key economic measurements:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'GDP', description: 'Total value of goods and services.'),
        BulletPoint(icon: '📈', title: 'Inflation', description: 'How fast prices are rising.'),
        BulletPoint(icon: '👥', title: 'Employment', description: 'How many people have jobs.'),
        BulletPoint(icon: '🏦', title: 'Interest Rates', description: 'Cost of borrowing money.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Economic Cycles',
      imagePath: 'assets/images/lessons/day14/lesson1/content2.png',
      imagePrompt: 'cartoon economic cycle wave: expansion peak, contraction trough, expansion again',
      content: '''Economies move in cycles:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Expansion', description: 'Economy growing, good for stocks.'),
        BulletPoint(icon: '🔝', title: 'Peak', description: 'Growth slowing, be cautious.'),
        BulletPoint(icon: '📉', title: 'Contraction', description: 'Economy shrinking, recession.'),
        BulletPoint(icon: '⬇️', title: 'Trough', description: 'Bottom of cycle, opportunity coming.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Economy Check',
      imagePath: 'assets/images/lessons/day14/lesson1/game1.png',
      imagePrompt: 'cartoon economy affecting investments',
      gameData: GameData(
        type: 'choice',
        instruction: 'When the economy grows, stocks usually:',
        options: [GameOption(label: 'Fall', emoji: '📉'), GameOption(label: 'Rise', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Cycle Pop',
      imagePath: 'assets/images/lessons/day14/lesson1/game2.png',
      imagePrompt: 'cartoon economic cycle phases',
      gameData: GameData(
        type: 'balloon',
        instruction: 'During economic expansion:',
        options: [GameOption(label: 'Economy is shrinking', emoji: '📉'), GameOption(label: 'Economy is growing', emoji: '📈'), GameOption(label: 'Economy stops', emoji: '⏸️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day14/lesson1/question.png',
      imagePrompt: 'cartoon recession definition',
      questionData: QuestionData(
        question: 'What is a recession?',
        options: ['Economy growing fast', 'Economy shrinking', 'Stock market peak', 'New company launch'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Economy Mission',
      imagePath: 'assets/images/lessons/day14/lesson1/mission.png',
      imagePrompt: 'cartoon investor watching economic indicators',
      missionData: MissionData(
        mission: 'Why should investors watch economic indicators?',
        options: ['Just for fun', 'Economy affects all investments', 'Indicators are always wrong', 'Only economists need them'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Economy Watcher', badgeIcon: '🌍')),
  ],
);
