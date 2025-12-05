import '../../models/lesson_models.dart';

final day27Test = LessonData(
  day: 27,
  title: "Day 27 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day27/test/q1.png',
      imagePrompt: 'cartoon SMART goals',
      questionData: QuestionData(
        question: 'SMART goals are:',
        options: ['Vague and undefined', 'Specific, Measurable, Achievable, Relevant, Time-bound', 'Only for experts', 'Not important'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day27/test/q2.png',
      imagePrompt: 'cartoon risk tolerance factors',
      questionData: QuestionData(
        question: 'Risk tolerance is affected by:',
        options: ['Only your age', 'Time horizon, income stability, and emotional comfort', 'Nothing at all', 'Only market conditions'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day27/test/q3.png',
      imagePrompt: 'cartoon asset allocation',
      missionData: MissionData(
        mission: 'Asset allocation should be based on:',
        options: ['Random selection', 'Your goals, timeline, and risk tolerance', 'Only trends', 'What is popular'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day27/test/q4.png',
      imagePrompt: 'cartoon low-cost index funds',
      questionData: QuestionData(
        question: 'For most beginners, a good approach is:',
        options: ['Complex trading strategies', 'Low-cost index funds', 'Day trading', 'Only individual stocks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day27/test/q5.png',
      imagePrompt: 'cartoon investment policy statement',
      missionData: MissionData(
        mission: 'An investment policy statement helps you:',
        options: ['Make emotional decisions', 'Stay disciplined during volatility', 'Change strategy constantly', 'Ignore your goals'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 27 Complete', badgeIcon: '📜')),
  ],
);
