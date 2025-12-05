import '../../models/lesson_models.dart';

final day6Lesson5 = LessonData(
  day: 6,
  title: "Risks in Currency Trading",
  emoji: '⚠️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Handle with Care',
      imagePath: 'assets/images/lessons/day6/lesson5/story.png',
      imagePrompt: 'cartoon warning signs around forex trading platform, danger zones highlighted, cautionary style',
      content: '''Forex can be exciting, but it is also risky.

Most retail forex traders lose money. That is a fact.

Understanding the risks is crucial before you start!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Risks',
      imagePath: 'assets/images/lessons/day6/lesson5/content1.png',
      imagePrompt: 'cartoon danger signs: leverage bomb, volatility storm, overnight gaps',
      content: '''Forex trading has significant risks:''',
      bullets: [
        BulletPoint(icon: '💣', title: 'Leverage Risk', description: 'Can wipe out your account quickly.'),
        BulletPoint(icon: '🌊', title: 'Volatility', description: 'Prices can move sharply and suddenly.'),
        BulletPoint(icon: '🌙', title: 'Gap Risk', description: 'Prices can jump overnight.'),
        BulletPoint(icon: '😰', title: 'Emotional Risk', description: 'Fear and greed lead to bad decisions.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Protecting Yourself',
      imagePath: 'assets/images/lessons/day6/lesson5/content2.png',
      imagePrompt: 'cartoon shield with risk management tools: stop loss, position sizing, education',
      content: '''How to reduce forex risks:''',
      bullets: [
        BulletPoint(icon: '🛑', title: 'Use Stop Losses', description: 'Automatically exit losing trades.'),
        BulletPoint(icon: '📏', title: 'Small Position Sizes', description: 'Never risk too much on one trade.'),
        BulletPoint(icon: '⚡', title: 'Limit Leverage', description: 'Lower leverage = lower risk.'),
        BulletPoint(icon: '📚', title: 'Education', description: 'Learn before you trade real money.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Reality',
      imagePath: 'assets/images/lessons/day6/lesson5/game1.png',
      imagePrompt: 'cartoon statistics showing retail trader success rates',
      gameData: GameData(
        type: 'choice',
        instruction: 'What happens to MOST retail forex traders?',
        options: [GameOption(label: 'They get rich quickly', emoji: '🤑'), GameOption(label: 'They lose money', emoji: '📉')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Protection Pop',
      imagePath: 'assets/images/lessons/day6/lesson5/game2.png',
      imagePrompt: 'cartoon balloons with risk management tools',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What tool automatically exits a losing trade?',
        options: [GameOption(label: 'Buy Button', emoji: '🟢'), GameOption(label: 'Stop Loss', emoji: '🛑'), GameOption(label: 'More Leverage', emoji: '⚡')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day6/lesson5/question.png',
      imagePrompt: 'cartoon leverage settings with warning signs',
      questionData: QuestionData(
        question: 'How can you REDUCE forex trading risk?',
        options: ['Use maximum leverage', 'Use lower leverage and stop losses', 'Trade without any research', 'Risk everything on one trade'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Safety Mission',
      imagePath: 'assets/images/lessons/day6/lesson5/mission.png',
      imagePrompt: 'cartoon new trader reading and learning before starting',
      missionData: MissionData(
        mission: 'What is the BEST approach to forex trading?',
        options: ['Get rich quick with high leverage', 'Learn thoroughly, practice with demo, manage risk carefully', 'Copy random traders online', 'Trade based on feelings'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Risk Aware', badgeIcon: '⚠️')),
  ],
);
