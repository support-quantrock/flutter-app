import '../../models/lesson_models.dart';

final day5Lesson5 = LessonData(
  day: 5,
  title: "How to Invest in Commodities",
  emoji: '📊',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Commodity Toolkit',
      imagePath: 'assets/images/lessons/day5/lesson5/story.png',
      imagePrompt:
          'cartoon investor with multiple tools to access commodities: ETF, futures contract, mining stock, physical gold, toolkit visualization',
      content:
          '''You do not need a warehouse to invest in commodities!

There are several easy ways to add gold, oil, and other commodities to your portfolio.

Let me show you the options!''',
    ),

    // Screen 2: Content - Ways to Invest
    const LessonScreen(
      type: ScreenType.content,
      title: 'Ways to Invest',
      imagePath: 'assets/images/lessons/day5/lesson5/content1.png',
      imagePrompt:
          'cartoon four paths to commodity investing: physical bar, ETF certificate, futures contract, mining company stock, options visualization',
      content: '''There are different ways to invest in commodities:''',
      bullets: [
        BulletPoint(
          icon: '🥇',
          title: 'Physical',
          description: 'Buy actual gold coins or bars. You own the real thing.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'ETFs',
          description: 'Funds that track commodity prices. Easy to buy/sell.',
        ),
        BulletPoint(
          icon: '📝',
          title: 'Futures',
          description: 'Contracts for future delivery. Complex and risky.',
        ),
        BulletPoint(
          icon: '🏢',
          title: 'Stocks',
          description: 'Buy mining or oil company shares.',
        ),
      ],
    ),

    // Screen 3: Content - Best for Beginners
    const LessonScreen(
      type: ScreenType.content,
      title: 'Best for Beginners',
      imagePath: 'assets/images/lessons/day5/lesson5/content2.png',
      imagePrompt:
          'cartoon beginner investor happily buying commodity ETF on phone app, simple and easy visualization',
      content: '''For most beginners, ETFs are the easiest way:''',
      bullets: [
        BulletPoint(
          icon: '✅',
          title: 'Easy to Buy',
          description: 'Trade like stocks through your broker.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'No Storage',
          description: 'No need to store physical gold or oil.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'Diversified',
          description: 'Some ETFs hold multiple commodities.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'Liquid',
          description: 'Can sell whenever the market is open.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Method Check',
      imagePath: 'assets/images/lessons/day5/lesson5/game1.png',
      imagePrompt:
          'cartoon beginner choosing between complex futures and simple ETF, decision game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What is the EASIEST way for beginners to invest in gold?',
        options: [
          GameOption(
            label: 'Trade gold futures contracts',
            emoji: '📝',
          ),
          GameOption(
            label: 'Buy a gold ETF',
            emoji: '📊',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find the Best!',
      imagePath: 'assets/images/lessons/day5/lesson5/game2.png',
      imagePrompt:
          'cartoon treasure chests with different investment methods for commodities, one glowing for beginners, adventure style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which commodity investment requires NO storage?',
        options: [
          GameOption(
            label: 'Physical gold bars',
            emoji: '🥇',
          ),
          GameOption(
            label: 'Commodity ETFs',
            emoji: '📈',
          ),
          GameOption(
            label: 'Oil barrels',
            emoji: '🛢️',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day5/lesson5/question.png',
      imagePrompt:
          'cartoon ETF vs physical gold comparison, quiz atmosphere',
      questionData: QuestionData(
        question: 'What is a commodity ETF?',
        options: [
          'A type of cryptocurrency',
          'A fund that tracks commodity prices, traded like stocks',
          'Physical storage of commodities',
          'A government bond',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Investment Mission',
      imagePath: 'assets/images/lessons/day5/lesson5/mission.png',
      imagePrompt:
          'cartoon investor adding commodity ETF to diversified portfolio, portfolio balance visualization',
      missionData: MissionData(
        mission: 'Before investing in commodities, you should:',
        options: [
          'Buy as much as possible immediately',
          'Understand the risks and how they fit your portfolio',
          'Only invest in physical gold',
          'Ignore commodity ETFs',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Commodity Investor',
        badgeIcon: '📊',
      ),
    ),
  ],
);
