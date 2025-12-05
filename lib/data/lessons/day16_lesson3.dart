import '../../models/lesson_models.dart';

final day16Lesson3 = LessonData(
  day: 16,
  title: "Dividend Investing",
  emoji: '💵',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Getting Paid to Wait',
      imagePath: 'assets/images/lessons/day16/lesson3/story.png',
      imagePrompt: 'cartoon dividend checks arriving in mailbox regularly, passive income stream',
      content: '''Dividend investing focuses on income.

Companies pay you just for holding their stock!

Over time, dividends can compound into serious wealth.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Dividend Basics',
      imagePath: 'assets/images/lessons/day16/lesson3/content1.png',
      imagePrompt: 'cartoon dividend payment cycle: declaration, ex-date, payment, reinvestment',
      content: '''Understanding dividends:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'What', description: 'Cash payments from company profits.'),
        BulletPoint(icon: '📅', title: 'Frequency', description: 'Usually quarterly, some monthly.'),
        BulletPoint(icon: '📊', title: 'Yield', description: 'Annual dividend ÷ stock price.'),
        BulletPoint(icon: '🔄', title: 'DRIP', description: 'Reinvest dividends to buy more shares.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Finding Good Dividends',
      imagePath: 'assets/images/lessons/day16/lesson3/content2.png',
      imagePrompt: 'cartoon dividend aristocrats crown, consistent dividend growers',
      content: '''Quality dividend characteristics:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Growing', description: 'Dividend increases over time.'),
        BulletPoint(icon: '🏆', title: 'Aristocrats', description: '25+ years of dividend growth.'),
        BulletPoint(icon: '⚖️', title: 'Sustainable', description: 'Payout ratio below 60%.'),
        BulletPoint(icon: '💪', title: 'Strong Company', description: 'Profits support the dividend.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Dividend Check',
      imagePath: 'assets/images/lessons/day16/lesson3/game1.png',
      imagePrompt: 'cartoon dividend yield calculation',
      gameData: GameData(
        type: 'choice',
        instruction: 'Dividend yield is:',
        options: [GameOption(label: 'Stock price ÷ dividend', emoji: '💹'), GameOption(label: 'Annual dividend ÷ stock price', emoji: '💵')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Aristocrat Pop',
      imagePath: 'assets/images/lessons/day16/lesson3/game2.png',
      imagePrompt: 'cartoon dividend aristocrat definition',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Dividend aristocrats have:',
        options: [GameOption(label: 'Cut dividends recently', emoji: '📉'), GameOption(label: '25+ years of dividend growth', emoji: '🏆'), GameOption(label: 'No dividends', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day16/lesson3/question.png',
      imagePrompt: 'cartoon DRIP reinvestment',
      questionData: QuestionData(
        question: 'DRIP stands for:',
        options: ['Daily Returns Investment Plan', 'Dividend Reinvestment Plan', 'Dollar Ratio Investment', 'None of these'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Dividend Mission',
      imagePath: 'assets/images/lessons/day16/lesson3/mission.png',
      imagePrompt: 'cartoon dividend compounding over time',
      missionData: MissionData(
        mission: 'What makes dividend investing powerful?',
        options: ['Quick profits', 'Dividends compound over time', 'No risk involved', 'Guaranteed returns'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Dividend Collector', badgeIcon: '💵')),
  ],
);
