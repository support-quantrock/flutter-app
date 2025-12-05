import '../../models/lesson_models.dart';

final day19Lesson4 = LessonData(
  day: 19,
  title: "Blending Both Approaches",
  emoji: '🔀',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Best of Both',
      imagePath: 'assets/images/lessons/day19/lesson4/story.png',
      imagePrompt: 'cartoon portfolio with both passive core and active satellites, hybrid approach',
      content: '''You do not have to choose just one!

Many investors blend active and passive.

Use passive where markets are efficient, active where they are not.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Core-Satellite Strategy',
      imagePath: 'assets/images/lessons/day19/lesson4/content1.png',
      imagePrompt: 'cartoon core-satellite: large passive core surrounded by smaller active satellites',
      content: '''The core-satellite approach:''',
      bullets: [
        BulletPoint(icon: '🎯', title: 'Core', description: 'Passive index funds (60-80%).'),
        BulletPoint(icon: '🛰️', title: 'Satellites', description: 'Active funds in specific areas.'),
        BulletPoint(icon: '💰', title: 'Low Cost', description: 'Passive core keeps fees down.'),
        BulletPoint(icon: '🌟', title: 'Opportunities', description: 'Active adds potential alpha.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'When to Use Each',
      imagePath: 'assets/images/lessons/day19/lesson4/content2.png',
      imagePrompt: 'cartoon decision tree: efficient markets passive, inefficient markets consider active',
      content: '''Matching approach to market:''',
      bullets: [
        BulletPoint(icon: '🏛️', title: 'Large US Stocks', description: 'Passive often best.'),
        BulletPoint(icon: '🌱', title: 'Small Caps', description: 'Active can add value.'),
        BulletPoint(icon: '📊', title: 'Bonds', description: 'Passive often sufficient.'),
        BulletPoint(icon: '🌍', title: 'International', description: 'Mix based on market.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Blend Check',
      imagePath: 'assets/images/lessons/day19/lesson4/game1.png',
      imagePrompt: 'cartoon core-satellite structure',
      gameData: GameData(
        type: 'choice',
        instruction: 'In core-satellite, the core is typically:',
        options: [GameOption(label: 'Active funds', emoji: '🎯'), GameOption(label: 'Passive index funds', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Match Pop',
      imagePath: 'assets/images/lessons/day19/lesson4/game2.png',
      imagePrompt: 'cartoon matching approach to market type',
      gameData: GameData(
        type: 'balloon',
        instruction: 'For large US stocks, most investors use:',
        options: [GameOption(label: 'Only active funds', emoji: '🎯'), GameOption(label: 'Passive index funds', emoji: '📊'), GameOption(label: 'No funds', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day19/lesson4/question.png',
      imagePrompt: 'cartoon blended portfolio benefits',
      questionData: QuestionData(
        question: 'Blending active and passive can:',
        options: ['Never work', 'Combine low costs with opportunities', 'Only increase fees', 'Eliminate all decisions'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Blend Mission',
      imagePath: 'assets/images/lessons/day19/lesson4/mission.png',
      imagePrompt: 'cartoon percentage split in core-satellite',
      missionData: MissionData(
        mission: 'In core-satellite, the passive core is usually:',
        options: ['10-20%', '60-80%', 'Exactly 50%', 'Not important'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Blend Master', badgeIcon: '🔀')),
  ],
);
