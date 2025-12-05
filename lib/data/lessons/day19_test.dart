import '../../models/lesson_models.dart';

final day19Test = LessonData(
  day: 19,
  title: "Day 19 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day19/test/q1.png',
      imagePrompt: 'cartoon active vs passive goal',
      questionData: QuestionData(
        question: 'Active investing tries to:',
        options: ['Match the market', 'Beat the market', 'Avoid stocks', 'Only use bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day19/test/q2.png',
      imagePrompt: 'cartoon most active funds underperform',
      questionData: QuestionData(
        question: 'Over 15 years, most active funds:',
        options: ['Beat their benchmark', 'Underperform their benchmark', 'Match exactly', 'All close down'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day19/test/q3.png',
      imagePrompt: 'cartoon active advantage in small stocks',
      missionData: MissionData(
        mission: 'Active management may work better in:',
        options: ['Large efficient markets', 'Less efficient markets like small caps', 'Only bonds', 'Never works'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day19/test/q4.png',
      imagePrompt: 'cartoon core-satellite strategy',
      questionData: QuestionData(
        question: 'In core-satellite, the core is typically:',
        options: ['Active funds', 'Passive index funds', 'Cash only', 'Crypto'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day19/test/q5.png',
      imagePrompt: 'cartoon beginner advice',
      missionData: MissionData(
        mission: 'For beginners, it is often best to:',
        options: ['Jump into active trading', 'Start simple with passive investing', 'Avoid all investing', 'Only buy individual stocks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 19 Complete', badgeIcon: '⚔️')),
  ],
);
