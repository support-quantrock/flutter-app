import '../../models/lesson_models.dart';

final day15Lesson1 = LessonData(
  day: 15,
  title: "Modern Portfolio Theory",
  emoji: '📐',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Science of Portfolios',
      imagePath: 'assets/images/lessons/day15/lesson1/story.png',
      imagePrompt: 'cartoon scientist with portfolio optimization equations, Nobel Prize winning theory',
      content: '''Modern Portfolio Theory won a Nobel Prize!

It proves that combining investments reduces risk.

You can get better returns for the same risk - or same returns with less risk!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Key Concepts',
      imagePath: 'assets/images/lessons/day15/lesson1/content1.png',
      imagePrompt: 'cartoon portfolio theory concepts: diversification benefit, correlation, efficient frontier',
      content: '''Core ideas of portfolio theory:''',
      bullets: [
        BulletPoint(icon: '🎯', title: 'Diversification', description: 'Combining assets reduces risk.'),
        BulletPoint(icon: '🔗', title: 'Correlation', description: 'How assets move together matters.'),
        BulletPoint(icon: '📊', title: 'Risk vs Return', description: 'Balance between risk and reward.'),
        BulletPoint(icon: '✨', title: 'Efficient Frontier', description: 'Best possible risk-return combos.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Correlation Explained',
      imagePath: 'assets/images/lessons/day15/lesson1/content2.png',
      imagePrompt: 'cartoon assets moving together vs opposite vs independent, correlation visualization',
      content: '''Understanding correlation:''',
      bullets: [
        BulletPoint(icon: '➡️', title: 'Positive', description: 'Assets move in same direction.'),
        BulletPoint(icon: '↔️', title: 'Negative', description: 'Assets move in opposite directions.'),
        BulletPoint(icon: '🎯', title: 'Zero', description: 'Assets move independently.'),
        BulletPoint(icon: '💡', title: 'Best Mix', description: 'Low correlation = better diversification.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Theory Check',
      imagePath: 'assets/images/lessons/day15/lesson1/game1.png',
      imagePrompt: 'cartoon diversification benefit',
      gameData: GameData(
        type: 'choice',
        instruction: 'Portfolio theory shows that diversification:',
        options: [GameOption(label: 'Increases risk', emoji: '📈'), GameOption(label: 'Reduces risk', emoji: '🛡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Correlation Pop',
      imagePath: 'assets/images/lessons/day15/lesson1/game2.png',
      imagePrompt: 'cartoon low correlation assets',
      gameData: GameData(
        type: 'balloon',
        instruction: 'For best diversification, assets should have:',
        options: [GameOption(label: 'High positive correlation', emoji: '➡️'), GameOption(label: 'Low or negative correlation', emoji: '↔️'), GameOption(label: 'No assets', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day15/lesson1/question.png',
      imagePrompt: 'cartoon efficient frontier line',
      questionData: QuestionData(
        question: 'The efficient frontier shows:',
        options: ['Worst portfolios', 'Best risk-return combinations', 'Only stocks', 'Random portfolios'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Portfolio Mission',
      imagePath: 'assets/images/lessons/day15/lesson1/mission.png',
      imagePrompt: 'cartoon Nobel Prize and portfolio theory',
      missionData: MissionData(
        mission: 'What did Modern Portfolio Theory prove?',
        options: ['Diversification is pointless', 'Combining assets can reduce risk', 'Only buy one stock', 'Risk cannot be managed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Portfolio Scientist', badgeIcon: '📐')),
  ],
);
