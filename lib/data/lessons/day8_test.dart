import '../../models/lesson_models.dart';

final day8Test = LessonData(
  day: 8,
  title: "Day 8 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day8/test/q1.png',
      imagePrompt: 'cartoon cryptocurrency definition',
      questionData: QuestionData(
        question: 'What is cryptocurrency?',
        options: ['Physical coins', 'Digital money on decentralized networks', 'Bank accounts', 'Credit cards'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day8/test/q2.png',
      imagePrompt: 'cartoon blockchain chain of blocks',
      questionData: QuestionData(
        question: 'How does blockchain store data?',
        options: ['Random files', 'In connected blocks', 'Paper documents', 'Single server'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day8/test/q3.png',
      imagePrompt: 'cartoon Bitcoin supply limit',
      missionData: MissionData(
        mission: 'How many Bitcoin can ever exist?',
        options: ['Unlimited', '21 million', '100 million', '1 billion'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day8/test/q4.png',
      imagePrompt: 'cartoon smart contract automation',
      questionData: QuestionData(
        question: 'What do smart contracts do?',
        options: ['Nothing', 'Execute automatically when conditions are met', 'Only store money', 'Print documents'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day8/test/q5.png',
      imagePrompt: 'cartoon crypto safety tips',
      missionData: MissionData(
        mission: 'What is the safest way to store cryptocurrency?',
        options: ['Share keys online', 'Hardware wallet offline', 'Leave on exchange', 'Email to yourself'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 8 Complete', badgeIcon: '₿')),
  ],
);
