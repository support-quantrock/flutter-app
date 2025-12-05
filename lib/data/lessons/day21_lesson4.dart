import '../../models/lesson_models.dart';

final day21Lesson4 = LessonData(
  day: 21,
  title: "Asset Location Strategy",
  emoji: '📍',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Right Asset, Right Account',
      imagePath: 'assets/images/lessons/day21/lesson4/story.png',
      imagePrompt: 'cartoon placing different investments in optimal account types for tax efficiency',
      content: '''Where you hold investments matters for taxes.

Some investments are more tax-efficient than others.

Putting the right assets in the right accounts saves money!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Tax Efficiency Varies',
      imagePath: 'assets/images/lessons/day21/lesson4/content1.png',
      imagePrompt: 'cartoon tax efficiency ranking: index funds efficient, bonds inefficient',
      content: '''Different tax characteristics:''',
      bullets: [
        BulletPoint(icon: '🟢', title: 'Tax-Efficient', description: 'Index funds, growth stocks, ETFs.'),
        BulletPoint(icon: '🔴', title: 'Tax-Inefficient', description: 'Bonds, REITs, active funds.'),
        BulletPoint(icon: '💡', title: 'Why', description: 'Interest and distributions taxed higher.'),
        BulletPoint(icon: '📊', title: 'Match', description: 'Put inefficient in tax-advantaged accounts.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Where to Put What',
      imagePath: 'assets/images/lessons/day21/lesson4/content2.png',
      imagePrompt: 'cartoon asset location: bonds in IRA, stocks in taxable, growth in Roth',
      content: '''General guidelines:''',
      bullets: [
        BulletPoint(icon: '🏦', title: 'Tax-Deferred', description: 'Bonds, REITs, dividend stocks.'),
        BulletPoint(icon: '🌟', title: 'Roth', description: 'Highest growth potential stocks.'),
        BulletPoint(icon: '📈', title: 'Taxable', description: 'Index funds, tax-efficient ETFs.'),
        BulletPoint(icon: '⚠️', title: 'Situational', description: 'Your situation may differ.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Location Check',
      imagePath: 'assets/images/lessons/day21/lesson4/game1.png',
      imagePrompt: 'cartoon bond placement',
      gameData: GameData(
        type: 'choice',
        instruction: 'Bonds are often best held in:',
        options: [GameOption(label: 'Taxable accounts', emoji: '📈'), GameOption(label: 'Tax-advantaged accounts', emoji: '🏦')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Efficient Pop',
      imagePath: 'assets/images/lessons/day21/lesson4/game2.png',
      imagePrompt: 'cartoon tax-efficient investments',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which is typically most tax-efficient?',
        options: [GameOption(label: 'Bonds', emoji: '📊'), GameOption(label: 'Index funds', emoji: '📈'), GameOption(label: 'REITs', emoji: '🏠')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day21/lesson4/question.png',
      imagePrompt: 'cartoon Roth account ideal holdings',
      questionData: QuestionData(
        question: 'Roth accounts are ideal for:',
        options: ['Bonds only', 'High-growth potential investments', 'Only cash', 'No investments'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Location Mission',
      imagePath: 'assets/images/lessons/day21/lesson4/mission.png',
      imagePrompt: 'cartoon asset location optimization',
      missionData: MissionData(
        mission: 'Asset location strategy helps by:',
        options: ['Making taxes higher', 'Placing investments optimally for tax efficiency', 'Ignoring account types', 'Only using one account'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Location Expert', badgeIcon: '📍')),
  ],
);
