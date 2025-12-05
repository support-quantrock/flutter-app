import '../../models/lesson_models.dart';

final day2Test = LessonData(
  day: 2,
  title: "Day 2 Final Test",
  emoji: '📝',
  screens: [
    // Question 1
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day2/test/q1.png',
      imagePrompt:
          'cartoon consumer vs investor mindset comparison, quiz show style, educational',
      questionData: QuestionData(
        question: 'What is the main difference between consumer and investor mindset?',
        options: [
          'Consumers save more money',
          'Investors focus on long-term growth, consumers on instant spending',
          'There is no difference',
          'Investors spend more',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 2
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day2/test/q2.png',
      imagePrompt:
          'cartoon price tag vs value diamond comparison, quiz style',
      questionData: QuestionData(
        question: 'What is the difference between price and value?',
        options: [
          'They are the same thing',
          'Price is what you pay, value is what you get',
          'Value is always higher than price',
          'Price is more important',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 3
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day2/test/q3.png',
      imagePrompt:
          'cartoon timeline showing short-term chaos vs long-term growth, quiz style',
      missionData: MissionData(
        mission: 'Why should investors think long-term?',
        options: [
          'To avoid ever checking investments',
          'Because compounding needs time to work',
          'Short-term is too easy',
          'Long-term has no risks',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 4
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day2/test/q4.png',
      imagePrompt:
          'cartoon fear and greed monsters affecting investor decisions, quiz style',
      questionData: QuestionData(
        question: 'Which emotion causes investors to buy at the TOP?',
        options: [
          'Fear',
          'Patience',
          'Greed',
          'Discipline',
        ],
        correctIndex: 2,
      ),
    ),

    // Question 5
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day2/test/q5.png',
      imagePrompt:
          'cartoon compound growth visualization, snowball effect, quiz style',
      missionData: MissionData(
        mission: 'What is compounding?',
        options: [
          'Money losing value over time',
          'Money earning money, which earns more money',
          'Spending more than you earn',
          'Keeping cash under the mattress',
        ],
        correctIndex: 1,
      ),
    ),

    // Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 15,
        badgeName: 'Day 2 Complete',
        badgeIcon: '🧠',
      ),
    ),
  ],
);
