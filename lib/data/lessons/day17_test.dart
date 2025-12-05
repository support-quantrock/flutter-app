import '../../models/lesson_models.dart';

final day17Test = LessonData(
  day: 17,
  title: "Day 17 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day17/test/q1.png',
      imagePrompt: 'cartoon behavioral finance concept',
      questionData: QuestionData(
        question: 'Behavioral finance studies:',
        options: ['Only numbers', 'How emotions affect investing', 'Weather patterns', 'Company logos'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day17/test/q2.png',
      imagePrompt: 'cartoon loss aversion effect',
      questionData: QuestionData(
        question: 'Loss aversion makes losses feel:',
        options: ['Same as gains', 'Worse than gains feel good', 'Better than gains', 'Unimportant'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day17/test/q3.png',
      imagePrompt: 'cartoon confirmation bias',
      missionData: MissionData(
        mission: 'Confirmation bias causes you to:',
        options: ['Seek all information equally', 'Only notice information you agree with', 'Ignore all news', 'Make perfect decisions'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day17/test/q4.png',
      imagePrompt: 'cartoon FOMO behavior',
      questionData: QuestionData(
        question: 'FOMO often leads to:',
        options: ['Buying at the bottom', 'Buying at or near the top', 'Perfect timing', 'No trades'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day17/test/q5.png',
      imagePrompt: 'cartoon investment discipline',
      missionData: MissionData(
        mission: 'Mental discipline in investing means:',
        options: ['Trading on impulse', 'Following a system consistently', 'Ignoring all rules', 'Checking prices constantly'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 17 Complete', badgeIcon: '🧠')),
  ],
);
