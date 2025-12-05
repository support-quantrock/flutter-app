import '../../models/lesson_models.dart';

final day24Test = LessonData(
  day: 24,
  title: "Day 24 Final Test",
  emoji: '📝',
  screens: [
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day24/test/q1.png',
      imagePrompt: 'cartoon alternative investment characteristics',
      questionData: QuestionData(
        question: 'Alternative investments are typically:',
        options: ['More liquid than stocks', 'Less liquid than stocks', 'Exactly like bonds', 'Risk-free'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day24/test/q2.png',
      imagePrompt: 'cartoon gold commodity',
      questionData: QuestionData(
        question: 'Gold is classified as:',
        options: ['A stock', 'A bond', 'A commodity', 'A mutual fund'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day24/test/q3.png',
      imagePrompt: 'cartoon venture capital startup',
      missionData: MissionData(
        mission: 'Venture capital focuses on:',
        options: ['Large established companies', 'Government bonds', 'Early-stage startups', 'Real estate only'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day24/test/q4.png',
      imagePrompt: 'cartoon collectible authentication',
      questionData: QuestionData(
        question: 'When investing in collectibles, you should:',
        options: ['Skip authentication', 'Verify authenticity', 'Ignore storage needs', 'Avoid insurance'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day24/test/q5.png',
      imagePrompt: 'cartoon portfolio allocation to alternatives',
      missionData: MissionData(
        mission: 'Alternatives should typically be:',
        options: ['100% of portfolio', 'A small portion of most portfolios', 'Avoided entirely', 'The only investment'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Day 24 Complete', badgeIcon: '🎨')),
  ],
);
