import '../../models/lesson_models.dart';

final day10Lesson4 = LessonData(
  day: 10,
  title: "Stop Losses & Take Profits",
  emoji: '🛑',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Know When to Exit',
      imagePath: 'assets/images/lessons/day10/lesson4/story.png',
      imagePrompt: 'cartoon exit doors: stop loss door protecting from falling, take profit door with gains',
      content: '''Successful investors plan their exits in advance.

Stop losses limit how much you can lose.
Take profits lock in your gains.

Planning exits removes emotion from decisions!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Stop Losses',
      imagePath: 'assets/images/lessons/day10/lesson4/content1.png',
      imagePrompt: 'cartoon stop loss as safety net catching falling investment',
      content: '''Understanding stop losses:''',
      bullets: [
        BulletPoint(icon: '🛑', title: 'What', description: 'Automatic sell order at a set price.'),
        BulletPoint(icon: '🛡️', title: 'Purpose', description: 'Limits losses before they get worse.'),
        BulletPoint(icon: '🎯', title: 'Set Before', description: 'Decide exit point when you enter.'),
        BulletPoint(icon: '🤖', title: 'Automatic', description: 'Executes without emotional hesitation.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Take Profits',
      imagePath: 'assets/images/lessons/day10/lesson4/content2.png',
      imagePrompt: 'cartoon take profit as locking in gains, money in safe',
      content: '''Locking in your gains:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'What', description: 'Sell some or all when target reached.'),
        BulletPoint(icon: '🎯', title: 'Set Targets', description: 'Decide profit goals before investing.'),
        BulletPoint(icon: '⚖️', title: 'Partial', description: 'Sell some, keep some for more upside.'),
        BulletPoint(icon: '😊', title: 'Enjoy Gains', description: 'A profit taken is a profit earned.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Stop Check',
      imagePath: 'assets/images/lessons/day10/lesson4/game1.png',
      imagePrompt: 'cartoon stop loss protection',
      gameData: GameData(
        type: 'choice',
        instruction: 'A stop loss helps you:',
        options: [GameOption(label: 'Maximize losses', emoji: '📉'), GameOption(label: 'Limit losses', emoji: '🛡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Exit Pop',
      imagePath: 'assets/images/lessons/day10/lesson4/game2.png',
      imagePrompt: 'cartoon exit strategy planning',
      gameData: GameData(
        type: 'balloon',
        instruction: 'When should you set your stop loss?',
        options: [GameOption(label: 'After big loss', emoji: '😰'), GameOption(label: 'Before or when you buy', emoji: '🎯'), GameOption(label: 'Never', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day10/lesson4/question.png',
      imagePrompt: 'cartoon profit taking strategy',
      questionData: QuestionData(
        question: 'Why take profits at targets?',
        options: ['Paper gains can disappear', 'Profits are bad', 'Never sell winners', 'It is illegal to sell'],
        correctIndex: 0,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Exit Mission',
      imagePath: 'assets/images/lessons/day10/lesson4/mission.png',
      imagePrompt: 'cartoon planned exit strategy',
      missionData: MissionData(
        mission: 'What is the benefit of planning exits in advance?',
        options: ['None', 'Removes emotion from decisions', 'Makes investing harder', 'Guarantees losses'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Exit Planner', badgeIcon: '🛑')),
  ],
);
