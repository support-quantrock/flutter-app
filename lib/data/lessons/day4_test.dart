import '../../models/lesson_models.dart';

final day4Test = LessonData(
  day: 4,
  title: "Day 4 Final Test",
  emoji: '📝',
  screens: [
    // Question 1
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day4/test/q1.png',
      imagePrompt:
          'cartoon financial markets overview, globe with trading icons, quiz style',
      questionData: QuestionData(
        question: 'What are financial markets?',
        options: [
          'Grocery stores for food',
          'Places where financial assets are bought and sold',
          'Only for millionaires',
          'Video game markets',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 2
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day4/test/q2.png',
      imagePrompt:
          'cartoon stock certificate showing ownership, quiz style',
      questionData: QuestionData(
        question: 'When you buy a stock, you become:',
        options: [
          'An employee of the company',
          'A part-owner of the company',
          'The CEO',
          'A customer only',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 3
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day4/test/q3.png',
      imagePrompt:
          'cartoon bond as IOU document, lending visualization, quiz style',
      missionData: MissionData(
        mission: 'When you buy a bond, you are:',
        options: [
          'Buying ownership in a company',
          'Lending money to a government or company',
          'Gambling',
          'Opening a bank account',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 4
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day4/test/q4.png',
      imagePrompt:
          'cartoon call option key giving right to buy, quiz style',
      questionData: QuestionData(
        question: 'What does a CALL option give you?',
        options: [
          'The right to sell at a set price',
          'The right to buy at a set price',
          'A phone call from your broker',
          'Free stocks',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 5
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day4/test/q5.png',
      imagePrompt:
          'cartoon broker and regulator comparison, quiz style',
      missionData: MissionData(
        mission: 'What is the difference between a broker and a regulator?',
        options: [
          'They are the same thing',
          'Broker helps you trade; regulator enforces rules',
          'Regulators help you trade',
          'Brokers enforce rules',
        ],
        correctIndex: 1,
      ),
    ),

    // Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 15,
        badgeName: 'Day 4 Complete',
        badgeIcon: '📊',
      ),
    ),
  ],
);
