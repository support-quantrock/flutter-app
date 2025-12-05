import '../../models/lesson_models.dart';

final day22Test = LessonData(
  day: 22,
  title: "Day 22 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day22/test/q1.png',
      imagePrompt: 'cartoon early start advantage',
      questionData: QuestionData(
        question: 'Starting retirement savings early is powerful because of:',
        options: ['Luck', 'Compound growth over time', 'Nothing special', 'Higher fees'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day22/test/q2.png',
      imagePrompt: 'cartoon 25x rule',
      questionData: QuestionData(
        question: 'The 25x rule suggests saving:',
        options: ['25 thousand', '25 times annual expenses', '25 percent of income', '25 years of work'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day22/test/q3.png',
      imagePrompt: 'cartoon employer match',
      missionData: MissionData(
        mission: 'An employer 401(k) match is:',
        options: ['A loan to repay', 'Free money you should get', 'A penalty', 'Not real'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day22/test/q4.png',
      imagePrompt: 'cartoon age-based portfolio',
      questionData: QuestionData(
        question: 'As you approach retirement, portfolios typically become:',
        options: ['More aggressive', 'More conservative', 'All stocks', 'All cash'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day22/test/q5.png',
      imagePrompt: 'cartoon taking action now',
      missionData: MissionData(
        mission: 'The most important retirement planning step is:',
        options: ['Having a perfect plan', 'Actually starting', 'Waiting for more money', 'Doing nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 22 Complete', badgeIcon: '🏖️')),
  ],
);
