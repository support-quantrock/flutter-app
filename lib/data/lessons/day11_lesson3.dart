import '../../models/lesson_models.dart';

final day11Lesson3 = LessonData(
  day: 11,
  title: "Support & Resistance",
  emoji: '📏',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Price Floors and Ceilings',
      imagePath: 'assets/images/lessons/day11/lesson3/story.png',
      imagePrompt: 'cartoon price bouncing between floor (support) and ceiling (resistance) levels',
      content: '''Support and resistance are key price levels.

Support is like a floor - prices tend to bounce up from it.
Resistance is like a ceiling - prices tend to fall from it.

These levels help predict where price might go next!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding Support',
      imagePath: 'assets/images/lessons/day11/lesson3/content1.png',
      imagePrompt: 'cartoon support level with buyers catching falling price, floor concept',
      content: '''Support levels explained:''',
      bullets: [
        BulletPoint(icon: '⬇️', title: 'Price Floor', description: 'Level where buying pressure appears.'),
        BulletPoint(icon: '🛒', title: 'Buyers Step In', description: 'Traders see value and buy.'),
        BulletPoint(icon: '↩️', title: 'Bounce Up', description: 'Price often reverses upward.'),
        BulletPoint(icon: '💔', title: 'If Broken', description: 'Old support becomes new resistance.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding Resistance',
      imagePath: 'assets/images/lessons/day11/lesson3/content2.png',
      imagePrompt: 'cartoon resistance level with sellers pushing price down, ceiling concept',
      content: '''Resistance levels explained:''',
      bullets: [
        BulletPoint(icon: '⬆️', title: 'Price Ceiling', description: 'Level where selling pressure appears.'),
        BulletPoint(icon: '💰', title: 'Sellers Step In', description: 'Traders take profits and sell.'),
        BulletPoint(icon: '↩️', title: 'Fall Down', description: 'Price often reverses downward.'),
        BulletPoint(icon: '🚀', title: 'If Broken', description: 'Old resistance becomes new support.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Level Check',
      imagePath: 'assets/images/lessons/day11/lesson3/game1.png',
      imagePrompt: 'cartoon support level visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'Support is a level where:',
        options: [GameOption(label: 'Prices usually fall', emoji: '📉'), GameOption(label: 'Prices tend to bounce up', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Break Pop',
      imagePath: 'assets/images/lessons/day11/lesson3/game2.png',
      imagePrompt: 'cartoon support becoming resistance',
      gameData: GameData(
        type: 'balloon',
        instruction: 'When support is broken, it often becomes:',
        options: [GameOption(label: 'Disappears forever', emoji: '👻'), GameOption(label: 'New resistance', emoji: '🔄'), GameOption(label: 'Nothing', emoji: '❓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day11/lesson3/question.png',
      imagePrompt: 'cartoon resistance level ceiling',
      questionData: QuestionData(
        question: 'Why does resistance form at certain price levels?',
        options: ['Random chance', 'Sellers step in to take profits', 'Government rules', 'No reason'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Level Mission',
      imagePath: 'assets/images/lessons/day11/lesson3/mission.png',
      imagePrompt: 'cartoon trader identifying support and resistance',
      missionData: MissionData(
        mission: 'How can you use support and resistance?',
        options: ['They are useless', 'To plan entry and exit points', 'Only for decoration', 'To guarantee profits'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Level Finder', badgeIcon: '📏')),
  ],
);
