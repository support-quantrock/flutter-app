import '../../models/lesson_models.dart';

final day14Test = LessonData(
  day: 14,
  title: "Day 14 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day14/test/q1.png',
      imagePrompt: 'cartoon economy affecting investments',
      questionData: QuestionData(
        question: 'Why do economic indicators matter to investors?',
        options: ['They do not matter', 'Economy affects all investments', 'Only for economists', 'Just entertainment'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day14/test/q2.png',
      imagePrompt: 'cartoon GDP meaning',
      questionData: QuestionData(
        question: 'GDP measures:',
        options: ['Only exports', 'Total value produced in a country', 'Stock prices', 'Number of companies'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day14/test/q3.png',
      imagePrompt: 'cartoon inflation effect',
      missionData: MissionData(
        mission: 'Inflation means:',
        options: ['Prices are falling', 'Prices are rising', 'Prices stay same', 'Economy is growing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day14/test/q4.png',
      imagePrompt: 'cartoon interest rate effect on stocks',
      questionData: QuestionData(
        question: 'Rising interest rates often:',
        options: ['Boost stock prices', 'Pressure stock prices', 'Have no effect', 'Create inflation'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day14/test/q5.png',
      imagePrompt: 'cartoon strong employment',
      missionData: MissionData(
        mission: 'Strong employment data indicates:',
        options: ['Weak economy', 'Strong economy', 'No change', 'Recession coming'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 14 Complete', badgeIcon: '🌍')),
  ],
);
