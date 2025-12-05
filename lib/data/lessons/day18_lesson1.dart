import '../../models/lesson_models.dart';

final day18Lesson1 = LessonData(
  day: 18,
  title: "Why Go Global?",
  emoji: '🌍',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The World is Your Market',
      imagePath: 'assets/images/lessons/day18/lesson1/story.png',
      imagePrompt: 'cartoon investor looking at globe with investment opportunities in different countries',
      content: '''The world is bigger than your home country.

Amazing companies exist everywhere!

Global investing opens doors to more opportunities.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Benefits of Global Investing',
      imagePath: 'assets/images/lessons/day18/lesson1/content1.png',
      imagePrompt: 'cartoon global investing benefits: diversification, growth markets, opportunities',
      content: '''Why invest globally:''',
      bullets: [
        BulletPoint(icon: '🌈', title: 'Diversification', description: 'Not all markets move together.'),
        BulletPoint(icon: '🚀', title: 'Growth', description: 'Emerging markets grow faster.'),
        BulletPoint(icon: '🏢', title: 'Access', description: 'Great companies are worldwide.'),
        BulletPoint(icon: '⏰', title: 'Different Cycles', description: 'Countries in different stages.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Market Types',
      imagePath: 'assets/images/lessons/day18/lesson1/content2.png',
      imagePrompt: 'cartoon three market types: developed (skyscraper), emerging (building), frontier (scaffolding)',
      content: '''Global market categories:''',
      bullets: [
        BulletPoint(icon: '🏛️', title: 'Developed', description: 'US, Europe, Japan - stable, mature.'),
        BulletPoint(icon: '📈', title: 'Emerging', description: 'China, India, Brazil - high growth.'),
        BulletPoint(icon: '🌱', title: 'Frontier', description: 'Vietnam, Kenya - early stage, risky.'),
        BulletPoint(icon: '⚖️', title: 'Mix', description: 'Balance based on risk tolerance.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Global Check',
      imagePath: 'assets/images/lessons/day18/lesson1/game1.png',
      imagePrompt: 'cartoon global diversification benefit',
      gameData: GameData(
        type: 'choice',
        instruction: 'Global investing provides:',
        options: [GameOption(label: 'Less diversification', emoji: '📉'), GameOption(label: 'More diversification opportunities', emoji: '🌍')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Market Pop',
      imagePath: 'assets/images/lessons/day18/lesson1/game2.png',
      imagePrompt: 'cartoon emerging markets growth',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Emerging markets are known for:',
        options: [GameOption(label: 'Slow growth', emoji: '🐢'), GameOption(label: 'Higher growth potential', emoji: '🚀'), GameOption(label: 'No risk', emoji: '🛡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day18/lesson1/question.png',
      imagePrompt: 'cartoon developed market examples',
      questionData: QuestionData(
        question: 'Which are considered developed markets?',
        options: ['Only the US', 'US, Europe, and Japan', 'Only Africa', 'No markets are developed'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Global Mission',
      imagePath: 'assets/images/lessons/day18/lesson1/mission.png',
      imagePrompt: 'cartoon investor going global',
      missionData: MissionData(
        mission: 'Why might global diversification help?',
        options: ['All markets move identically', 'Different markets have different cycles', 'It does not help', 'Only for professionals'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Global Thinker', badgeIcon: '🌍')),
  ],
);
