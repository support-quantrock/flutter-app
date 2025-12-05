import '../../models/lesson_models.dart';

final day12Lesson4 = LessonData(
  day: 12,
  title: "Bollinger Bands",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Bands of Volatility',
      imagePath: 'assets/images/lessons/day12/lesson4/story.png',
      imagePrompt: 'cartoon price chart with Bollinger Bands expanding and contracting like accordion',
      content: '''Bollinger Bands are three lines around price.

A middle line (moving average) with upper and lower bands.

Bands expand when volatile, contract when calm!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Band Structure',
      imagePath: 'assets/images/lessons/day12/lesson4/content1.png',
      imagePrompt: 'cartoon Bollinger Bands structure: middle 20-day SMA, upper and lower at 2 standard deviations',
      content: '''The three Bollinger Bands:''',
      bullets: [
        BulletPoint(icon: '➖', title: 'Middle Band', description: '20-period simple moving average.'),
        BulletPoint(icon: '⬆️', title: 'Upper Band', description: 'Middle + 2 standard deviations.'),
        BulletPoint(icon: '⬇️', title: 'Lower Band', description: 'Middle - 2 standard deviations.'),
        BulletPoint(icon: '📏', title: 'Band Width', description: 'Changes based on volatility.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Using Bollinger Bands',
      imagePath: 'assets/images/lessons/day12/lesson4/content2.png',
      imagePrompt: 'cartoon price touching bands: bounce from upper, bounce from lower, squeeze pattern',
      content: '''How traders use the bands:''',
      bullets: [
        BulletPoint(icon: '🔄', title: 'Mean Reversion', description: 'Price tends to return to middle.'),
        BulletPoint(icon: '📉', title: 'Upper Touch', description: 'Overbought - might fall.'),
        BulletPoint(icon: '📈', title: 'Lower Touch', description: 'Oversold - might rise.'),
        BulletPoint(icon: '🤏', title: 'Squeeze', description: 'Narrow bands = big move coming.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Band Check',
      imagePath: 'assets/images/lessons/day12/lesson4/game1.png',
      imagePrompt: 'cartoon wide vs narrow Bollinger Bands',
      gameData: GameData(
        type: 'choice',
        instruction: 'When Bollinger Bands are wide, it means:',
        options: [GameOption(label: 'Low volatility', emoji: '😴'), GameOption(label: 'High volatility', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Squeeze Pop',
      imagePath: 'assets/images/lessons/day12/lesson4/game2.png',
      imagePrompt: 'cartoon Bollinger Band squeeze pattern',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A Bollinger Band "squeeze" suggests:',
        options: [GameOption(label: 'Market will stay calm', emoji: '😴'), GameOption(label: 'Big move likely coming', emoji: '🚀'), GameOption(label: 'Nothing', emoji: '❓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day12/lesson4/question.png',
      imagePrompt: 'cartoon price at lower Bollinger Band',
      questionData: QuestionData(
        question: 'Price touching the lower band might suggest:',
        options: ['Buy more immediately', 'Potentially oversold', 'Sell everything', 'Ignore it'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Bollinger Mission',
      imagePath: 'assets/images/lessons/day12/lesson4/mission.png',
      imagePrompt: 'cartoon mean reversion to middle band',
      missionData: MissionData(
        mission: 'What does "mean reversion" mean with Bollinger Bands?',
        options: ['Price always goes up', 'Price tends to return to the middle band', 'Bands are mean', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Band Expert', badgeIcon: '📊')),
  ],
);
