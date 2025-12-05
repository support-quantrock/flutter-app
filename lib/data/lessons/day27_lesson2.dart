import '../../models/lesson_models.dart';

final day27Lesson2 = LessonData(
  day: 27,
  title: "Assessing Your Risk Tolerance",
  emoji: '⚖️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Know Yourself',
      imagePath: 'assets/images/lessons/day27/lesson2/story.png',
      imagePrompt: 'cartoon risk tolerance spectrum: conservative to aggressive investors',
      content: '''How much risk can you handle?

Your risk tolerance shapes your portfolio.

Be honest with yourself about volatility!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Factors to Consider',
      imagePath: 'assets/images/lessons/day27/lesson2/content1.png',
      imagePrompt: 'cartoon risk tolerance factors: age, income, timeline, personality',
      content: '''What affects your risk tolerance:''',
      bullets: [
        BulletPoint(icon: '📅', title: 'Time Horizon', description: 'Longer = more risk capacity.'),
        BulletPoint(icon: '💼', title: 'Income Stability', description: 'Secure income allows more risk.'),
        BulletPoint(icon: '🧠', title: 'Emotional Comfort', description: 'Can you sleep at night?'),
        BulletPoint(icon: '🎯', title: 'Goals', description: 'What you need determines risk.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Risk Profiles',
      imagePath: 'assets/images/lessons/day27/lesson2/content2.png',
      imagePrompt: 'cartoon three investor profiles: conservative, moderate, aggressive',
      content: '''Common risk profiles:''',
      bullets: [
        BulletPoint(icon: '🛡️', title: 'Conservative', description: 'Prioritizes safety, lower returns.'),
        BulletPoint(icon: '⚖️', title: 'Moderate', description: 'Balance of growth and safety.'),
        BulletPoint(icon: '🚀', title: 'Aggressive', description: 'Maximum growth, accepts volatility.'),
        BulletPoint(icon: '🔄', title: 'Changes', description: 'Risk tolerance can change over time.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Factor Check',
      imagePath: 'assets/images/lessons/day27/lesson2/game1.png',
      imagePrompt: 'cartoon longer time horizon more risk',
      gameData: GameData(
        type: 'choice',
        instruction: 'A longer time horizon typically means:',
        options: [GameOption(label: 'Less ability to take risk', emoji: '🛡️'), GameOption(label: 'More ability to take risk', emoji: '🚀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Profile Pop',
      imagePath: 'assets/images/lessons/day27/lesson2/game2.png',
      imagePrompt: 'cartoon conservative investor',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Conservative investors prioritize:',
        options: [GameOption(label: 'Maximum growth at any cost', emoji: '🚀'), GameOption(label: 'Safety over high returns', emoji: '🛡️'), GameOption(label: 'Only speculation', emoji: '🎲')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day27/lesson2/question.png',
      imagePrompt: 'cartoon emotional comfort with volatility',
      questionData: QuestionData(
        question: 'Your risk tolerance should consider:',
        options: ['Only potential returns', 'Your emotional comfort with volatility', 'Nothing at all', 'Only what friends do'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Risk Mission',
      imagePath: 'assets/images/lessons/day27/lesson2/mission.png',
      imagePrompt: 'cartoon honest self-assessment',
      missionData: MissionData(
        mission: 'When assessing risk tolerance:',
        options: ['Pretend you can handle anything', 'Be honest about your comfort level', 'Copy others exactly', 'Ignore all emotions'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Self-Aware', badgeIcon: '⚖️')),
  ],
);
