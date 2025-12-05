import '../../models/lesson_models.dart';

final day6Test = LessonData(
  day: 6,
  title: "Day 6 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day6/test/q1.png',
      imagePrompt: 'cartoon forex market size visualization',
      questionData: QuestionData(
        question: 'What is Forex?',
        options: ['A stock exchange', 'Foreign currency exchange market', 'A type of bond', 'A cryptocurrency'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day6/test/q2.png',
      imagePrompt: 'cartoon EUR/USD currency pair',
      questionData: QuestionData(
        question: 'In EUR/USD, which is the base currency?',
        options: ['USD', 'EUR', 'Both equally', 'Neither'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day6/test/q3.png',
      imagePrompt: 'cartoon interest rates affecting currency',
      missionData: MissionData(
        mission: 'What usually happens when a country raises interest rates?',
        options: ['Currency weakens', 'Currency strengthens', 'Nothing changes', 'Currency disappears'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day6/test/q4.png',
      imagePrompt: 'cartoon leverage magnification',
      questionData: QuestionData(
        question: 'What does leverage do in forex?',
        options: ['Only increases profits', 'Amplifies both gains AND losses', 'Eliminates risk', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day6/test/q5.png',
      imagePrompt: 'cartoon stop loss protection',
      missionData: MissionData(
        mission: 'How can forex traders protect themselves from big losses?',
        options: ['Use maximum leverage', 'Never use stop losses', 'Use stop losses and manage position size', 'Trade randomly'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 6 Complete', badgeIcon: '💱')),
  ],
);
