import '../../models/lesson_models.dart';

final day25Test = LessonData(
  day: 25,
  title: "Day 25 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day25/test/q1.png',
      imagePrompt: 'cartoon market cycle phases',
      questionData: QuestionData(
        question: 'The four phases of a market cycle are:',
        options: ['Up, down, flat, crash', 'Expansion, peak, contraction, trough', 'Bull, bear, flat, recovery', 'Growth only'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day25/test/q2.png',
      imagePrompt: 'cartoon bear market definition',
      questionData: QuestionData(
        question: 'A bear market is typically defined as:',
        options: ['Any small decline', '5% drop', '20% or more decline from highs', '1% daily move'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day25/test/q3.png',
      imagePrompt: 'cartoon time in market',
      missionData: MissionData(
        mission: 'Research shows that for most investors:',
        options: ['Market timing works best', 'Time in market beats timing', 'Daily trading is optimal', 'Never invest'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day25/test/q4.png',
      imagePrompt: 'cartoon dollar-cost averaging',
      questionData: QuestionData(
        question: 'Dollar-cost averaging means:',
        options: ['Investing all at once', 'Fixed amounts at regular intervals', 'Only buying when prices drop', 'Timing the market'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day25/test/q5.png',
      imagePrompt: 'cartoon staying disciplined during volatility',
      missionData: MissionData(
        mission: 'During market downturns, you should:',
        options: ['Panic sell immediately', 'Stick to your long-term plan', 'Stop investing forever', 'Check prices every minute'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 25 Complete', badgeIcon: '🔄')),
  ],
);
