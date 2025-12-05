import '../../models/lesson_models.dart';

final day20Test = LessonData(
  day: 20,
  title: "Day 20 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day20/test/q1.png',
      imagePrompt: 'cartoon ESG meaning',
      questionData: QuestionData(
        question: 'ESG stands for:',
        options: ['Earnings, Stocks, Growth', 'Environmental, Social, Governance', 'Easy, Simple, Good', 'European Stock Guide'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day20/test/q2.png',
      imagePrompt: 'cartoon environmental factor',
      questionData: QuestionData(
        question: 'Carbon emissions is what type of ESG factor?',
        options: ['Social', 'Governance', 'Environmental', 'Not an ESG factor'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day20/test/q3.png',
      imagePrompt: 'cartoon social factor',
      missionData: MissionData(
        mission: 'Worker safety is what type of ESG factor?',
        options: ['Environmental', 'Social', 'Governance', 'Not relevant'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day20/test/q4.png',
      imagePrompt: 'cartoon governance factor',
      questionData: QuestionData(
        question: 'Board independence is what type of ESG factor?',
        options: ['Environmental', 'Social', 'Governance', 'Not an ESG factor'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day20/test/q5.png',
      imagePrompt: 'cartoon greenwashing warning',
      missionData: MissionData(
        mission: 'Greenwashing refers to:',
        options: ['Very green practices', 'Exaggerated environmental claims', 'Cleaning with green products', 'A type of investment'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 20 Complete', badgeIcon: '🌱')),
  ],
);
