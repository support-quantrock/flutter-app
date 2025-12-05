import '../../models/lesson_models.dart';

final day15Lesson3 = LessonData(
  day: 15,
  title: "Stock/Bond Mix",
  emoji: '⚖️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Classic Balance',
      imagePath: 'assets/images/lessons/day15/lesson3/story.png',
      imagePrompt: 'cartoon balance scale with stocks on one side and bonds on other, finding right mix',
      content: '''The stock/bond mix is the most important decision.

Stocks grow your wealth. Bonds protect it.

Finding your right balance is key!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Common Allocations',
      imagePath: 'assets/images/lessons/day15/lesson3/content1.png',
      imagePrompt: 'cartoon different allocation models: aggressive 90/10, moderate 60/40, conservative 30/70',
      content: '''Popular stock/bond mixes:''',
      bullets: [
        BulletPoint(icon: '🚀', title: 'Aggressive (90/10)', description: '90% stocks, 10% bonds - young investors.'),
        BulletPoint(icon: '⚖️', title: 'Balanced (60/40)', description: '60% stocks, 40% bonds - classic mix.'),
        BulletPoint(icon: '🛡️', title: 'Conservative (30/70)', description: '30% stocks, 70% bonds - near retirement.'),
        BulletPoint(icon: '🎯', title: 'Your Mix', description: 'Depends on age, goals, risk tolerance.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Age-Based Rules',
      imagePath: 'assets/images/lessons/day15/lesson3/content2.png',
      imagePrompt: 'cartoon age rule of thumb: 100 or 120 minus age equals stock percentage',
      content: '''Simple rules for allocation:''',
      bullets: [
        BulletPoint(icon: '📏', title: 'Rule of 100', description: '100 minus your age = stock %.'),
        BulletPoint(icon: '📐', title: 'Rule of 120', description: '120 minus age for longer lives.'),
        BulletPoint(icon: '🔢', title: 'Example', description: 'Age 30: 120-30 = 90% stocks.'),
        BulletPoint(icon: '⚠️', title: 'Just Guidelines', description: 'Adjust for your situation.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Mix Check',
      imagePath: 'assets/images/lessons/day15/lesson3/game1.png',
      imagePrompt: 'cartoon aggressive vs conservative allocation',
      gameData: GameData(
        type: 'choice',
        instruction: 'A 90/10 stock/bond mix is:',
        options: [GameOption(label: 'Conservative', emoji: '🛡️'), GameOption(label: 'Aggressive', emoji: '🚀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Age Pop',
      imagePath: 'assets/images/lessons/day15/lesson3/game2.png',
      imagePrompt: 'cartoon age and stock allocation relationship',
      gameData: GameData(
        type: 'balloon',
        instruction: 'As you get older, typically you should:',
        options: [GameOption(label: 'Increase stock allocation', emoji: '📈'), GameOption(label: 'Decrease stock allocation', emoji: '📉'), GameOption(label: 'Keep same forever', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day15/lesson3/question.png',
      imagePrompt: 'cartoon 60/40 portfolio',
      questionData: QuestionData(
        question: 'The classic 60/40 portfolio means:',
        options: ['60% bonds, 40% stocks', '60% stocks, 40% bonds', '60% cash, 40% stocks', '60 stocks, 40 bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Balance Mission',
      imagePath: 'assets/images/lessons/day15/lesson3/mission.png',
      imagePrompt: 'cartoon rule of 120 calculation',
      missionData: MissionData(
        mission: 'Using Rule of 120, a 40-year-old should have about:',
        options: ['40% stocks', '60% stocks', '80% stocks', '100% stocks'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Balance Expert', badgeIcon: '⚖️')),
  ],
);
