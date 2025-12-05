import '../../models/lesson_models.dart';

final day27Lesson5 = LessonData(
  day: 27,
  title: "Writing Your Investment Policy",
  emoji: '📜',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Personal Rulebook',
      imagePath: 'assets/images/lessons/day27/lesson5/story.png',
      imagePrompt: 'cartoon investment policy statement document with goals and rules',
      content: '''An investment policy statement is your rulebook.

It documents your strategy and rules.

Write it down to stay disciplined!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What to Include',
      imagePath: 'assets/images/lessons/day27/lesson5/content1.png',
      imagePrompt: 'cartoon investment policy components: goals, allocation, rules, timeline',
      content: '''Key policy elements:''',
      bullets: [
        BulletPoint(icon: '🎯', title: 'Goals', description: 'What you are investing for.'),
        BulletPoint(icon: '⚖️', title: 'Risk Tolerance', description: 'How much volatility you accept.'),
        BulletPoint(icon: '🥧', title: 'Target Allocation', description: 'Your asset mix.'),
        BulletPoint(icon: '📅', title: 'Rebalancing Rules', description: 'When and how to adjust.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why It Matters',
      imagePath: 'assets/images/lessons/day27/lesson5/content2.png',
      imagePrompt: 'cartoon benefits of written policy: discipline, clarity, prevents emotional decisions',
      content: '''Benefits of a written policy:''',
      bullets: [
        BulletPoint(icon: '🧠', title: 'Clarity', description: 'Know your strategy clearly.'),
        BulletPoint(icon: '🧘', title: 'Discipline', description: 'Stick to plan during volatility.'),
        BulletPoint(icon: '🚫', title: 'Avoid Emotions', description: 'Prevent panic decisions.'),
        BulletPoint(icon: '📊', title: 'Benchmark', description: 'Measure progress against goals.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Policy Check',
      imagePath: 'assets/images/lessons/day27/lesson5/game1.png',
      imagePrompt: 'cartoon written investment policy',
      gameData: GameData(
        type: 'choice',
        instruction: 'A written investment policy helps you:',
        options: [GameOption(label: 'Change strategy daily', emoji: '🔄'), GameOption(label: 'Stay disciplined during volatility', emoji: '🧘')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Element Pop',
      imagePath: 'assets/images/lessons/day27/lesson5/game2.png',
      imagePrompt: 'cartoon rebalancing rules',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Rebalancing rules define:',
        options: [GameOption(label: 'When to panic sell', emoji: '😱'), GameOption(label: 'When and how to adjust your allocation', emoji: '⚖️'), GameOption(label: 'When to ignore your portfolio', emoji: '🙈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day27/lesson5/question.png',
      imagePrompt: 'cartoon policy preventing emotional decisions',
      questionData: QuestionData(
        question: 'An investment policy helps prevent:',
        options: ['All losses', 'Emotional decisions during market swings', 'Making any investments', 'Learning new things'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Policy Mission',
      imagePath: 'assets/images/lessons/day27/lesson5/mission.png',
      imagePrompt: 'cartoon creating investment policy',
      missionData: MissionData(
        mission: 'Your investment policy should be:',
        options: ['Kept secret in your head', 'Written down and reviewed regularly', 'Changed every day', 'Copied exactly from others'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Policy Writer', badgeIcon: '📜')),
  ],
);
