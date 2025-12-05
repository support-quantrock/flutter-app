import '../../models/lesson_models.dart';

final day16Lesson1 = LessonData(
  day: 16,
  title: "Value Investing",
  emoji: '💎',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Finding Hidden Gems',
      imagePath: 'assets/images/lessons/day16/lesson1/story.png',
      imagePrompt: 'cartoon investor finding diamond in rough, undervalued stock discovery',
      content: '''Value investing finds undervalued companies.

Warren Buffett made billions using this approach!

Buy great companies when they are on sale.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Value Investing Basics',
      imagePath: 'assets/images/lessons/day16/lesson1/content1.png',
      imagePrompt: 'cartoon value investing principles: margin of safety, intrinsic value, patience',
      content: '''Core value investing principles:''',
      bullets: [
        BulletPoint(icon: '🔍', title: 'Find Undervalued', description: 'Stocks trading below true worth.'),
        BulletPoint(icon: '🛡️', title: 'Margin of Safety', description: 'Buy well below fair value.'),
        BulletPoint(icon: '⏳', title: 'Patience', description: 'Wait for market to recognize value.'),
        BulletPoint(icon: '📊', title: 'Research', description: 'Study financials deeply.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How to Find Value',
      imagePath: 'assets/images/lessons/day16/lesson1/content2.png',
      imagePrompt: 'cartoon value metrics: low P/E, low P/B, strong balance sheet, dividend payers',
      content: '''Signs of value stocks:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Low P/E', description: 'Below industry average.'),
        BulletPoint(icon: '📖', title: 'Low P/B', description: 'Trading near book value.'),
        BulletPoint(icon: '💰', title: 'Dividends', description: 'Paying regular dividends.'),
        BulletPoint(icon: '💪', title: 'Strong Balance', description: 'Low debt, lots of cash.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Value Check',
      imagePath: 'assets/images/lessons/day16/lesson1/game1.png',
      imagePrompt: 'cartoon value investing goal',
      gameData: GameData(
        type: 'choice',
        instruction: 'Value investing looks for stocks that are:',
        options: [GameOption(label: 'Expensive and popular', emoji: '📈'), GameOption(label: 'Undervalued and overlooked', emoji: '💎')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Safety Pop',
      imagePath: 'assets/images/lessons/day16/lesson1/game2.png',
      imagePrompt: 'cartoon margin of safety concept',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Margin of safety means:',
        options: [GameOption(label: 'Buying at any price', emoji: '💸'), GameOption(label: 'Buying well below fair value', emoji: '🛡️'), GameOption(label: 'Selling immediately', emoji: '🏃')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day16/lesson1/question.png',
      imagePrompt: 'cartoon famous value investor',
      questionData: QuestionData(
        question: 'Which famous investor uses value investing?',
        options: ['No one famous', 'Warren Buffett', 'Only day traders', 'Video game characters'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Value Mission',
      imagePath: 'assets/images/lessons/day16/lesson1/mission.png',
      imagePrompt: 'cartoon patient value investor waiting',
      missionData: MissionData(
        mission: 'Value investing requires:',
        options: ['Quick trading', 'Patience and research', 'Ignoring fundamentals', 'Following crowds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Value Seeker', badgeIcon: '💎')),
  ],
);
