import '../../models/lesson_models.dart';

final day19Lesson3 = LessonData(
  day: 19,
  title: "The Case for Active",
  emoji: '🎯',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'When Active Can Work',
      imagePath: 'assets/images/lessons/day19/lesson3/story.png',
      imagePrompt: 'cartoon skilled manager finding opportunities others miss, active management success',
      content: '''Active investing is not dead!

Some managers do beat the market consistently.

In certain markets, active has advantages.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Active Advantages',
      imagePath: 'assets/images/lessons/day19/lesson3/content1.png',
      imagePrompt: 'cartoon active advantages: avoiding bad stocks, inefficient markets, downside protection',
      content: '''When active can shine:''',
      bullets: [
        BulletPoint(icon: '🛡️', title: 'Risk Management', description: 'Can avoid declining sectors.'),
        BulletPoint(icon: '🌱', title: 'Small Stocks', description: 'Less efficient markets.'),
        BulletPoint(icon: '🌍', title: 'Emerging Markets', description: 'More mispricing opportunities.'),
        BulletPoint(icon: '💎', title: 'Specialized', description: 'Expert knowledge in niches.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Finding Good Managers',
      imagePath: 'assets/images/lessons/day19/lesson3/content2.png',
      imagePrompt: 'cartoon qualities of good active managers: consistent process, reasonable fees, alignment',
      content: '''What to look for in active funds:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Track Record', description: 'Long-term outperformance.'),
        BulletPoint(icon: '💰', title: 'Reasonable Fees', description: 'Not too expensive.'),
        BulletPoint(icon: '🎯', title: 'Clear Strategy', description: 'Understandable approach.'),
        BulletPoint(icon: '🤝', title: 'Manager Invested', description: 'Skin in the game.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Active Check',
      imagePath: 'assets/images/lessons/day19/lesson3/game1.png',
      imagePrompt: 'cartoon active advantage in small stocks',
      gameData: GameData(
        type: 'choice',
        instruction: 'Active management may work better in:',
        options: [GameOption(label: 'Large US stocks only', emoji: '🏛️'), GameOption(label: 'Less efficient markets like small stocks', emoji: '🌱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Manager Pop',
      imagePath: 'assets/images/lessons/day19/lesson3/game2.png',
      imagePrompt: 'cartoon good manager characteristics',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A good sign in an active manager is:',
        options: [GameOption(label: 'Very high fees', emoji: '💸'), GameOption(label: 'Manager invests their own money', emoji: '🤝'), GameOption(label: 'Trades constantly', emoji: '🔄')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day19/lesson3/question.png',
      imagePrompt: 'cartoon active risk management',
      questionData: QuestionData(
        question: 'Active managers can potentially:',
        options: ['Never beat index', 'Avoid declining sectors', 'Guarantee returns', 'Eliminate all risk'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Active Mission',
      imagePath: 'assets/images/lessons/day19/lesson3/mission.png',
      imagePrompt: 'cartoon active advantage in emerging markets',
      missionData: MissionData(
        mission: 'Why might active work in emerging markets?',
        options: ['Less research means more mispricing opportunities', 'No reason', 'Emerging markets are simple', 'Everyone agrees on prices'],
        correctIndex: 0,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Active Analyst', badgeIcon: '🎯')),
  ],
);
