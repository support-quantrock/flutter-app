import '../../models/lesson_models.dart';

final day19Lesson5 = LessonData(
  day: 19,
  title: "Your Investing Style",
  emoji: '🪞',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Finding Your Fit',
      imagePath: 'assets/images/lessons/day19/lesson5/story.png',
      imagePrompt: 'cartoon investor looking in mirror seeing their investing style reflected back',
      content: '''There is no one-size-fits-all answer.

Your choice depends on your time, interest, and beliefs.

What matters is that you invest consistently!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Questions to Ask',
      imagePath: 'assets/images/lessons/day19/lesson5/content1.png',
      imagePrompt: 'cartoon investor asking themselves key questions about their investing preferences',
      content: '''Consider these questions:''',
      bullets: [
        BulletPoint(icon: '⏰', title: 'Time', description: 'Do you want to research investments?'),
        BulletPoint(icon: '🧠', title: 'Interest', description: 'Do you enjoy following markets?'),
        BulletPoint(icon: '💰', title: 'Costs', description: 'How much are you paying in fees?'),
        BulletPoint(icon: '📊', title: 'Results', description: 'Are you beating simple indexes?'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Practical Guidance',
      imagePath: 'assets/images/lessons/day19/lesson5/content2.png',
      imagePrompt: 'cartoon practical advice: start passive, stay consistent, review periodically',
      content: '''Practical advice:''',
      bullets: [
        BulletPoint(icon: '🌱', title: 'Start Simple', description: 'Passive is great for beginners.'),
        BulletPoint(icon: '📚', title: 'Learn First', description: 'Understand before going active.'),
        BulletPoint(icon: '🎯', title: 'Be Consistent', description: 'Stick with your approach.'),
        BulletPoint(icon: '🔍', title: 'Review', description: 'Evaluate results periodically.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Fit Check',
      imagePath: 'assets/images/lessons/day19/lesson5/game1.png',
      imagePrompt: 'cartoon beginner investor choice',
      gameData: GameData(
        type: 'choice',
        instruction: 'For beginners, it is often best to:',
        options: [GameOption(label: 'Start with complex strategies', emoji: '🔧'), GameOption(label: 'Start simple with passive investing', emoji: '🌱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Key Pop',
      imagePath: 'assets/images/lessons/day19/lesson5/game2.png',
      imagePrompt: 'cartoon consistency importance',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The most important thing is:',
        options: [GameOption(label: 'Switching strategies often', emoji: '🔄'), GameOption(label: 'Investing consistently', emoji: '🎯'), GameOption(label: 'Following tips', emoji: '💬')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day19/lesson5/question.png',
      imagePrompt: 'cartoon periodic review of results',
      questionData: QuestionData(
        question: 'You should review your investment approach:',
        options: ['Never', 'Daily', 'Periodically to evaluate results', 'Every hour'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Style Mission',
      imagePath: 'assets/images/lessons/day19/lesson5/mission.png',
      imagePrompt: 'cartoon finding right investing style',
      missionData: MissionData(
        mission: 'Choosing between active and passive depends on:',
        options: ['Nothing - always pick passive', 'Your time, interest, and situation', 'Always pick active', 'A coin flip'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Self-Aware', badgeIcon: '🪞')),
  ],
);
