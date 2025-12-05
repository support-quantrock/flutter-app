import '../../models/lesson_models.dart';

final day25Lesson2 = LessonData(
  day: 25,
  title: "Bull and Bear Markets",
  emoji: '🐂',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Bulls vs Bears',
      imagePath: 'assets/images/lessons/day25/lesson2/story.png',
      imagePrompt: 'cartoon bull and bear facing off, stock market chart in background',
      content: '''Bull markets go up, bear markets go down.

These terms describe major market trends.

Knowing the difference helps you navigate both!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Bull Markets',
      imagePath: 'assets/images/lessons/day25/lesson2/content1.png',
      imagePrompt: 'cartoon bull market: prices rising, optimistic investors, green charts',
      content: '''Characteristics of bull markets:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Rising Prices', description: 'Typically up 20%+ from lows.'),
        BulletPoint(icon: '😊', title: 'Optimism', description: 'Investors feel confident.'),
        BulletPoint(icon: '💼', title: 'Strong Economy', description: 'Employment and growth rise.'),
        BulletPoint(icon: '⏰', title: 'Duration', description: 'Can last years.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Bear Markets',
      imagePath: 'assets/images/lessons/day25/lesson2/content2.png',
      imagePrompt: 'cartoon bear market: prices falling, worried investors, red charts',
      content: '''Characteristics of bear markets:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Falling Prices', description: 'Typically down 20%+ from highs.'),
        BulletPoint(icon: '😟', title: 'Pessimism', description: 'Investors feel fearful.'),
        BulletPoint(icon: '📊', title: 'Weak Economy', description: 'Often during recessions.'),
        BulletPoint(icon: '⏱️', title: 'Shorter', description: 'Usually shorter than bulls.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Market Check',
      imagePath: 'assets/images/lessons/day25/lesson2/game1.png',
      imagePrompt: 'cartoon bull market rising',
      gameData: GameData(
        type: 'choice',
        instruction: 'A bull market means prices are:',
        options: [GameOption(label: 'Falling significantly', emoji: '📉'), GameOption(label: 'Rising significantly', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Definition Pop',
      imagePath: 'assets/images/lessons/day25/lesson2/game2.png',
      imagePrompt: 'cartoon bear market definition',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A bear market is typically defined as a drop of:',
        options: [GameOption(label: '5% from highs', emoji: '📊'), GameOption(label: '20% or more from highs', emoji: '📉'), GameOption(label: 'Any small decline', emoji: '⬇️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day25/lesson2/question.png',
      imagePrompt: 'cartoon bull vs bear duration',
      questionData: QuestionData(
        question: 'Historically, bull markets tend to be:',
        options: ['Shorter than bear markets', 'Longer than bear markets', 'Exactly the same length', 'Always 1 year'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Market Mission',
      imagePath: 'assets/images/lessons/day25/lesson2/mission.png',
      imagePrompt: 'cartoon investor in bear market',
      missionData: MissionData(
        mission: 'During a bear market, investors often feel:',
        options: ['Extremely confident', 'Fearful and pessimistic', 'Exactly the same', 'No emotions'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Market Navigator', badgeIcon: '🐂')),
  ],
);
