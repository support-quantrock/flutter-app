import '../../models/lesson_models.dart';

final day23Test = LessonData(
  day: 23,
  title: "Day 23 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day23/test/q1.png',
      imagePrompt: 'cartoon real estate income',
      questionData: QuestionData(
        question: 'Real estate provides income through:',
        options: ['Dividends only', 'Rent payments', 'Interest only', 'No income possible'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day23/test/q2.png',
      imagePrompt: 'cartoon REIT trading',
      questionData: QuestionData(
        question: 'REITs can be traded on:',
        options: ['Only private markets', 'The stock market', 'Only in person', 'They cannot be traded'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day23/test/q3.png',
      imagePrompt: 'cartoon REIT dividend requirement',
      missionData: MissionData(
        mission: 'REITs must pay out how much of their income?',
        options: ['10%', '50%', '90%', 'Nothing'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day23/test/q4.png',
      imagePrompt: 'cartoon real estate diversification',
      questionData: QuestionData(
        question: 'Real estate helps diversification because it:',
        options: ['Always matches stocks', 'Often moves differently than stocks', 'Has no value', 'Is too risky'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day23/test/q5.png',
      imagePrompt: 'cartoon real estate price risk',
      missionData: MissionData(
        mission: 'Real estate prices:',
        options: ['Only go up', 'Can fall significantly', 'Never change', 'Are guaranteed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 23 Complete', badgeIcon: '🏠')),
  ],
);
