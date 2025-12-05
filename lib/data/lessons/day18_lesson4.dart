import '../../models/lesson_models.dart';

final day18Lesson4 = LessonData(
  day: 18,
  title: "Emerging Markets",
  emoji: '🌱',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Growth Frontiers',
      imagePath: 'assets/images/lessons/day18/lesson4/story.png',
      imagePrompt: 'cartoon emerging market countries growing rapidly: China, India, Brazil skyscrapers rising',
      content: '''Emerging markets are developing economies.

They grow faster than developed countries!

But with higher growth comes higher risk.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Top Emerging Markets',
      imagePath: 'assets/images/lessons/day18/lesson4/content1.png',
      imagePrompt: 'cartoon BRICS countries and other emerging markets: Brazil, Russia, India, China, South Africa',
      content: '''Major emerging markets:''',
      bullets: [
        BulletPoint(icon: '🇨🇳', title: 'China', description: 'World\'s second-largest economy.'),
        BulletPoint(icon: '🇮🇳', title: 'India', description: 'Fastest-growing major economy.'),
        BulletPoint(icon: '🇧🇷', title: 'Brazil', description: 'South America\'s largest.'),
        BulletPoint(icon: '🌏', title: 'Others', description: 'Mexico, Indonesia, South Korea.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Risks and Rewards',
      imagePath: 'assets/images/lessons/day18/lesson4/content2.png',
      imagePrompt: 'cartoon emerging market risks: political instability, currency swings, vs growth potential',
      content: '''The emerging market tradeoff:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Higher Growth', description: 'Economies expanding rapidly.'),
        BulletPoint(icon: '⚠️', title: 'Political Risk', description: 'Less stable governments.'),
        BulletPoint(icon: '💱', title: 'Currency Swings', description: 'More volatile currencies.'),
        BulletPoint(icon: '📊', title: 'Less Transparent', description: 'Weaker financial reporting.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'EM Check',
      imagePath: 'assets/images/lessons/day18/lesson4/game1.png',
      imagePrompt: 'cartoon emerging market growth',
      gameData: GameData(
        type: 'choice',
        instruction: 'Emerging markets typically have:',
        options: [GameOption(label: 'Lower growth than developed', emoji: '📉'), GameOption(label: 'Higher growth potential', emoji: '🚀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Country Pop',
      imagePath: 'assets/images/lessons/day18/lesson4/game2.png',
      imagePrompt: 'cartoon major emerging markets',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which is an emerging market?',
        options: [GameOption(label: 'Germany', emoji: '🇩🇪'), GameOption(label: 'India', emoji: '🇮🇳'), GameOption(label: 'Japan', emoji: '🇯🇵')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day18/lesson4/question.png',
      imagePrompt: 'cartoon emerging market risks',
      questionData: QuestionData(
        question: 'A risk specific to emerging markets is:',
        options: ['Too stable', 'Political instability', 'Too slow growth', 'Too many regulations'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'EM Mission',
      imagePath: 'assets/images/lessons/day18/lesson4/mission.png',
      imagePrompt: 'cartoon balancing EM risk and reward',
      missionData: MissionData(
        mission: 'Emerging markets are best for investors who:',
        options: ['Want no risk', 'Accept higher risk for higher potential', 'Only want dividends', 'Need money next month'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'EM Explorer', badgeIcon: '🌱')),
  ],
);
