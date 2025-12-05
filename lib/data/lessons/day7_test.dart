import '../../models/lesson_models.dart';

final day7Test = LessonData(
  day: 7,
  title: "Day 7 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day7/test/q1.png',
      imagePrompt: 'cartoon derivative contract visualization',
      questionData: QuestionData(
        question: 'What is a derivative?',
        options: ['A type of stock', 'A contract whose value comes from an underlying asset', 'A bank account', 'A type of bond'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day7/test/q2.png',
      imagePrompt: 'cartoon call option arrow pointing up',
      questionData: QuestionData(
        question: 'What does a CALL option give you?',
        options: ['Right to sell', 'Right to buy', 'Obligation to sell', 'Free shares'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day7/test/q3.png',
      imagePrompt: 'cartoon futures contract obligation symbol',
      missionData: MissionData(
        mission: 'How are futures different from options?',
        options: ['They are identical', 'Futures are obligations, options are rights', 'Options are obligations', 'Neither has value'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day7/test/q4.png',
      imagePrompt: 'cartoon swap exchange between two parties',
      questionData: QuestionData(
        question: 'What do parties exchange in an interest rate swap?',
        options: ['Stocks', 'Interest payments', 'Real estate', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day7/test/q5.png',
      imagePrompt: 'cartoon wise derivative usage with education',
      missionData: MissionData(
        mission: 'What is essential before trading derivatives?',
        options: ['Nothing, just start', 'Understanding how they work', 'Using maximum leverage', 'Ignoring all risks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 7 Complete', badgeIcon: '📄')),
  ],
);
