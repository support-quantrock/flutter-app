import '../../models/lesson_models.dart';

final day14Lesson4 = LessonData(
  day: 14,
  title: "Interest Rates Matter",
  emoji: '🏦',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Price of Money',
      imagePath: 'assets/images/lessons/day14/lesson4/story.png',
      imagePrompt: 'cartoon central bank as control room adjusting interest rate lever, affecting economy',
      content: '''Interest rates are the cost of borrowing money.

Central banks set rates to control the economy.

Rates affect everything: mortgages, stocks, bonds, and more!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Rates Work',
      imagePath: 'assets/images/lessons/day14/lesson4/content1.png',
      imagePrompt: 'cartoon interest rate effects: high rates slow economy, low rates speed it up',
      content: '''Interest rate effects:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Higher Rates', description: 'Borrowing costly, slows economy.'),
        BulletPoint(icon: '📉', title: 'Lower Rates', description: 'Borrowing cheap, stimulates economy.'),
        BulletPoint(icon: '🏠', title: 'Mortgages', description: 'Rates affect home buying.'),
        BulletPoint(icon: '💳', title: 'Credit Cards', description: 'Higher rates = more expensive debt.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Rates and Investments',
      imagePath: 'assets/images/lessons/day14/lesson4/content2.png',
      imagePrompt: 'cartoon interest rates affecting stocks and bonds in opposite directions',
      content: '''How rates affect investments:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Stocks', description: 'Rising rates often pressure stocks.'),
        BulletPoint(icon: '📊', title: 'Bonds', description: 'Rate rises = bond prices fall.'),
        BulletPoint(icon: '💵', title: 'Savings', description: 'Higher rates = better savings returns.'),
        BulletPoint(icon: '💱', title: 'Currency', description: 'Higher rates attract foreign money.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Rate Check',
      imagePath: 'assets/images/lessons/day14/lesson4/game1.png',
      imagePrompt: 'cartoon interest rate meaning',
      gameData: GameData(
        type: 'choice',
        instruction: 'Higher interest rates make borrowing:',
        options: [GameOption(label: 'Cheaper', emoji: '💰'), GameOption(label: 'More expensive', emoji: '💸')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Effect Pop',
      imagePath: 'assets/images/lessons/day14/lesson4/game2.png',
      imagePrompt: 'cartoon rising rates and stocks',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Rising interest rates often:',
        options: [GameOption(label: 'Boost stock prices', emoji: '🚀'), GameOption(label: 'Pressure stock prices', emoji: '📉'), GameOption(label: 'Have no effect', emoji: '➡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day14/lesson4/question.png',
      imagePrompt: 'cartoon central bank setting rates',
      questionData: QuestionData(
        question: 'Who typically sets interest rates?',
        options: ['Individual banks', 'Central bank (like the Fed)', 'Stock market', 'Companies'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Rate Mission',
      imagePath: 'assets/images/lessons/day14/lesson4/mission.png',
      imagePrompt: 'cartoon bonds and interest rates',
      missionData: MissionData(
        mission: 'When interest rates rise, existing bond prices:',
        options: ['Rise', 'Fall', 'Stay same', 'Disappear'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Rate Expert', badgeIcon: '🏦')),
  ],
);
