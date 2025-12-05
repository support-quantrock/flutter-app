import '../../models/lesson_models.dart';

final day10Lesson5 = LessonData(
  day: 10,
  title: "Your Risk Tolerance",
  emoji: '🎚️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Know Yourself',
      imagePath: 'assets/images/lessons/day10/lesson5/story.png',
      imagePrompt: 'cartoon person looking in mirror seeing their risk tolerance level, self-awareness',
      content: '''Risk tolerance is how much risk YOU can handle.

It depends on your age, goals, and personality.

Knowing your tolerance helps you invest without losing sleep!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Factors That Affect Tolerance',
      imagePath: 'assets/images/lessons/day10/lesson5/content1.png',
      imagePrompt: 'cartoon risk tolerance factors: age timeline, money stack, personality types',
      content: '''What affects your risk tolerance:''',
      bullets: [
        BulletPoint(icon: '📅', title: 'Age', description: 'Younger can take more risk.'),
        BulletPoint(icon: '🎯', title: 'Goals', description: 'Short-term needs = lower risk.'),
        BulletPoint(icon: '💰', title: 'Financial Situation', description: 'More savings = can risk more.'),
        BulletPoint(icon: '🧠', title: 'Personality', description: 'Some handle stress better.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Risk Profiles',
      imagePath: 'assets/images/lessons/day10/lesson5/content2.png',
      imagePrompt: 'cartoon three investors: conservative turtle, moderate owl, aggressive cheetah',
      content: '''Common investor profiles:''',
      bullets: [
        BulletPoint(icon: '🐢', title: 'Conservative', description: 'Prioritize safety, accept lower returns.'),
        BulletPoint(icon: '🦉', title: 'Moderate', description: 'Balance between growth and safety.'),
        BulletPoint(icon: '🐆', title: 'Aggressive', description: 'Accept high risk for high potential.'),
        BulletPoint(icon: '⚖️', title: 'Your Mix', description: 'Find what works for you.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Tolerance Check',
      imagePath: 'assets/images/lessons/day10/lesson5/game1.png',
      imagePrompt: 'cartoon risk tolerance assessment',
      gameData: GameData(
        type: 'choice',
        instruction: 'Risk tolerance is about:',
        options: [GameOption(label: 'Same for everyone', emoji: '='), GameOption(label: 'Personal to each investor', emoji: '👤')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Factor Pop',
      imagePath: 'assets/images/lessons/day10/lesson5/game2.png',
      imagePrompt: 'cartoon factors affecting risk tolerance',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which affects risk tolerance?',
        options: [GameOption(label: 'Favorite color', emoji: '🎨'), GameOption(label: 'Age and goals', emoji: '🎯'), GameOption(label: 'Height', emoji: '📏')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day10/lesson5/question.png',
      imagePrompt: 'cartoon young vs older investor risk',
      questionData: QuestionData(
        question: 'Why can younger investors typically take more risk?',
        options: ['They are smarter', 'They have more time to recover from losses', 'They like gambling', 'They cannot'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Tolerance Mission',
      imagePath: 'assets/images/lessons/day10/lesson5/mission.png',
      imagePrompt: 'cartoon investor finding right balance',
      missionData: MissionData(
        mission: 'Why is knowing your risk tolerance important?',
        options: ['It is not important', 'To invest in a way that matches your comfort level', 'To take maximum risk', 'To avoid investing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Self-Aware Investor', badgeIcon: '🎚️')),
  ],
);
