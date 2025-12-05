import '../../models/lesson_models.dart';

final day24Lesson3 = LessonData(
  day: 24,
  title: "Private Equity & Venture Capital",
  emoji: '🚀',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Investing in Private Companies',
      imagePath: 'assets/images/lessons/day24/lesson3/story.png',
      imagePrompt: 'cartoon private equity: investor funding startup company, venture capital meeting',
      content: '''Private equity invests in companies not on public stock markets.

Venture capital funds early-stage startups.

High risk but potential for big returns!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Private Equity Basics',
      imagePath: 'assets/images/lessons/day24/lesson3/content1.png',
      imagePrompt: 'cartoon private equity: buying companies, improving them, selling for profit',
      content: '''How private equity works:''',
      bullets: [
        BulletPoint(icon: '🏢', title: 'Buy Companies', description: 'Acquire private businesses.'),
        BulletPoint(icon: '📈', title: 'Improve Operations', description: 'Make them more profitable.'),
        BulletPoint(icon: '💰', title: 'Exit Strategy', description: 'Sell for a profit later.'),
        BulletPoint(icon: '🔒', title: 'Long Term', description: 'Money locked up for years.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Venture Capital',
      imagePath: 'assets/images/lessons/day24/lesson3/content2.png',
      imagePrompt: 'cartoon venture capital: funding startups, tech companies, innovation',
      content: '''Venture capital focuses on startups:''',
      bullets: [
        BulletPoint(icon: '🌱', title: 'Early Stage', description: 'Fund new companies.'),
        BulletPoint(icon: '💡', title: 'Innovation', description: 'Often in tech or biotech.'),
        BulletPoint(icon: '⚠️', title: 'High Risk', description: 'Most startups fail.'),
        BulletPoint(icon: '🎯', title: 'Big Wins', description: 'Successful ones can return 100x.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Check',
      imagePath: 'assets/images/lessons/day24/lesson3/game1.png',
      imagePrompt: 'cartoon startup funding',
      gameData: GameData(
        type: 'choice',
        instruction: 'Venture capital typically invests in:',
        options: [GameOption(label: 'Established public companies', emoji: '🏢'), GameOption(label: 'Early-stage startups', emoji: '🚀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Pop',
      imagePath: 'assets/images/lessons/day24/lesson3/game2.png',
      imagePrompt: 'cartoon private equity risk',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Private equity investments are:',
        options: [GameOption(label: 'Very liquid', emoji: '💧'), GameOption(label: 'Locked up for years', emoji: '🔒'), GameOption(label: 'Traded daily', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day24/lesson3/question.png',
      imagePrompt: 'cartoon venture capital returns',
      questionData: QuestionData(
        question: 'Venture capital is high risk because:',
        options: ['All startups succeed', 'Most startups fail', 'It is guaranteed by government', 'There is no risk'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'PE Mission',
      imagePath: 'assets/images/lessons/day24/lesson3/mission.png',
      imagePrompt: 'cartoon accessing private equity',
      missionData: MissionData(
        mission: 'Traditional private equity is usually accessible to:',
        options: ['Everyone equally', 'Wealthy or institutional investors', 'Only banks', 'No one can invest'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'PE Pioneer', badgeIcon: '🚀')),
  ],
);
