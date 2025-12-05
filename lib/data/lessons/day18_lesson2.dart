import '../../models/lesson_models.dart';

final day18Lesson2 = LessonData(
  day: 18,
  title: "Major World Markets",
  emoji: '🏛️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Stock Exchanges Worldwide',
      imagePath: 'assets/images/lessons/day18/lesson2/story.png',
      imagePrompt: 'cartoon major stock exchanges around the world: NYSE, London, Tokyo, Hong Kong',
      content: '''Stock markets exist in every major country.

The biggest are in New York, London, Tokyo, and Hong Kong.

Each market has its own hours and characteristics!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Biggest Markets',
      imagePath: 'assets/images/lessons/day18/lesson2/content1.png',
      imagePrompt: 'cartoon top stock exchanges by size: NYSE, NASDAQ, Tokyo, Shanghai, London',
      content: '''Worlds largest stock exchanges:''',
      bullets: [
        BulletPoint(icon: '🗽', title: 'NYSE', description: 'New York - worlds largest by value.'),
        BulletPoint(icon: '💻', title: 'NASDAQ', description: 'US tech-heavy exchange.'),
        BulletPoint(icon: '🗼', title: 'Tokyo', description: 'Japan\'s main exchange.'),
        BulletPoint(icon: '🏙️', title: 'Shanghai', description: 'China\'s growing market.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Market Hours',
      imagePath: 'assets/images/lessons/day18/lesson2/content2.png',
      imagePrompt: 'cartoon 24-hour clock showing when different markets open: Asia, Europe, Americas',
      content: '''Markets follow the sun:''',
      bullets: [
        BulletPoint(icon: '🌅', title: 'Asia Opens First', description: 'Tokyo, Hong Kong, Shanghai.'),
        BulletPoint(icon: '☀️', title: 'Europe Next', description: 'London, Frankfurt, Paris.'),
        BulletPoint(icon: '🌄', title: 'Americas Last', description: 'New York, Toronto, Sao Paulo.'),
        BulletPoint(icon: '🔄', title: 'Overlap', description: 'Some hours multiple markets open.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Exchange Check',
      imagePath: 'assets/images/lessons/day18/lesson2/game1.png',
      imagePrompt: 'cartoon NYSE as largest exchange',
      gameData: GameData(
        type: 'choice',
        instruction: 'The world\'s largest stock exchange is:',
        options: [GameOption(label: 'London', emoji: '🇬🇧'), GameOption(label: 'NYSE in New York', emoji: '🗽')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Time Pop',
      imagePath: 'assets/images/lessons/day18/lesson2/game2.png',
      imagePrompt: 'cartoon Asian markets opening first',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which markets open first each day?',
        options: [GameOption(label: 'American markets', emoji: '🗽'), GameOption(label: 'Asian markets', emoji: '🌅'), GameOption(label: 'European markets', emoji: '🇪🇺')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day18/lesson2/question.png',
      imagePrompt: 'cartoon NASDAQ characteristics',
      questionData: QuestionData(
        question: 'NASDAQ is known for having many:',
        options: ['Oil companies', 'Technology companies', 'Banks only', 'No companies'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Markets Mission',
      imagePath: 'assets/images/lessons/day18/lesson2/mission.png',
      imagePrompt: 'cartoon global markets following the sun',
      missionData: MissionData(
        mission: 'Why do markets open at different times?',
        options: ['Random choice', 'Different time zones around the world', 'They all open at once', 'Only one market exists'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Market Mapper', badgeIcon: '🏛️')),
  ],
);
