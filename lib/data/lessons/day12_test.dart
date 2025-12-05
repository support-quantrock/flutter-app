import '../../models/lesson_models.dart';

final day12Test = LessonData(
  day: 12,
  title: "Day 12 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day12/test/q1.png',
      imagePrompt: 'cartoon moving average smoothing price',
      questionData: QuestionData(
        question: 'What do moving averages do?',
        options: ['Add more noise', 'Smooth out price data to show trend', 'Predict earnings', 'Nothing useful'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day12/test/q2.png',
      imagePrompt: 'cartoon RSI overbought zone',
      questionData: QuestionData(
        question: 'RSI above 70 indicates:',
        options: ['Oversold', 'Overbought', 'Neutral', 'Broken indicator'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day12/test/q3.png',
      imagePrompt: 'cartoon MACD bullish crossover',
      missionData: MissionData(
        mission: 'A MACD bullish signal occurs when:',
        options: ['MACD line goes below signal', 'MACD line crosses above signal', 'Both lines disappear', 'Histogram turns purple'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day12/test/q4.png',
      imagePrompt: 'cartoon Bollinger Band squeeze',
      questionData: QuestionData(
        question: 'A Bollinger Band squeeze suggests:',
        options: ['Market will stay quiet', 'A big move may be coming', 'Time to stop trading', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day12/test/q5.png',
      imagePrompt: 'cartoon multiple indicators confirming',
      missionData: MissionData(
        mission: 'Why combine multiple indicators?',
        options: ['For fun', 'To confirm signals and reduce false signals', 'It is required', 'No benefit'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 12 Complete', badgeIcon: '📶')),
  ],
);
