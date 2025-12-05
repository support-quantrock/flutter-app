import '../../models/lesson_models.dart';

final day11Test = LessonData(
  day: 11,
  title: "Day 11 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day11/test/q1.png',
      imagePrompt: 'cartoon technical analysis concept',
      questionData: QuestionData(
        question: 'What does technical analysis study?',
        options: ['Company earnings', 'Price charts and patterns', 'CEO behavior', 'Weather'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day11/test/q2.png',
      imagePrompt: 'cartoon green candlestick',
      questionData: QuestionData(
        question: 'A green candlestick indicates:',
        options: ['Price went down', 'Price went up', 'No change', 'Market closed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day11/test/q3.png',
      imagePrompt: 'cartoon support level',
      missionData: MissionData(
        mission: 'Support is a level where price tends to:',
        options: ['Fall through easily', 'Bounce up', 'Stop moving forever', 'Disappear'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day11/test/q4.png',
      imagePrompt: 'cartoon uptrend pattern',
      questionData: QuestionData(
        question: 'An uptrend is characterized by:',
        options: ['Lower lows', 'Higher highs and higher lows', 'Flat movement', 'Random swings'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day11/test/q5.png',
      imagePrompt: 'cartoon volume confirmation',
      missionData: MissionData(
        mission: 'High volume during a price breakout suggests:',
        options: ['Fake move', 'Strong conviction and likely continuation', 'Market is closed', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 11 Complete', badgeIcon: '📊')),
  ],
);
