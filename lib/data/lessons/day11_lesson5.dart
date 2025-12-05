import '../../models/lesson_models.dart';

final day11Lesson5 = LessonData(
  day: 11,
  title: "Volume Analysis",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Power Behind Price',
      imagePath: 'assets/images/lessons/day11/lesson5/story.png',
      imagePrompt: 'cartoon volume bars under price chart, showing high and low volume periods',
      content: '''Volume shows how many shares or contracts traded.

High volume means strong interest.
Low volume means weak interest.

Volume confirms if price moves are real or fake!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Volume Shows',
      imagePath: 'assets/images/lessons/day11/lesson5/content1.png',
      imagePrompt: 'cartoon volume as crowd size: high volume large crowd, low volume small crowd',
      content: '''Understanding volume:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Activity Level', description: 'How much trading is happening.'),
        BulletPoint(icon: '💪', title: 'High Volume', description: 'Strong conviction in the move.'),
        BulletPoint(icon: '😴', title: 'Low Volume', description: 'Weak or suspicious move.'),
        BulletPoint(icon: '🔍', title: 'Confirmation', description: 'Volume confirms price action.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Volume Signals',
      imagePath: 'assets/images/lessons/day11/lesson5/content2.png',
      imagePrompt: 'cartoon volume analysis scenarios: breakout with high volume, fake breakout with low volume',
      content: '''Key volume signals:''',
      bullets: [
        BulletPoint(icon: '🚀', title: 'Breakout + High Volume', description: 'Strong signal, likely to continue.'),
        BulletPoint(icon: '⚠️', title: 'Breakout + Low Volume', description: 'Suspicious, might be fake.'),
        BulletPoint(icon: '📈', title: 'Uptrend + Rising Volume', description: 'Healthy trend confirmation.'),
        BulletPoint(icon: '📉', title: 'Downtrend + Rising Volume', description: 'Strong selling pressure.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Volume Check',
      imagePath: 'assets/images/lessons/day11/lesson5/game1.png',
      imagePrompt: 'cartoon high vs low volume comparison',
      gameData: GameData(
        type: 'choice',
        instruction: 'High volume during a breakout suggests:',
        options: [GameOption(label: 'Fake move', emoji: '🎭'), GameOption(label: 'Strong conviction', emoji: '💪')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Signal Pop',
      imagePath: 'assets/images/lessons/day11/lesson5/game2.png',
      imagePrompt: 'cartoon volume warning signs',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A breakout with LOW volume is:',
        options: [GameOption(label: 'Very reliable', emoji: '✅'), GameOption(label: 'Suspicious', emoji: '⚠️'), GameOption(label: 'Guaranteed profit', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day11/lesson5/question.png',
      imagePrompt: 'cartoon volume analysis concept',
      questionData: QuestionData(
        question: 'What does volume measure?',
        options: ['Price changes', 'Number of shares traded', 'Company value', 'Interest rates'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Volume Mission',
      imagePath: 'assets/images/lessons/day11/lesson5/mission.png',
      imagePrompt: 'cartoon trader checking volume on chart',
      missionData: MissionData(
        mission: 'Why should traders watch volume?',
        options: ['Volume is not important', 'It confirms if price moves are real', 'Only for fun', 'It predicts earnings'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Volume Analyst', badgeIcon: '📊')),
  ],
);
