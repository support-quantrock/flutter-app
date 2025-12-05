import '../../models/lesson_models.dart';

final day16Test = LessonData(
  day: 16,
  title: "Day 16 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day16/test/q1.png',
      imagePrompt: 'cartoon value investing concept',
      questionData: QuestionData(
        question: 'Value investing looks for stocks that are:',
        options: ['Expensive and popular', 'Undervalued', 'Always growing fast', 'New startups only'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day16/test/q2.png',
      imagePrompt: 'cartoon growth stock characteristics',
      questionData: QuestionData(
        question: 'Growth stocks typically have:',
        options: ['Low P/E ratios', 'High growth rates', 'High dividends', 'No risk'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day16/test/q3.png',
      imagePrompt: 'cartoon dividend yield calculation',
      missionData: MissionData(
        mission: 'Dividend yield is calculated as:',
        options: ['Price ÷ dividend', 'Annual dividend ÷ stock price', 'Earnings ÷ shares', 'Random number'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day16/test/q4.png',
      imagePrompt: 'cartoon index fund benefit',
      questionData: QuestionData(
        question: 'Index funds are popular because they:',
        options: ['Have high fees', 'Beat most active managers over time', 'Require constant trading', 'Only hold one stock'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day16/test/q5.png',
      imagePrompt: 'cartoon DCA benefit',
      missionData: MissionData(
        mission: 'Dollar cost averaging helps by:',
        options: ['Requiring market timing', 'Removing emotional decisions', 'Guaranteeing profits', 'Only buying at peaks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 16 Complete', badgeIcon: '💎')),
  ],
);
