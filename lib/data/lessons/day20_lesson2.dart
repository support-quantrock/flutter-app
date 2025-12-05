import '../../models/lesson_models.dart';

final day20Lesson2 = LessonData(
  day: 20,
  title: "Environmental Factors",
  emoji: '🌍',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Planet-Friendly Investing',
      imagePath: 'assets/images/lessons/day20/lesson2/story.png',
      imagePrompt: 'cartoon green investments: solar panels, wind turbines, electric cars, clean energy',
      content: '''Environmental factors look at how companies affect the planet.

Climate change, pollution, and resource use matter.

Green companies may be better positioned for the future!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Environmental Issues',
      imagePath: 'assets/images/lessons/day20/lesson2/content1.png',
      imagePrompt: 'cartoon environmental concerns: carbon emissions, water use, waste, deforestation',
      content: '''Key environmental factors:''',
      bullets: [
        BulletPoint(icon: '🌡️', title: 'Climate', description: 'Carbon emissions and climate impact.'),
        BulletPoint(icon: '💧', title: 'Water', description: 'Water usage and pollution.'),
        BulletPoint(icon: '🗑️', title: 'Waste', description: 'Recycling and waste management.'),
        BulletPoint(icon: '🌳', title: 'Resources', description: 'Sustainable use of materials.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Investment Opportunities',
      imagePath: 'assets/images/lessons/day20/lesson2/content2.png',
      imagePrompt: 'cartoon clean energy investments: solar, wind, EV, battery technology growth',
      content: '''Green investment themes:''',
      bullets: [
        BulletPoint(icon: '☀️', title: 'Clean Energy', description: 'Solar, wind, and renewables.'),
        BulletPoint(icon: '🚗', title: 'Electric Vehicles', description: 'EVs and battery tech.'),
        BulletPoint(icon: '♻️', title: 'Circular Economy', description: 'Recycling and reuse.'),
        BulletPoint(icon: '🏗️', title: 'Green Building', description: 'Sustainable construction.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Green Check',
      imagePath: 'assets/images/lessons/day20/lesson2/game1.png',
      imagePrompt: 'cartoon environmental factor example',
      gameData: GameData(
        type: 'choice',
        instruction: 'An environmental factor is:',
        options: [GameOption(label: 'CEO salary', emoji: '💰'), GameOption(label: 'Carbon emissions', emoji: '🌡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Theme Pop',
      imagePath: 'assets/images/lessons/day20/lesson2/game2.png',
      imagePrompt: 'cartoon clean energy investment',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Clean energy includes:',
        options: [GameOption(label: 'Coal power', emoji: '⚫'), GameOption(label: 'Solar and wind', emoji: '☀️'), GameOption(label: 'Oil drilling', emoji: '🛢️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day20/lesson2/question.png',
      imagePrompt: 'cartoon EV investment theme',
      questionData: QuestionData(
        question: 'Electric vehicles are part of which ESG theme?',
        options: ['Governance', 'Social', 'Environmental', 'None'],
        correctIndex: 2,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Environment Mission',
      imagePath: 'assets/images/lessons/day20/lesson2/mission.png',
      imagePrompt: 'cartoon company with good environmental practices',
      missionData: MissionData(
        mission: 'Why might green companies be good investments?',
        options: ['They are not', 'Better positioned for future regulations and trends', 'Always lose money', 'Only for charity'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Green Investor', badgeIcon: '🌍')),
  ],
);
