import '../../models/lesson_models.dart';

final day21Lesson3 = LessonData(
  day: 21,
  title: "Tax-Loss Harvesting",
  emoji: '🌾',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Turning Losses into Savings',
      imagePath: 'assets/images/lessons/day21/lesson3/story.png',
      imagePrompt: 'cartoon investor harvesting tax losses like crops, turning red to green',
      content: '''You can use investment losses to reduce your taxes!

Sell losing investments to offset gains.

This is called tax-loss harvesting.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How It Works',
      imagePath: 'assets/images/lessons/day21/lesson3/content1.png',
      imagePrompt: 'cartoon tax-loss harvesting: sell loser, offset winner gains, reduce tax bill',
      content: '''Tax-loss harvesting explained:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Sell Loser', description: 'Sell investment at a loss.'),
        BulletPoint(icon: '⚖️', title: 'Offset Gains', description: 'Use loss to reduce taxable gains.'),
        BulletPoint(icon: '💰', title: 'Save Taxes', description: 'Lower your tax bill.'),
        BulletPoint(icon: '🔄', title: 'Reinvest', description: 'Buy similar investment to stay invested.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Rules to Know',
      imagePath: 'assets/images/lessons/day21/lesson3/content2.png',
      imagePrompt: 'cartoon wash sale rule warning: 30 day wait, substantially identical rule',
      content: '''Important rules:''',
      bullets: [
        BulletPoint(icon: '⚠️', title: 'Wash Sale', description: 'Cannot buy same investment within 30 days.'),
        BulletPoint(icon: '💵', title: 'Limit', description: 'Can deduct up to 3000 per year against income.'),
        BulletPoint(icon: '➡️', title: 'Carry Forward', description: 'Unused losses carry to future years.'),
        BulletPoint(icon: '📝', title: 'Keep Records', description: 'Track all transactions.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Harvest Check',
      imagePath: 'assets/images/lessons/day21/lesson3/game1.png',
      imagePrompt: 'cartoon tax-loss harvesting purpose',
      gameData: GameData(
        type: 'choice',
        instruction: 'Tax-loss harvesting uses losses to:',
        options: [GameOption(label: 'Increase taxes', emoji: '📈'), GameOption(label: 'Reduce your tax bill', emoji: '📉')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Rule Pop',
      imagePath: 'assets/images/lessons/day21/lesson3/game2.png',
      imagePrompt: 'cartoon wash sale 30 day rule',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The wash sale rule requires waiting:',
        options: [GameOption(label: '1 day', emoji: '1️⃣'), GameOption(label: '30 days', emoji: '📅'), GameOption(label: '1 year', emoji: '📆')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day21/lesson3/question.png',
      imagePrompt: 'cartoon carry forward losses',
      questionData: QuestionData(
        question: 'Unused tax losses:',
        options: ['Disappear forever', 'Can be carried forward to future years', 'Become income', 'Must be used immediately'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Harvest Mission',
      imagePath: 'assets/images/lessons/day21/lesson3/mission.png',
      imagePrompt: 'cartoon smart tax-loss harvesting',
      missionData: MissionData(
        mission: 'After tax-loss harvesting, what should you do?',
        options: ['Never invest again', 'Buy a similar investment to stay in the market', 'Only hold cash', 'Ignore the loss'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Loss Harvester', badgeIcon: '🌾')),
  ],
);
