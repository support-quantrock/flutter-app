import '../../models/lesson_models.dart';

final day12Lesson2 = LessonData(
  day: 12,
  title: "RSI Indicator",
  emoji: '📉',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Measuring Momentum',
      imagePath: 'assets/images/lessons/day12/lesson2/story.png',
      imagePrompt: 'cartoon RSI gauge showing overbought and oversold zones, momentum measurement',
      content: '''RSI means Relative Strength Index.

It measures how fast and how much prices have moved.

RSI ranges from 0 to 100 - high means overbought, low means oversold!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding RSI',
      imagePath: 'assets/images/lessons/day12/lesson2/content1.png',
      imagePrompt: 'cartoon RSI scale with zones: below 30 oversold green, above 70 overbought red',
      content: '''RSI zones explained:''',
      bullets: [
        BulletPoint(icon: '🔴', title: 'Above 70', description: 'Overbought - might fall soon.'),
        BulletPoint(icon: '🟢', title: 'Below 30', description: 'Oversold - might rise soon.'),
        BulletPoint(icon: '⚖️', title: '30-70', description: 'Neutral zone - no extreme.'),
        BulletPoint(icon: '📏', title: '0-100 Scale', description: 'RSI never goes outside this range.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Using RSI',
      imagePath: 'assets/images/lessons/day12/lesson2/content2.png',
      imagePrompt: 'cartoon RSI trading signals: buying at oversold, selling at overbought',
      content: '''How traders use RSI:''',
      bullets: [
        BulletPoint(icon: '🛒', title: 'Buy Signal', description: 'When RSI rises from below 30.'),
        BulletPoint(icon: '💰', title: 'Sell Signal', description: 'When RSI falls from above 70.'),
        BulletPoint(icon: '🔍', title: 'Divergence', description: 'Price and RSI going opposite = warning.'),
        BulletPoint(icon: '⚠️', title: 'Not Perfect', description: 'Use with other indicators.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'RSI Check',
      imagePath: 'assets/images/lessons/day12/lesson2/game1.png',
      imagePrompt: 'cartoon RSI overbought zone',
      gameData: GameData(
        type: 'choice',
        instruction: 'RSI above 70 suggests:',
        options: [GameOption(label: 'Good time to buy', emoji: '🛒'), GameOption(label: 'Overbought - might fall', emoji: '📉')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Zone Pop',
      imagePath: 'assets/images/lessons/day12/lesson2/game2.png',
      imagePrompt: 'cartoon RSI oversold zone',
      gameData: GameData(
        type: 'balloon',
        instruction: 'RSI below 30 is called:',
        options: [GameOption(label: 'Overbought', emoji: '🔴'), GameOption(label: 'Oversold', emoji: '🟢'), GameOption(label: 'Neutral', emoji: '⚖️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day12/lesson2/question.png',
      imagePrompt: 'cartoon RSI range visualization',
      questionData: QuestionData(
        question: 'What is the range of RSI values?',
        options: ['-100 to 100', '0 to 100', '0 to 50', 'No limits'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'RSI Mission',
      imagePath: 'assets/images/lessons/day12/lesson2/mission.png',
      imagePrompt: 'cartoon RSI divergence warning',
      missionData: MissionData(
        mission: 'What does RSI divergence mean?',
        options: ['RSI is broken', 'Price and RSI moving opposite - warning signal', 'Time to panic', 'Market is closed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'RSI Pro', badgeIcon: '📉')),
  ],
);
