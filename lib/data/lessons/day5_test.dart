import '../../models/lesson_models.dart';

final day5Test = LessonData(
  day: 5,
  title: "Day 5 Final Test",
  emoji: '📝',
  screens: [
    // Question 1
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day5/test/q1.png',
      imagePrompt:
          'cartoon commodities overview, gold oil wheat, quiz style',
      questionData: QuestionData(
        question: 'What are commodities?',
        options: [
          'Digital currencies',
          'Physical goods like gold, oil, and wheat',
          'Only stocks and bonds',
          'Video game items',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 2
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day5/test/q2.png',
      imagePrompt:
          'cartoon gold as safe haven during crisis, quiz style',
      questionData: QuestionData(
        question: 'Why is gold called a "safe haven"?',
        options: [
          'It is stored in safe places',
          'Investors buy it during market crises for protection',
          'Gold is always cheap',
          'Banks give it away for free',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 3
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day5/test/q3.png',
      imagePrompt:
          'cartoon silver dual use in jewelry and electronics, quiz style',
      missionData: MissionData(
        mission: 'What makes silver different from gold?',
        options: [
          'Silver is more valuable',
          'Silver has both precious metal and industrial uses',
          'Silver is only for jewelry',
          'Silver is paper-based',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 4
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day5/test/q4.png',
      imagePrompt:
          'cartoon OPEC controlling oil supply, quiz style',
      questionData: QuestionData(
        question: 'What organization significantly affects oil prices?',
        options: [
          'FIFA',
          'OPEC',
          'NASA',
          'WHO',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 5
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day5/test/q5.png',
      imagePrompt:
          'cartoon commodity ETF vs physical gold for beginners, quiz style',
      missionData: MissionData(
        mission: 'What is the easiest way for beginners to invest in commodities?',
        options: [
          'Buy physical oil barrels',
          'Trade complex futures contracts',
          'Buy commodity ETFs',
          'Store gold at home',
        ],
        correctIndex: 2,
      ),
    ),

    // Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 15,
        badgeName: 'Day 5 Complete',
        badgeIcon: '🥇',
      ),
    ),
  ],
);
