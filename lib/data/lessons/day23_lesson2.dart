import '../../models/lesson_models.dart';

final day23Lesson2 = LessonData(
  day: 23,
  title: "Ways to Invest in Real Estate",
  emoji: '🏢',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Many Paths to Property',
      imagePath: 'assets/images/lessons/day23/lesson2/story.png',
      imagePrompt: 'cartoon different real estate investment methods: direct ownership, REITs, crowdfunding',
      content: '''You do not need to buy a whole property!

There are many ways to invest in real estate.

From owning property to buying REITs on the stock market.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Direct Ownership',
      imagePath: 'assets/images/lessons/day23/lesson2/content1.png',
      imagePrompt: 'cartoon direct property ownership: house with for rent sign, landlord collecting rent',
      content: '''Owning property directly:''',
      bullets: [
        BulletPoint(icon: '🏠', title: 'Residential', description: 'Houses and apartments.'),
        BulletPoint(icon: '🏢', title: 'Commercial', description: 'Office and retail spaces.'),
        BulletPoint(icon: '💰', title: 'Full Control', description: 'You make all decisions.'),
        BulletPoint(icon: '🔧', title: 'Responsibility', description: 'You handle maintenance.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Indirect Investing',
      imagePath: 'assets/images/lessons/day23/lesson2/content2.png',
      imagePrompt: 'cartoon REITs and real estate funds as easy alternatives to direct ownership',
      content: '''Invest without owning property:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'REITs', description: 'Real Estate Investment Trusts.'),
        BulletPoint(icon: '🏦', title: 'Trade Like Stocks', description: 'Buy and sell easily.'),
        BulletPoint(icon: '🌈', title: 'Diversified', description: 'Own many properties at once.'),
        BulletPoint(icon: '💵', title: 'Lower Minimum', description: 'Start with small amounts.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Method Check',
      imagePath: 'assets/images/lessons/day23/lesson2/game1.png',
      imagePrompt: 'cartoon REIT simplicity',
      gameData: GameData(
        type: 'choice',
        instruction: 'REITs allow you to invest in real estate:',
        options: [GameOption(label: 'Only by buying property', emoji: '🏠'), GameOption(label: 'Through stock market like shares', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Benefit Pop',
      imagePath: 'assets/images/lessons/day23/lesson2/game2.png',
      imagePrompt: 'cartoon REIT diversification',
      gameData: GameData(
        type: 'balloon',
        instruction: 'REITs typically own:',
        options: [GameOption(label: 'One property', emoji: '1️⃣'), GameOption(label: 'Many different properties', emoji: '🏢'), GameOption(label: 'No properties', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day23/lesson2/question.png',
      imagePrompt: 'cartoon direct vs indirect ownership',
      questionData: QuestionData(
        question: 'With direct property ownership, you have:',
        options: ['No control', 'Full control and full responsibility', 'Only benefits, no work', 'Automatic management'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Method Mission',
      imagePath: 'assets/images/lessons/day23/lesson2/mission.png',
      imagePrompt: 'cartoon choosing real estate investment method',
      missionData: MissionData(
        mission: 'For someone with little capital, which is more accessible?',
        options: ['Buying a building', 'REITs with low minimums', 'Both are the same', 'Neither is accessible'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Method Master', badgeIcon: '🏢')),
  ],
);
