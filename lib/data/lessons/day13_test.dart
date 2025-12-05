import '../../models/lesson_models.dart';

final day13Test = LessonData(
  day: 13,
  title: "Day 13 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day13/test/q1.png',
      imagePrompt: 'cartoon fundamental analysis goal',
      questionData: QuestionData(
        question: 'Fundamental analysis aims to find:',
        options: ['Chart patterns', 'A company\'s true value', 'Daily price moves', 'Trading volume'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day13/test/q2.png',
      imagePrompt: 'cartoon P/E ratio formula',
      questionData: QuestionData(
        question: 'P/E ratio is calculated as:',
        options: ['Earnings ÷ Price', 'Price ÷ Earnings', 'Price × Earnings', 'Price + Earnings'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day13/test/q3.png',
      imagePrompt: 'cartoon EPS meaning',
      missionData: MissionData(
        mission: 'EPS stands for:',
        options: ['Earnings Per Sale', 'Earnings Per Share', 'Expense Per Share', 'Equity Per Stock'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day13/test/q4.png',
      imagePrompt: 'cartoon balance sheet purpose',
      questionData: QuestionData(
        question: 'The balance sheet shows:',
        options: ['Revenue and expenses', 'Assets and liabilities', 'Cash flow', 'Stock price'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day13/test/q5.png',
      imagePrompt: 'cartoon dividend yield',
      missionData: MissionData(
        mission: 'Dividend yield shows:',
        options: ['Stock price growth', 'Annual dividends as percentage of price', 'Company profits', 'Number of employees'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 13 Complete', badgeIcon: '📄')),
  ],
);
