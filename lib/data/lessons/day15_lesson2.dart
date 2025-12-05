import '../../models/lesson_models.dart';

final day15Lesson2 = LessonData(
  day: 15,
  title: "Asset Allocation Basics",
  emoji: '🥧',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Dividing Your Pie',
      imagePath: 'assets/images/lessons/day15/lesson2/story.png',
      imagePrompt: 'cartoon investment pie chart divided into stocks, bonds, cash slices',
      content: '''Asset allocation is how you divide your investments.

How much in stocks? Bonds? Cash? Real estate?

This decision affects most of your investment returns!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Major Asset Classes',
      imagePath: 'assets/images/lessons/day15/lesson2/content1.png',
      imagePrompt: 'cartoon asset classes: stocks rocket, bonds safe, cash piggy bank, real estate house',
      content: '''Main investment categories:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Stocks', description: 'Higher growth potential, more volatile.'),
        BulletPoint(icon: '📊', title: 'Bonds', description: 'Steadier income, lower growth.'),
        BulletPoint(icon: '💵', title: 'Cash', description: 'Safest but lowest returns.'),
        BulletPoint(icon: '🏠', title: 'Real Estate', description: 'Tangible assets, rental income.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Allocation Matters',
      imagePath: 'assets/images/lessons/day15/lesson2/content2.png',
      imagePrompt: 'cartoon allocation determining portfolio outcome, 90% of returns from allocation',
      content: '''The importance of asset allocation:''',
      bullets: [
        BulletPoint(icon: '📊', title: '90% Rule', description: 'Allocation drives most returns.'),
        BulletPoint(icon: '⚖️', title: 'Risk Control', description: 'More stocks = more risk.'),
        BulletPoint(icon: '🎯', title: 'Goals Based', description: 'Match allocation to your goals.'),
        BulletPoint(icon: '⏰', title: 'Time Horizon', description: 'Longer time = can take more risk.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Asset Check',
      imagePath: 'assets/images/lessons/day15/lesson2/game1.png',
      imagePrompt: 'cartoon asset allocation importance',
      gameData: GameData(
        type: 'choice',
        instruction: 'Asset allocation affects:',
        options: [GameOption(label: 'Very little of returns', emoji: '📉'), GameOption(label: 'Most of your returns', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Pop',
      imagePath: 'assets/images/lessons/day15/lesson2/game2.png',
      imagePrompt: 'cartoon stocks vs bonds risk',
      gameData: GameData(
        type: 'balloon',
        instruction: 'More stocks in your portfolio means:',
        options: [GameOption(label: 'Less risk', emoji: '🛡️'), GameOption(label: 'More risk and growth potential', emoji: '📈'), GameOption(label: 'Same risk', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day15/lesson2/question.png',
      imagePrompt: 'cartoon safest asset class',
      questionData: QuestionData(
        question: 'Which asset class is typically safest?',
        options: ['Stocks', 'Crypto', 'Cash', 'Options'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Allocation Mission',
      imagePath: 'assets/images/lessons/day15/lesson2/mission.png',
      imagePrompt: 'cartoon young vs old investor allocation',
      missionData: MissionData(
        mission: 'With a longer time horizon, you can typically:',
        options: ['Take less risk', 'Take more risk', 'Only buy bonds', 'Avoid investing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Allocator', badgeIcon: '🥧')),
  ],
);
