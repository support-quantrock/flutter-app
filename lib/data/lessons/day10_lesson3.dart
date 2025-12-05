import '../../models/lesson_models.dart';

final day10Lesson3 = LessonData(
  day: 10,
  title: "Position Sizing",
  emoji: '📏',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'How Much to Invest',
      imagePath: 'assets/images/lessons/day10/lesson3/story.png',
      imagePrompt: 'cartoon pie chart showing position sizes in portfolio, money allocation concept',
      content: '''Position sizing is deciding how much to put in each investment.

Too much in one thing is risky.

Smart sizing protects your overall portfolio!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Sizing Rules',
      imagePath: 'assets/images/lessons/day10/lesson3/content1.png',
      imagePrompt: 'cartoon position sizing rules: percentage limits, risk per trade, portfolio balance',
      content: '''Common position sizing rules:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Percentage Rule', description: 'No single investment over 5-10%.'),
        BulletPoint(icon: '💰', title: 'Risk Per Trade', description: 'Never risk more than 1-2% on one trade.'),
        BulletPoint(icon: '⚖️', title: 'Balance', description: 'Keep investments roughly equal sized.'),
        BulletPoint(icon: '🎯', title: 'Conviction', description: 'Size based on confidence level.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Sizing Matters',
      imagePath: 'assets/images/lessons/day10/lesson3/content2.png',
      imagePrompt: 'cartoon comparison: small position loss vs large position loss impact',
      content: '''Position sizing protects you:''',
      bullets: [
        BulletPoint(icon: '🛡️', title: 'Limits Damage', description: 'Bad pick hurts less when sized small.'),
        BulletPoint(icon: '😌', title: 'Reduces Stress', description: 'No single position keeps you up at night.'),
        BulletPoint(icon: '💪', title: 'Preserves Capital', description: 'Survive mistakes to invest another day.'),
        BulletPoint(icon: '📈', title: 'Steady Growth', description: 'Consistent approach beats wild swings.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Size Check',
      imagePath: 'assets/images/lessons/day10/lesson3/game1.png',
      imagePrompt: 'cartoon proper position sizing',
      gameData: GameData(
        type: 'choice',
        instruction: 'Position sizing helps you:',
        options: [GameOption(label: 'Maximize risk', emoji: '🎰'), GameOption(label: 'Control how much you could lose', emoji: '📏')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Rule Pop',
      imagePath: 'assets/images/lessons/day10/lesson3/game2.png',
      imagePrompt: 'cartoon position sizing rules',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A common rule is to keep single positions:',
        options: [GameOption(label: '100% of portfolio', emoji: '💯'), GameOption(label: 'Under 10% of portfolio', emoji: '📊'), GameOption(label: '50% of portfolio', emoji: '➗')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day10/lesson3/question.png',
      imagePrompt: 'cartoon risk per trade concept',
      questionData: QuestionData(
        question: 'Why should you limit risk per trade?',
        options: ['No reason', 'To preserve capital for future investments', 'To make more money', 'It is required by law'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Sizing Mission',
      imagePath: 'assets/images/lessons/day10/lesson3/mission.png',
      imagePrompt: 'cartoon balanced portfolio with proper sizing',
      missionData: MissionData(
        mission: 'What happens if one position is too large?',
        options: ['Nothing bad', 'One bad pick can devastate your portfolio', 'Guaranteed profit', 'Lower risk'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Size Master', badgeIcon: '📏')),
  ],
);
