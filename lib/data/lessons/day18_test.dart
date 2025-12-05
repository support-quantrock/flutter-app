import '../../models/lesson_models.dart';

final day18Test = LessonData(
  day: 18,
  title: "Day 18 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day18/test/q1.png',
      imagePrompt: 'cartoon global diversification benefit',
      questionData: QuestionData(
        question: 'Global investing provides:',
        options: ['Less diversification', 'More diversification opportunities', 'No benefits', 'Only losses'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day18/test/q2.png',
      imagePrompt: 'cartoon world\'s largest exchange',
      questionData: QuestionData(
        question: 'The world\'s largest stock exchange is:',
        options: ['London', 'Tokyo', 'NYSE', 'Shanghai'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day18/test/q3.png',
      imagePrompt: 'cartoon currency risk concept',
      missionData: MissionData(
        mission: 'Currency risk means:',
        options: ['Currencies never change', 'Exchange rate changes affect your returns', 'Only affects banks', 'Not important'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day18/test/q4.png',
      imagePrompt: 'cartoon emerging market characteristics',
      questionData: QuestionData(
        question: 'Emerging markets typically have:',
        options: ['Lower growth', 'Higher growth and higher risk', 'No risk', 'No volatility'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day18/test/q5.png',
      imagePrompt: 'cartoon international ETF simplicity',
      missionData: MissionData(
        mission: 'The easiest way to invest globally is:',
        options: ['Opening accounts in every country', 'International ETFs or global funds', 'Avoiding foreign stocks', 'Currency trading only'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 18 Complete', badgeIcon: '🌍')),
  ],
);
