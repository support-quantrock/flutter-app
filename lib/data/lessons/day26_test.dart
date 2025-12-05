import '../../models/lesson_models.dart';

final day26Test = LessonData(
  day: 26,
  title: "Day 26 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day26/test/q1.png',
      imagePrompt: 'cartoon brokerage types',
      questionData: QuestionData(
        question: 'Discount brokerages typically offer:',
        options: ['Personal financial advice', 'Lower fees for DIY investors', 'Only expensive options', 'No trading'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day26/test/q2.png',
      imagePrompt: 'cartoon SEC EDGAR',
      questionData: QuestionData(
        question: 'Official company filings are available at:',
        options: ['Only paid services', 'SEC EDGAR database', 'Social media', 'Nowhere'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day26/test/q3.png',
      imagePrompt: 'cartoon portfolio allocation',
      missionData: MissionData(
        mission: 'Asset allocation shows:',
        options: ['Only total value', 'How investments are distributed', 'Trading history only', 'Nothing useful'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day26/test/q4.png',
      imagePrompt: 'cartoon compound interest calculator',
      questionData: QuestionData(
        question: 'A compound interest calculator helps you:',
        options: ['File taxes', 'See how money grows over time', 'Find stocks to buy', 'Nothing useful'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day26/test/q5.png',
      imagePrompt: 'cartoon investment scam red flag',
      missionData: MissionData(
        mission: 'A promise of guaranteed returns is:',
        options: ['Always legitimate', 'A red flag for scams', 'Required by regulators', 'Normal practice'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 26 Complete', badgeIcon: '🧰')),
  ],
);
