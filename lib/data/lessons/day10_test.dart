import '../../models/lesson_models.dart';

final day10Test = LessonData(
  day: 10,
  title: "Day 10 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day10/test/q1.png',
      imagePrompt: 'cartoon risk-reward relationship',
      questionData: QuestionData(
        question: 'What is the relationship between risk and reward?',
        options: ['No relationship', 'Higher potential returns usually mean higher risk', 'Lower risk means higher returns', 'Risk eliminates reward'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day10/test/q2.png',
      imagePrompt: 'cartoon diversification eggs in baskets',
      questionData: QuestionData(
        question: 'What does diversification do?',
        options: ['Increases risk', 'Spreads risk across investments', 'Guarantees profits', 'Nothing useful'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day10/test/q3.png',
      imagePrompt: 'cartoon position sizing concept',
      missionData: MissionData(
        mission: 'Why is position sizing important?',
        options: ['It is not important', 'Limits damage from any single bad investment', 'Increases losses', 'Makes investing complicated'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day10/test/q4.png',
      imagePrompt: 'cartoon stop loss protection',
      questionData: QuestionData(
        question: 'What does a stop loss do?',
        options: ['Increases your losses', 'Automatically limits losses at a set price', 'Guarantees profits', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day10/test/q5.png',
      imagePrompt: 'cartoon risk tolerance profiles',
      missionData: MissionData(
        mission: 'Risk tolerance depends on:',
        options: ['Nothing personal', 'Age, goals, and personality', 'Only luck', 'Weather'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 10 Complete', badgeIcon: '⚠️')),
  ],
);
