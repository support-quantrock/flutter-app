import '../../models/lesson_models.dart';

final day22Lesson4 = LessonData(
  day: 22,
  title: "Retirement Investment Strategy",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Investing for the Long Haul',
      imagePath: 'assets/images/lessons/day22/lesson4/story.png',
      imagePrompt: 'cartoon retirement portfolio changing over decades: aggressive to conservative',
      content: '''Your retirement strategy should evolve over time.

More aggressive when young, more conservative as you age.

The goal: grow wealth then protect it!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Age-Based Strategy',
      imagePath: 'assets/images/lessons/day22/lesson4/content1.png',
      imagePrompt: 'cartoon glide path: stocks heavy when young, more bonds as retirement nears',
      content: '''Adjusting over time:''',
      bullets: [
        BulletPoint(icon: '🚀', title: 'Young', description: 'More stocks for growth.'),
        BulletPoint(icon: '⚖️', title: 'Middle Age', description: 'Balanced mix.'),
        BulletPoint(icon: '🛡️', title: 'Near Retirement', description: 'More bonds for stability.'),
        BulletPoint(icon: '🎯', title: 'Target Date Funds', description: 'Adjust automatically.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Key Principles',
      imagePath: 'assets/images/lessons/day22/lesson4/content2.png',
      imagePrompt: 'cartoon retirement investing principles: diversify, low cost, stay invested',
      content: '''Retirement investing rules:''',
      bullets: [
        BulletPoint(icon: '🌈', title: 'Diversify', description: 'Spread across asset classes.'),
        BulletPoint(icon: '💵', title: 'Low Costs', description: 'Fees compound over decades.'),
        BulletPoint(icon: '⏳', title: 'Stay Invested', description: 'Do not panic during downturns.'),
        BulletPoint(icon: '🔄', title: 'Rebalance', description: 'Keep allocation on track.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Age Check',
      imagePath: 'assets/images/lessons/day22/lesson4/game1.png',
      imagePrompt: 'cartoon young investor portfolio',
      gameData: GameData(
        type: 'choice',
        instruction: 'When young, retirement portfolios typically have:',
        options: [GameOption(label: 'More bonds', emoji: '🛡️'), GameOption(label: 'More stocks', emoji: '🚀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Fund Pop',
      imagePath: 'assets/images/lessons/day22/lesson4/game2.png',
      imagePrompt: 'cartoon target date fund automatic adjustment',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Target date funds automatically:',
        options: [GameOption(label: 'Increase risk over time', emoji: '📈'), GameOption(label: 'Adjust to become more conservative', emoji: '🛡️'), GameOption(label: 'Never change', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day22/lesson4/question.png',
      imagePrompt: 'cartoon staying invested during downturns',
      questionData: QuestionData(
        question: 'During market downturns, retirement investors should:',
        options: ['Panic sell everything', 'Stay invested for the long term', 'Move all to cash', 'Stop contributing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Strategy Mission',
      imagePath: 'assets/images/lessons/day22/lesson4/mission.png',
      imagePrompt: 'cartoon low cost importance over decades',
      missionData: MissionData(
        mission: 'Why are low costs especially important for retirement?',
        options: ['They are not important', 'Fees compound over many decades', 'Higher fees mean better returns', 'Costs do not affect returns'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Strategy Pro', badgeIcon: '📊')),
  ],
);
