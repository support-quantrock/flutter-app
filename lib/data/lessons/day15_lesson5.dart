import '../../models/lesson_models.dart';

final day15Lesson5 = LessonData(
  day: 15,
  title: "Building Your Portfolio",
  emoji: '🏗️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Putting It Together',
      imagePath: 'assets/images/lessons/day15/lesson5/story.png',
      imagePrompt: 'cartoon building blocks of portfolio coming together into solid structure',
      content: '''Time to build your portfolio!

Start with your goals and risk tolerance.

Then choose the right mix of assets for you!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Step by Step',
      imagePath: 'assets/images/lessons/day15/lesson5/content1.png',
      imagePrompt: 'cartoon portfolio building steps: goals, risk tolerance, allocation, invest, rebalance',
      content: '''Portfolio building process:''',
      bullets: [
        BulletPoint(icon: '1️⃣', title: 'Set Goals', description: 'What are you investing for?'),
        BulletPoint(icon: '2️⃣', title: 'Know Risk Tolerance', description: 'How much volatility can you handle?'),
        BulletPoint(icon: '3️⃣', title: 'Choose Allocation', description: 'Stock/bond/other mix.'),
        BulletPoint(icon: '4️⃣', title: 'Implement & Rebalance', description: 'Invest and maintain.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Investment Vehicles',
      imagePath: 'assets/images/lessons/day15/lesson5/content2.png',
      imagePrompt: 'cartoon investment options: index funds, ETFs, individual stocks, bonds',
      content: '''Ways to invest:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Index Funds', description: 'Low-cost, diversified, simple.'),
        BulletPoint(icon: '📈', title: 'ETFs', description: 'Trade like stocks, often low cost.'),
        BulletPoint(icon: '📃', title: 'Individual Stocks', description: 'More work, less diversification.'),
        BulletPoint(icon: '🎯', title: 'Target Date Funds', description: 'Automatic allocation by retirement year.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Step Check',
      imagePath: 'assets/images/lessons/day15/lesson5/game1.png',
      imagePrompt: 'cartoon first step in portfolio building',
      gameData: GameData(
        type: 'choice',
        instruction: 'The first step in building a portfolio is:',
        options: [GameOption(label: 'Buy random stocks', emoji: '🎲'), GameOption(label: 'Set your investment goals', emoji: '🎯')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Vehicle Pop',
      imagePath: 'assets/images/lessons/day15/lesson5/game2.png',
      imagePrompt: 'cartoon index fund simplicity',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Index funds are popular because they are:',
        options: [GameOption(label: 'Expensive and complex', emoji: '💸'), GameOption(label: 'Low-cost and diversified', emoji: '📊'), GameOption(label: 'Only for experts', emoji: '🎓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day15/lesson5/question.png',
      imagePrompt: 'cartoon target date fund concept',
      questionData: QuestionData(
        question: 'Target date funds automatically:',
        options: ['Pick stocks for you', 'Adjust allocation as you age', 'Guarantee returns', 'Only invest in bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Build Mission',
      imagePath: 'assets/images/lessons/day15/lesson5/mission.png',
      imagePrompt: 'cartoon simple portfolio approach',
      missionData: MissionData(
        mission: 'For beginners, a simple approach is:',
        options: ['Buy 50 individual stocks', 'Use low-cost index funds', 'Only buy options', 'Avoid investing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Portfolio Builder', badgeIcon: '🏗️')),
  ],
);
