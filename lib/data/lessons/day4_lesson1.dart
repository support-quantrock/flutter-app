import '../../models/lesson_models.dart';

final day4Lesson1 = LessonData(
  day: 4,
  title: "What Are Financial Markets?",
  emoji: '🌍',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Global Marketplace',
      imagePath: 'assets/images/lessons/day4/lesson1/story.png',
      imagePrompt:
          'cartoon globe surrounded by floating trading screens, stock tickers, currency symbols, busy marketplace atmosphere, colorful financial world visualization',
      content:
          '''Imagine a huge marketplace where people buy and sell... not fruits or clothes, but pieces of companies, loans, and currencies!

This is the financial market - the engine of the global economy.

Let me take you inside!''',
    ),

    // Screen 2: Content - What Are Markets
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Big Picture',
      imagePath: 'assets/images/lessons/day4/lesson1/content1.png',
      imagePrompt:
          'cartoon overview of different market types: stock exchange building, bond certificates, currency notes, all connected by arrows, educational style',
      content: '''Financial markets are where buyers and sellers trade financial assets.

Just like a farmers market, but for money and investments!''',
      bullets: [
        BulletPoint(
          icon: '🏛️',
          title: 'Stock Markets',
          description: 'Buy and sell pieces of companies (stocks).',
        ),
        BulletPoint(
          icon: '📜',
          title: 'Bond Markets',
          description: 'Lend money to governments and companies.',
        ),
        BulletPoint(
          icon: '💱',
          title: 'Currency Markets',
          description: 'Exchange one currency for another.',
        ),
        BulletPoint(
          icon: '🛢️',
          title: 'Commodity Markets',
          description: 'Trade gold, oil, wheat, and more.',
        ),
      ],
    ),

    // Screen 3: Content - Why Markets Exist
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Markets Matter',
      imagePath: 'assets/images/lessons/day4/lesson1/content2.png',
      imagePrompt:
          'cartoon showing company needing money connecting with investors through market bridge, mutual benefit visualization, educational style',
      content: '''Markets serve important purposes:''',
      bullets: [
        BulletPoint(
          icon: '🤝',
          title: 'Connect Buyers & Sellers',
          description: 'People who have money meet people who need it.',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Raise Capital',
          description: 'Companies get money to grow and create jobs.',
        ),
        BulletPoint(
          icon: '📊',
          title: 'Price Discovery',
          description: 'Markets determine what things are worth.',
        ),
        BulletPoint(
          icon: '🌊',
          title: 'Liquidity',
          description: 'You can buy and sell quickly when needed.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Market Match',
      imagePath: 'assets/images/lessons/day4/lesson1/game1.png',
      imagePrompt:
          'cartoon stock exchange building with question about what is traded there, educational game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What do you trade in STOCK markets?',
        options: [
          GameOption(
            label: 'Fruits and vegetables',
            emoji: '🍎',
          ),
          GameOption(
            label: 'Pieces of companies',
            emoji: '🏢',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Market!',
      imagePath: 'assets/images/lessons/day4/lesson1/game2.png',
      imagePrompt:
          'cartoon balloons with different market types, colorful financial education game atmosphere',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Where would you trade CURRENCIES?',
        options: [
          GameOption(
            label: 'Stock Market',
            emoji: '📈',
          ),
          GameOption(
            label: 'Forex (Currency) Market',
            emoji: '💱',
          ),
          GameOption(
            label: 'Farmers Market',
            emoji: '🌽',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day4/lesson1/question.png',
      imagePrompt:
          'cartoon market overview with question marks, educational quiz atmosphere',
      questionData: QuestionData(
        question: 'Why do financial markets exist?',
        options: [
          'To make everything confusing',
          'To connect people who have money with those who need it',
          'Only for rich people to play',
          'To replace regular stores',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Market Mission',
      imagePath: 'assets/images/lessons/day4/lesson1/mission.png',
      imagePrompt:
          'cartoon explorer entering the gates of financial markets, adventure beginning style',
      missionData: MissionData(
        mission: 'What is "liquidity" in financial markets?',
        options: [
          'How wet the market floor is',
          'The ability to buy and sell quickly',
          'The amount of water in stocks',
          'A type of investment',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Market Explorer',
        badgeIcon: '🌍',
      ),
    ),
  ],
);
