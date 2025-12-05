import '../../models/lesson_models.dart';

final day10Lesson2 = LessonData(
  day: 10,
  title: "Diversification",
  emoji: '🥚',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Do Not Put All Eggs in One Basket',
      imagePath: 'assets/images/lessons/day10/lesson2/story.png',
      imagePrompt: 'cartoon eggs in multiple baskets vs all in one, diversification concept',
      content: '''Diversification means spreading your investments.

If you put all your money in one thing and it fails, you lose everything!

But if you spread it out, some losses are balanced by gains.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How to Diversify',
      imagePath: 'assets/images/lessons/day10/lesson2/content1.png',
      imagePrompt: 'cartoon diversified portfolio: stocks, bonds, real estate, international assets',
      content: '''Ways to diversify:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Asset Classes', description: 'Mix stocks, bonds, real estate.'),
        BulletPoint(icon: '🏭', title: 'Industries', description: 'Tech, healthcare, finance, and more.'),
        BulletPoint(icon: '🌍', title: 'Geography', description: 'Invest in different countries.'),
        BulletPoint(icon: '📅', title: 'Time', description: 'Invest regularly over time.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Diversification Benefits',
      imagePath: 'assets/images/lessons/day10/lesson2/content2.png',
      imagePrompt: 'cartoon smooth portfolio performance vs volatile single stock',
      content: '''Why diversification helps:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Reduces Risk', description: 'One bad investment hurts less.'),
        BulletPoint(icon: '📊', title: 'Smoother Returns', description: 'Less dramatic ups and downs.'),
        BulletPoint(icon: '😴', title: 'Peace of Mind', description: 'Less stress about single investments.'),
        BulletPoint(icon: '🎯', title: 'Better Odds', description: 'More chances to pick winners.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Egg Check',
      imagePath: 'assets/images/lessons/day10/lesson2/game1.png',
      imagePrompt: 'cartoon diversification proverb visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'Diversification means:',
        options: [GameOption(label: 'Putting all money in one stock', emoji: '1️⃣'), GameOption(label: 'Spreading investments across many', emoji: '🌈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Way Pop',
      imagePath: 'assets/images/lessons/day10/lesson2/game2.png',
      imagePrompt: 'cartoon diversification methods',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which is a way to diversify?',
        options: [GameOption(label: 'Buy only tech stocks', emoji: '💻'), GameOption(label: 'Mix different industries', emoji: '🏭'), GameOption(label: 'One stock only', emoji: '1️⃣')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day10/lesson2/question.png',
      imagePrompt: 'cartoon portfolio protection concept',
      questionData: QuestionData(
        question: 'What does diversification protect against?',
        options: ['All losses', 'Impact of one bad investment', 'Taxes', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Diversify Mission',
      imagePath: 'assets/images/lessons/day10/lesson2/mission.png',
      imagePrompt: 'cartoon well-diversified investor',
      missionData: MissionData(
        mission: 'What is the main benefit of diversification?',
        options: ['Guaranteed profits', 'Reduces overall risk', 'More complexity', 'Higher fees'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Diversifier', badgeIcon: '🥚')),
  ],
);
