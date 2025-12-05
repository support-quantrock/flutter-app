import '../../models/lesson_models.dart';

final day9Test = LessonData(
  day: 9,
  title: "Day 9 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day9/test/q1.png',
      imagePrompt: 'cartoon Web3 ownership concept',
      questionData: QuestionData(
        question: 'What does Web3 add compared to Web2?',
        options: ['Nothing new', 'Ownership and control', 'Only speed', 'Less features'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day9/test/q2.png',
      imagePrompt: 'cartoon DeFi banking services',
      questionData: QuestionData(
        question: 'What is DeFi?',
        options: ['A type of bank', 'Decentralized Finance on blockchain', 'A cryptocurrency', 'A social network'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day9/test/q3.png',
      imagePrompt: 'cartoon NFT uniqueness',
      missionData: MissionData(
        mission: 'What makes each NFT special?',
        options: ['All are identical', 'Each one is unique', 'They have no value', 'They cannot be traded'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day9/test/q4.png',
      imagePrompt: 'cartoon DAO voting',
      questionData: QuestionData(
        question: 'How are DAO decisions made?',
        options: ['One CEO decides', 'Token holder votes', 'Random selection', 'No decisions needed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day9/test/q5.png',
      imagePrompt: 'cartoon Web3 safety',
      missionData: MissionData(
        mission: 'What is a "rug pull" in Web3?',
        options: ['A dance move', 'A project that steals money and disappears', 'A type of NFT', 'A trading strategy'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 9 Complete', badgeIcon: '🌐')),
  ],
);
