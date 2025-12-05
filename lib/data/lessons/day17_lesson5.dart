import '../../models/lesson_models.dart';

final day17Lesson5 = LessonData(
  day: 17,
  title: "Building Mental Discipline",
  emoji: '🧘',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Master Your Mind',
      imagePath: 'assets/images/lessons/day17/lesson5/story.png',
      imagePrompt: 'cartoon zen investor meditating while market chaos swirls around them',
      content: '''The best investors master their emotions.

They have systems that remove emotion from decisions.

Mental discipline separates winners from losers!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Building Discipline',
      imagePath: 'assets/images/lessons/day17/lesson5/content1.png',
      imagePrompt: 'cartoon discipline building blocks: rules, journaling, patience, learning',
      content: '''Ways to build mental discipline:''',
      bullets: [
        BulletPoint(icon: '📝', title: 'Written Rules', description: 'Create and follow your system.'),
        BulletPoint(icon: '📓', title: 'Investment Journal', description: 'Track decisions and emotions.'),
        BulletPoint(icon: '⏳', title: 'Patience', description: 'Wait for your opportunities.'),
        BulletPoint(icon: '📚', title: 'Keep Learning', description: 'Knowledge builds confidence.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Practical Tips',
      imagePath: 'assets/images/lessons/day17/lesson5/content2.png',
      imagePrompt: 'cartoon practical discipline tips: check less often, automate, sleep on decisions',
      content: '''Tips for staying disciplined:''',
      bullets: [
        BulletPoint(icon: '📱', title: 'Check Less', description: 'Do not watch portfolio constantly.'),
        BulletPoint(icon: '🤖', title: 'Automate', description: 'Set up automatic investing.'),
        BulletPoint(icon: '😴', title: 'Sleep On It', description: 'Never trade impulsively.'),
        BulletPoint(icon: '🧘', title: 'Stay Calm', description: 'Take breaks during volatility.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Discipline Check',
      imagePath: 'assets/images/lessons/day17/lesson5/game1.png',
      imagePrompt: 'cartoon disciplined vs undisciplined investor',
      gameData: GameData(
        type: 'choice',
        instruction: 'Mental discipline helps you:',
        options: [GameOption(label: 'Trade more emotionally', emoji: '😰'), GameOption(label: 'Make better decisions consistently', emoji: '🧘')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Tip Pop',
      imagePath: 'assets/images/lessons/day17/lesson5/game2.png',
      imagePrompt: 'cartoon sleeping on investment decisions',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Before making a big investment decision:',
        options: [GameOption(label: 'Act immediately', emoji: '🏃'), GameOption(label: 'Sleep on it', emoji: '😴'), GameOption(label: 'Ask strangers online', emoji: '🌐')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day17/lesson5/question.png',
      imagePrompt: 'cartoon investment journal benefits',
      questionData: QuestionData(
        question: 'An investment journal helps you:',
        options: ['Trade more often', 'Learn from past decisions', 'Guarantee profits', 'Avoid all losses'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Discipline Mission',
      imagePath: 'assets/images/lessons/day17/lesson5/mission.png',
      imagePrompt: 'cartoon calm investor with system',
      missionData: MissionData(
        mission: 'The best way to remove emotion from investing is:',
        options: ['Stop caring', 'Have a system with clear rules', 'Trade constantly', 'Ignore all news'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Zen Investor', badgeIcon: '🧘')),
  ],
);
