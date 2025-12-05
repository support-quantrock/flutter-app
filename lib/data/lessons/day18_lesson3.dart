import '../../models/lesson_models.dart';

final day18Lesson3 = LessonData(
  day: 18,
  title: "Currency Risk",
  emoji: '💱',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Money Changes Value',
      imagePath: 'assets/images/lessons/day18/lesson3/story.png',
      imagePrompt: 'cartoon different currencies on seesaw, exchange rates changing',
      content: '''When you invest abroad, you face currency risk.

Your investment might gain, but if the currency falls, you could still lose!

Understanding currency is key to global investing.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Currency Risk Works',
      imagePath: 'assets/images/lessons/day18/lesson3/content1.png',
      imagePrompt: 'cartoon example: Japanese stock gains 10% but yen falls 15%, net loss',
      content: '''Currency risk explained:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Stock Gains', description: 'Your foreign stock rises 10%.'),
        BulletPoint(icon: '💱', title: 'Currency Falls', description: 'That currency drops 15%.'),
        BulletPoint(icon: '📉', title: 'Net Result', description: 'You might still lose money.'),
        BulletPoint(icon: '🔄', title: 'Works Both Ways', description: 'Currency gains can boost returns too.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Managing Currency Risk',
      imagePath: 'assets/images/lessons/day18/lesson3/content2.png',
      imagePrompt: 'cartoon hedging currency risk with shield, diversification across currencies',
      content: '''How to handle currency risk:''',
      bullets: [
        BulletPoint(icon: '🛡️', title: 'Hedged Funds', description: 'Some ETFs hedge currency.'),
        BulletPoint(icon: '🌈', title: 'Diversify', description: 'Spread across multiple currencies.'),
        BulletPoint(icon: '⏳', title: 'Long Term', description: 'Currency swings average out.'),
        BulletPoint(icon: '🧠', title: 'Accept It', description: 'Part of global investing.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Currency Check',
      imagePath: 'assets/images/lessons/day18/lesson3/game1.png',
      imagePrompt: 'cartoon currency risk concept',
      gameData: GameData(
        type: 'choice',
        instruction: 'Currency risk means:',
        options: [GameOption(label: 'Exchange rates never change', emoji: '➡️'), GameOption(label: 'Exchange rate changes affect your returns', emoji: '💱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Hedge Pop',
      imagePath: 'assets/images/lessons/day18/lesson3/game2.png',
      imagePrompt: 'cartoon hedged ETF protecting from currency',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Currency-hedged funds try to:',
        options: [GameOption(label: 'Increase currency risk', emoji: '📈'), GameOption(label: 'Reduce currency risk', emoji: '🛡️'), GameOption(label: 'Ignore currencies', emoji: '🙈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day18/lesson3/question.png',
      imagePrompt: 'cartoon long-term currency averaging',
      questionData: QuestionData(
        question: 'Over the long term, currency movements:',
        options: ['Only go up', 'Tend to average out', 'Only go down', 'Never change'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Currency Mission',
      imagePath: 'assets/images/lessons/day18/lesson3/mission.png',
      imagePrompt: 'cartoon investor accepting currency as part of global investing',
      missionData: MissionData(
        mission: 'Currency risk is:',
        options: ['Not real', 'Part of global investing to understand', 'Only for banks', 'Impossible to manage'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Currency Aware', badgeIcon: '💱')),
  ],
);
