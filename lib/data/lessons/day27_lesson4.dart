import '../../models/lesson_models.dart';

final day27Lesson4 = LessonData(
  day: 27,
  title: "Choosing Your Investments",
  emoji: '🎯',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Selecting the Right Vehicles',
      imagePath: 'assets/images/lessons/day27/lesson4/story.png',
      imagePrompt: 'cartoon choosing investments: index funds, ETFs, individual stocks, bonds',
      content: '''Now choose specific investments to fill your allocation.

Index funds, ETFs, or individual securities?

Simple approaches often work best!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Investment Options',
      imagePath: 'assets/images/lessons/day27/lesson4/content1.png',
      imagePrompt: 'cartoon investment options: index funds, ETFs, stocks, bonds',
      content: '''Ways to fill your allocation:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Index Funds', description: 'Low-cost, diversified, simple.'),
        BulletPoint(icon: '📈', title: 'ETFs', description: 'Trade like stocks, low fees.'),
        BulletPoint(icon: '🏢', title: 'Individual Stocks', description: 'More research, more risk.'),
        BulletPoint(icon: '📄', title: 'Bonds', description: 'Government or corporate.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Keeping It Simple',
      imagePath: 'assets/images/lessons/day27/lesson4/content2.png',
      imagePrompt: 'cartoon simple three-fund portfolio: US stocks, international, bonds',
      content: '''Simple portfolio approaches:''',
      bullets: [
        BulletPoint(icon: '3️⃣', title: 'Three-Fund Portfolio', description: 'US, international, bonds.'),
        BulletPoint(icon: '🎯', title: 'Target Date Funds', description: 'All-in-one solution.'),
        BulletPoint(icon: '💰', title: 'Low Costs', description: 'Fees matter over time.'),
        BulletPoint(icon: '🧘', title: 'Stay Simple', description: 'Complexity does not equal returns.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Option Check',
      imagePath: 'assets/images/lessons/day27/lesson4/game1.png',
      imagePrompt: 'cartoon index fund simplicity',
      gameData: GameData(
        type: 'choice',
        instruction: 'For most beginners, a good starting point is:',
        options: [GameOption(label: 'Complex trading strategies', emoji: '🔀'), GameOption(label: 'Low-cost index funds', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Cost Pop',
      imagePath: 'assets/images/lessons/day27/lesson4/game2.png',
      imagePrompt: 'cartoon investment fees impact',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Over time, investment fees:',
        options: [GameOption(label: 'Do not matter', emoji: '🤷'), GameOption(label: 'Can significantly impact returns', emoji: '💸'), GameOption(label: 'Improve performance', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day27/lesson4/question.png',
      imagePrompt: 'cartoon target date fund',
      questionData: QuestionData(
        question: 'Target date funds are designed for:',
        options: ['Daily trading', 'Hands-off investing toward retirement', 'Only experts', 'Maximum complexity'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Selection Mission',
      imagePath: 'assets/images/lessons/day27/lesson4/mission.png',
      imagePrompt: 'cartoon simple investment approach',
      missionData: MissionData(
        mission: 'When selecting investments:',
        options: ['More complex is always better', 'Simple, low-cost approaches often work best', 'Only buy expensive funds', 'Change daily'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Smart Selector', badgeIcon: '🎯')),
  ],
);
