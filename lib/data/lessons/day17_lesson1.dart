import '../../models/lesson_models.dart';

final day17Lesson1 = LessonData(
  day: 17,
  title: "Your Brain vs Markets",
  emoji: '🧠',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Psychology Challenge',
      imagePath: 'assets/images/lessons/day17/lesson1/story.png',
      imagePrompt: 'cartoon brain wrestling with stock chart, emotional vs rational thinking battle',
      content: '''Your brain is not built for investing.

Evolution wired us for survival, not stock markets.

Understanding your mental biases helps you invest better!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Behavioral Finance',
      imagePath: 'assets/images/lessons/day17/lesson1/content1.png',
      imagePrompt: 'cartoon behavioral finance study: emotions affecting financial decisions',
      content: '''What is behavioral finance:''',
      bullets: [
        BulletPoint(icon: '🧠', title: 'Psychology + Finance', description: 'Studies how emotions affect investing.'),
        BulletPoint(icon: '⚠️', title: 'Biases', description: 'Mental shortcuts that cause mistakes.'),
        BulletPoint(icon: '😰', title: 'Emotions', description: 'Fear and greed drive bad decisions.'),
        BulletPoint(icon: '🎯', title: 'Awareness', description: 'Knowing biases helps avoid them.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Common Mental Traps',
      imagePath: 'assets/images/lessons/day17/lesson1/content2.png',
      imagePrompt: 'cartoon various cognitive biases as traps catching investors',
      content: '''Mental traps investors face:''',
      bullets: [
        BulletPoint(icon: '😨', title: 'Fear', description: 'Panic selling at the bottom.'),
        BulletPoint(icon: '🤑', title: 'Greed', description: 'Chasing hot stocks at peaks.'),
        BulletPoint(icon: '🐑', title: 'Herd Mentality', description: 'Following the crowd blindly.'),
        BulletPoint(icon: '😤', title: 'Overconfidence', description: 'Thinking you know more than you do.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Brain Check',
      imagePath: 'assets/images/lessons/day17/lesson1/game1.png',
      imagePrompt: 'cartoon brain and investing challenge',
      gameData: GameData(
        type: 'choice',
        instruction: 'Behavioral finance studies:',
        options: [GameOption(label: 'Only math', emoji: '🔢'), GameOption(label: 'How emotions affect investing', emoji: '🧠')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Trap Pop',
      imagePath: 'assets/images/lessons/day17/lesson1/game2.png',
      imagePrompt: 'cartoon panic selling trap',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Panic selling at market bottoms is caused by:',
        options: [GameOption(label: 'Logic', emoji: '🧮'), GameOption(label: 'Fear', emoji: '😨'), GameOption(label: 'Research', emoji: '📚')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day17/lesson1/question.png',
      imagePrompt: 'cartoon herd mentality in investing',
      questionData: QuestionData(
        question: 'Herd mentality means:',
        options: ['Independent thinking', 'Following the crowd blindly', 'Avoiding all stocks', 'Only buying bonds'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Psychology Mission',
      imagePath: 'assets/images/lessons/day17/lesson1/mission.png',
      imagePrompt: 'cartoon investor becoming aware of biases',
      missionData: MissionData(
        mission: 'Why study behavioral finance?',
        options: ['It is not useful', 'To understand and avoid mental traps', 'To trade more often', 'To feel smarter'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Mind Aware', badgeIcon: '🧠')),
  ],
);
