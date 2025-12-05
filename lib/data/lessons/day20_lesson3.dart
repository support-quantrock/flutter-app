import '../../models/lesson_models.dart';

final day20Lesson3 = LessonData(
  day: 20,
  title: "Social Factors",
  emoji: '👥',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'People Matter',
      imagePath: 'assets/images/lessons/day20/lesson3/story.png',
      imagePrompt: 'cartoon company treating workers well, diverse team, community support',
      content: '''Social factors look at how companies treat people.

Workers, customers, communities, and society.

Companies that treat people well often perform better!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Social Issues',
      imagePath: 'assets/images/lessons/day20/lesson3/content1.png',
      imagePrompt: 'cartoon social factors: worker safety, diversity, fair wages, community involvement',
      content: '''Key social factors:''',
      bullets: [
        BulletPoint(icon: '👷', title: 'Worker Safety', description: 'Safe working conditions.'),
        BulletPoint(icon: '🌈', title: 'Diversity', description: 'Inclusive workforce and leadership.'),
        BulletPoint(icon: '💵', title: 'Fair Wages', description: 'Living wages and benefits.'),
        BulletPoint(icon: '🏘️', title: 'Community', description: 'Positive local impact.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Social Matters',
      imagePath: 'assets/images/lessons/day20/lesson3/content2.png',
      imagePrompt: 'cartoon benefits of good social practices: happy workers, loyal customers, strong brand',
      content: '''Business benefits of good social practices:''',
      bullets: [
        BulletPoint(icon: '😊', title: 'Happy Workers', description: 'Better productivity and retention.'),
        BulletPoint(icon: '❤️', title: 'Customer Loyalty', description: 'People support ethical brands.'),
        BulletPoint(icon: '🛡️', title: 'Less Risk', description: 'Avoid scandals and lawsuits.'),
        BulletPoint(icon: '🌟', title: 'Reputation', description: 'Strong brand value.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Social Check',
      imagePath: 'assets/images/lessons/day20/lesson3/game1.png',
      imagePrompt: 'cartoon social factor example',
      gameData: GameData(
        type: 'choice',
        instruction: 'A social factor is:',
        options: [GameOption(label: 'Carbon emissions', emoji: '🌡️'), GameOption(label: 'Worker safety', emoji: '👷')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Benefit Pop',
      imagePath: 'assets/images/lessons/day20/lesson3/game2.png',
      imagePrompt: 'cartoon happy workers benefit',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Companies with happy workers often have:',
        options: [GameOption(label: 'Lower productivity', emoji: '📉'), GameOption(label: 'Better productivity', emoji: '📈'), GameOption(label: 'No effect', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day20/lesson3/question.png',
      imagePrompt: 'cartoon diversity in workplace',
      questionData: QuestionData(
        question: 'Diversity in the workplace is:',
        options: ['An environmental factor', 'A social factor', 'A governance factor', 'Not an ESG factor'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Social Mission',
      imagePath: 'assets/images/lessons/day20/lesson3/mission.png',
      imagePrompt: 'cartoon ethical brand with loyal customers',
      missionData: MissionData(
        mission: 'Good social practices can lead to:',
        options: ['Only costs', 'Customer loyalty and reduced risk', 'No benefits', 'Lower sales'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Social Conscious', badgeIcon: '👥')),
  ],
);
