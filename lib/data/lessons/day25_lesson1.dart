import '../../models/lesson_models.dart';

final day25Lesson1 = LessonData(
  day: 25,
  title: "Understanding Market Cycles",
  emoji: '🔄',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Markets Move in Cycles',
      imagePath: 'assets/images/lessons/day25/lesson1/story.png',
      imagePrompt: 'cartoon market cycle: expansion, peak, contraction, trough, repeat',
      content: '''Markets do not go up or down forever.

They move in cycles of growth and decline.

Understanding cycles helps you stay calm during volatility!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Four Phases',
      imagePath: 'assets/images/lessons/day25/lesson1/content1.png',
      imagePrompt: 'cartoon four market phases: expansion, peak, contraction, trough',
      content: '''Market cycle phases:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Expansion', description: 'Economy and markets grow.'),
        BulletPoint(icon: '🔝', title: 'Peak', description: 'Growth slows at the top.'),
        BulletPoint(icon: '📉', title: 'Contraction', description: 'Economy and markets decline.'),
        BulletPoint(icon: '⬇️', title: 'Trough', description: 'Bottom before recovery.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Cycle Characteristics',
      imagePath: 'assets/images/lessons/day25/lesson1/content2.png',
      imagePrompt: 'cartoon market cycle characteristics: optimism at peak, fear at bottom',
      content: '''What happens in each phase:''',
      bullets: [
        BulletPoint(icon: '😊', title: 'Expansion', description: 'Optimism and rising prices.'),
        BulletPoint(icon: '🤑', title: 'Peak', description: 'Euphoria and overconfidence.'),
        BulletPoint(icon: '😟', title: 'Contraction', description: 'Fear and falling prices.'),
        BulletPoint(icon: '😰', title: 'Trough', description: 'Despair and bargains.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Phase Check',
      imagePath: 'assets/images/lessons/day25/lesson1/game1.png',
      imagePrompt: 'cartoon market peak',
      gameData: GameData(
        type: 'choice',
        instruction: 'The peak of a market cycle is when:',
        options: [GameOption(label: 'Markets are at their lowest', emoji: '⬇️'), GameOption(label: 'Growth slows at the top', emoji: '🔝')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Emotion Pop',
      imagePath: 'assets/images/lessons/day25/lesson1/game2.png',
      imagePrompt: 'cartoon fear at market bottom',
      gameData: GameData(
        type: 'balloon',
        instruction: 'At the trough of a cycle, investors often feel:',
        options: [GameOption(label: 'Euphoria', emoji: '🤑'), GameOption(label: 'Fear and despair', emoji: '😰'), GameOption(label: 'Calm and confident', emoji: '😊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day25/lesson1/question.png',
      imagePrompt: 'cartoon market cycle repeating',
      questionData: QuestionData(
        question: 'Market cycles:',
        options: ['Only happen once', 'Repeat over time', 'Are completely predictable', 'Do not exist'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Cycle Mission',
      imagePath: 'assets/images/lessons/day25/lesson1/mission.png',
      imagePrompt: 'cartoon understanding market cycles',
      missionData: MissionData(
        mission: 'Understanding cycles helps investors:',
        options: ['Time markets perfectly', 'Stay calm during volatility', 'Avoid all losses', 'Predict exact dates'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Cycle Student', badgeIcon: '🔄')),
  ],
);
