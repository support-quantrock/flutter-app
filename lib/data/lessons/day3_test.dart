import '../../models/lesson_models.dart';

final day3Test = LessonData(
  day: 3,
  title: "Day 3 Final Test",
  emoji: '📝',
  screens: [
    // Question 1
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day3/test/q1.png',
      imagePrompt:
          'cartoon money flow diagram, income and expenses, quiz style',
      questionData: QuestionData(
        question: 'What is the formula for building savings?',
        options: [
          'Income + Expenses',
          'Income - Expenses = Savings',
          'Spend everything you earn',
          'Borrow more than you earn',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 2
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day3/test/q2.png',
      imagePrompt:
          'cartoon pay yourself first golden rule banner, quiz style',
      questionData: QuestionData(
        question: 'What does "Pay Yourself First" mean?',
        options: [
          'Buy things for yourself before bills',
          'Save/invest before spending on anything else',
          'Pay your debts last',
          'Never pay anyone',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 3
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day3/test/q3.png',
      imagePrompt:
          'cartoon emergency fund shield protecting from financial dangers, quiz style',
      missionData: MissionData(
        mission: 'How much should an emergency fund cover?',
        options: [
          '1 week of expenses',
          '3-6 months of expenses',
          '10 years of expenses',
          'No need for emergency fund',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 4
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day3/test/q4.png',
      imagePrompt:
          'cartoon saving vs investing comparison, bank vs growth chart, quiz style',
      questionData: QuestionData(
        question: 'What should you have BEFORE starting to invest?',
        options: [
          'Lots of credit card debt',
          'An emergency fund and no high-interest debt',
          'A lottery ticket',
          'Nothing, just start immediately',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 5
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day3/test/q5.png',
      imagePrompt:
          'cartoon wealth building formula visualization, time and consistency, quiz style',
      missionData: MissionData(
        mission: 'What is the key to building wealth over time?',
        options: [
          'Get rich quick schemes',
          'Winning the lottery',
          'Time and consistency',
          'Taking huge risks',
        ],
        correctIndex: 2,
      ),
    ),

    // Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 15,
        badgeName: 'Day 3 Complete',
        badgeIcon: '💰',
      ),
    ),
  ],
);
