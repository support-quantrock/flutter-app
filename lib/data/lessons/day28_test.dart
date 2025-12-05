import '../../models/lesson_models.dart';

final day28Test = LessonData(
  day: 28,
  title: "Day 28 Final Test - Course Completion!",
  emoji: '🏆',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day28/test/q1.png',
      imagePrompt: 'cartoon core investing principles',
      questionData: QuestionData(
        question: 'Core investing principles include:',
        options: ['Trade constantly', 'Diversify, think long-term, keep costs low', 'Follow every trend', 'Ignore all advice'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day28/test/q2.png',
      imagePrompt: 'cartoon emergency fund',
      questionData: QuestionData(
        question: 'Before investing, you should have:',
        options: ['No savings', 'An emergency fund and low debt', 'Maximum credit card debt', 'No financial plan'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day28/test/q3.png',
      imagePrompt: 'cartoon panic selling mistake',
      missionData: MissionData(
        mission: 'Panic selling during market drops is:',
        options: ['Smart strategy', 'A common mistake', 'Required by law', 'The only option'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day28/test/q4.png',
      imagePrompt: 'cartoon good investment habits',
      questionData: QuestionData(
        question: 'Good investment habits include:',
        options: ['Checking prices every minute', 'Consistent saving and periodic reviews', 'Trading on emotions', 'Never reviewing your portfolio'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day28/test/q5.png',
      imagePrompt: 'cartoon starting to invest early',
      missionData: MissionData(
        mission: 'The best time to start investing is:',
        options: ['When you are already rich', 'As early as possible', 'Never', 'Only in retirement'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 50, badgeName: 'Course Complete!', badgeIcon: '🏆')),
  ],
);
