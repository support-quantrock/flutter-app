import '../../models/lesson_models.dart';

final day15Test = LessonData(
  day: 15,
  title: "Day 15 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day15/test/q1.png',
      imagePrompt: 'cartoon modern portfolio theory',
      questionData: QuestionData(
        question: 'Modern Portfolio Theory shows that diversification:',
        options: ['Increases risk', 'Reduces risk', 'Has no effect', 'Only works for bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day15/test/q2.png',
      imagePrompt: 'cartoon asset allocation importance',
      questionData: QuestionData(
        question: 'Asset allocation determines:',
        options: ['Very little of returns', 'Most of your investment returns', 'Only dividends', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day15/test/q3.png',
      imagePrompt: 'cartoon 60/40 portfolio',
      missionData: MissionData(
        mission: 'A 60/40 portfolio has:',
        options: ['60% bonds, 40% stocks', '60% stocks, 40% bonds', '60% cash', 'No bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day15/test/q4.png',
      imagePrompt: 'cartoon rebalancing purpose',
      questionData: QuestionData(
        question: 'Rebalancing helps you:',
        options: ['Increase risk', 'Maintain target allocation', 'Avoid all trading', 'Guarantee profits'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day15/test/q5.png',
      imagePrompt: 'cartoon index fund benefits',
      missionData: MissionData(
        mission: 'Index funds are popular because they are:',
        options: ['Expensive', 'Low-cost and diversified', 'Only for professionals', 'High risk'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 15 Complete', badgeIcon: '📐')),
  ],
);
