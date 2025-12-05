import '../../models/lesson_models.dart';

final day22Lesson5 = LessonData(
  day: 22,
  title: "Taking Action Now",
  emoji: '🎬',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Start Today',
      imagePath: 'assets/images/lessons/day22/lesson5/story.png',
      imagePrompt: 'cartoon person taking first step on retirement journey, action over planning',
      content: '''The best time to start was yesterday.

The second best time is now!

Small steps today lead to big results tomorrow.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Action Steps',
      imagePath: 'assets/images/lessons/day22/lesson5/content1.png',
      imagePrompt: 'cartoon retirement action checklist: enroll, contribute, invest, track',
      content: '''Steps to take now:''',
      bullets: [
        BulletPoint(icon: '1️⃣', title: 'Enroll', description: 'Sign up for employer 401k if available.'),
        BulletPoint(icon: '2️⃣', title: 'Contribute', description: 'At least enough to get full match.'),
        BulletPoint(icon: '3️⃣', title: 'Choose Funds', description: 'Low-cost diversified options.'),
        BulletPoint(icon: '4️⃣', title: 'Increase', description: 'Raise contributions over time.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Habits for Success',
      imagePath: 'assets/images/lessons/day22/lesson5/content2.png',
      imagePrompt: 'cartoon good retirement habits: automate, increase yearly, stay consistent',
      content: '''Build good habits:''',
      bullets: [
        BulletPoint(icon: '🤖', title: 'Automate', description: 'Set up automatic contributions.'),
        BulletPoint(icon: '📈', title: 'Increase Yearly', description: 'Raise contributions with raises.'),
        BulletPoint(icon: '🎯', title: 'Stay Consistent', description: 'Do not stop during market dips.'),
        BulletPoint(icon: '📊', title: 'Review Annually', description: 'Check progress once a year.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Start Check',
      imagePath: 'assets/images/lessons/day22/lesson5/game1.png',
      imagePrompt: 'cartoon best time to start saving',
      gameData: GameData(
        type: 'choice',
        instruction: 'The best time to start saving for retirement is:',
        options: [GameOption(label: 'When you are old', emoji: '👴'), GameOption(label: 'As soon as possible', emoji: '🌱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Habit Pop',
      imagePath: 'assets/images/lessons/day22/lesson5/game2.png',
      imagePrompt: 'cartoon automating contributions',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Automating contributions helps because:',
        options: [GameOption(label: 'It is harder to forget', emoji: '🤖'), GameOption(label: 'It is more expensive', emoji: '💸'), GameOption(label: 'It reduces returns', emoji: '📉')],
        correctIndex: 0,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day22/lesson5/question.png',
      imagePrompt: 'cartoon increasing contributions with raises',
      questionData: QuestionData(
        question: 'When you get a raise, a good habit is to:',
        options: ['Spend it all', 'Increase retirement contributions', 'Decrease savings', 'Ignore retirement'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Action Mission',
      imagePath: 'assets/images/lessons/day22/lesson5/mission.png',
      imagePrompt: 'cartoon first step to retirement planning',
      missionData: MissionData(
        mission: 'What is the most important thing about retirement planning?',
        options: ['Having a perfect plan', 'Actually starting and taking action', 'Waiting for the right moment', 'Doing nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Action Taker', badgeIcon: '🎬')),
  ],
);
