import '../../models/lesson_models.dart';

final day23Lesson3 = LessonData(
  day: 23,
  title: "Understanding REITs",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Real Estate for Everyone',
      imagePath: 'assets/images/lessons/day23/lesson3/story.png',
      imagePrompt: 'cartoon REIT as basket of many buildings accessible to small investor',
      content: '''REITs make real estate investing easy.

Companies that own and manage income-producing properties.

They must pay most profits as dividends!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How REITs Work',
      imagePath: 'assets/images/lessons/day23/lesson3/content1.png',
      imagePrompt: 'cartoon REIT structure: company owns properties, collects rent, pays dividends',
      content: '''REIT structure:''',
      bullets: [
        BulletPoint(icon: '🏢', title: 'Own Properties', description: 'REITs own real estate.'),
        BulletPoint(icon: '💵', title: 'Collect Rent', description: 'Tenants pay rent to REIT.'),
        BulletPoint(icon: '💰', title: '90% Rule', description: 'Must pay out 90% of income.'),
        BulletPoint(icon: '📊', title: 'High Dividends', description: 'Often higher yields than stocks.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of REITs',
      imagePath: 'assets/images/lessons/day23/lesson3/content2.png',
      imagePrompt: 'cartoon different REIT types: office, retail, residential, industrial, healthcare',
      content: '''Different REIT categories:''',
      bullets: [
        BulletPoint(icon: '🏢', title: 'Office', description: 'Office buildings.'),
        BulletPoint(icon: '🛒', title: 'Retail', description: 'Shopping centers and malls.'),
        BulletPoint(icon: '🏠', title: 'Residential', description: 'Apartments and homes.'),
        BulletPoint(icon: '🏭', title: 'Industrial', description: 'Warehouses and logistics.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Dividend Check',
      imagePath: 'assets/images/lessons/day23/lesson3/game1.png',
      imagePrompt: 'cartoon REIT dividend requirement',
      gameData: GameData(
        type: 'choice',
        instruction: 'REITs must pay out what percentage of income?',
        options: [GameOption(label: '10%', emoji: '1️⃣'), GameOption(label: '90%', emoji: '9️⃣')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Type Pop',
      imagePath: 'assets/images/lessons/day23/lesson3/game2.png',
      imagePrompt: 'cartoon industrial REIT warehouses',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Industrial REITs typically own:',
        options: [GameOption(label: 'Apartments', emoji: '🏠'), GameOption(label: 'Warehouses', emoji: '🏭'), GameOption(label: 'Hospitals', emoji: '🏥')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day23/lesson3/question.png',
      imagePrompt: 'cartoon REIT high dividend yield',
      questionData: QuestionData(
        question: 'REITs often have higher dividend yields because:',
        options: ['They are risky', 'Required to pay out 90% of income', 'They lose money', 'Government subsidizes them'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'REIT Mission',
      imagePath: 'assets/images/lessons/day23/lesson3/mission.png',
      imagePrompt: 'cartoon REIT investor receiving dividends',
      missionData: MissionData(
        mission: 'REITs are good for investors who want:',
        options: ['No income', 'Regular dividend income from real estate', 'Only growth, no dividends', 'To manage properties themselves'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'REIT Expert', badgeIcon: '📊')),
  ],
);
