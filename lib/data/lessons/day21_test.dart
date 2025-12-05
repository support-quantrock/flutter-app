import '../../models/lesson_models.dart';

final day21Test = LessonData(
  day: 21,
  title: "Day 21 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day21/test/q1.png',
      imagePrompt: 'cartoon long-term capital gains',
      questionData: QuestionData(
        question: 'Long-term capital gains require holding:',
        options: ['One day', 'One month', 'Over one year', 'Five years'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day21/test/q2.png',
      imagePrompt: 'cartoon Roth IRA benefit',
      questionData: QuestionData(
        question: 'Roth IRA growth is:',
        options: ['Taxed annually', 'Tax-free forever', 'Taxed at higher rates', 'Not possible'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day21/test/q3.png',
      imagePrompt: 'cartoon tax-loss harvesting',
      missionData: MissionData(
        mission: 'Tax-loss harvesting uses losses to:',
        options: ['Increase your tax bill', 'Reduce your tax bill', 'Avoid investing', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day21/test/q4.png',
      imagePrompt: 'cartoon bonds in tax-advantaged',
      questionData: QuestionData(
        question: 'Bonds are often best held in:',
        options: ['Taxable accounts', 'Tax-advantaged accounts', 'Under your mattress', 'Only cash accounts'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day21/test/q5.png',
      imagePrompt: 'cartoon frequent trading tax impact',
      missionData: MissionData(
        mission: 'Frequent trading often results in:',
        options: ['Lower taxes', 'Higher taxes from short-term gains', 'No tax impact', 'Tax refunds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 21 Complete', badgeIcon: '💰')),
  ],
);
