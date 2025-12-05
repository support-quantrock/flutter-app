import '../../models/lesson_models.dart';

final day4Lesson2 = LessonData(
  day: 4,
  title: "Stocks Explained",
  emoji: '📈',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Own a Piece of Giants',
      imagePath: 'assets/images/lessons/day4/lesson2/story.png',
      imagePrompt:
          'cartoon tiny investor holding a piece of puzzle that fits into a giant company building like Apple or Google, ownership visualization',
      content:
          '''What if you could own a piece of Apple, Google, or Amazon?

With stocks, you can! When you buy a stock, you become a part-owner of that company.

Let me show you how this works!''',
    ),

    // Screen 2: Content - What Are Stocks
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Are Stocks?',
      imagePath: 'assets/images/lessons/day4/lesson2/content1.png',
      imagePrompt:
          'cartoon company being divided into many equal pieces (shares), investors each holding different numbers of pieces, simple ownership visualization',
      content: '''A stock is a tiny piece of ownership in a company.

When you buy stock, you become a shareholder!''',
      bullets: [
        BulletPoint(
          icon: '🧩',
          title: 'Shares',
          description: 'Companies are divided into millions of tiny pieces called shares.',
        ),
        BulletPoint(
          icon: '👤',
          title: 'Shareholder',
          description: 'When you own shares, you are a part-owner.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Growth',
          description: 'If the company grows, your shares become more valuable.',
        ),
        BulletPoint(
          icon: '💵',
          title: 'Dividends',
          description: 'Some companies share profits with shareholders.',
        ),
      ],
    ),

    // Screen 3: Content - How Stocks Make Money
    const LessonScreen(
      type: ScreenType.content,
      title: 'How You Make Money',
      imagePath: 'assets/images/lessons/day4/lesson2/content2.png',
      imagePrompt:
          'cartoon two paths to profit: stock price going up (capital gains) and dividend checks arriving (income), dual income visualization',
      content: '''There are two ways to profit from stocks:''',
      bullets: [
        BulletPoint(
          icon: '📈',
          title: 'Capital Gains',
          description: 'Buy at \$10, sell at \$15 = \$5 profit per share.',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Dividends',
          description: 'Some companies pay you just for holding their stock.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'Risk',
          description: 'Prices can also go DOWN. You could lose money.',
        ),
        BulletPoint(
          icon: '⏰',
          title: 'Time Helps',
          description: 'Long-term, stock markets have trended upward.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Stock Basics',
      imagePath: 'assets/images/lessons/day4/lesson2/game1.png',
      imagePrompt:
          'cartoon investor buying stock certificate, ownership transfer visualization, educational game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'When you buy a stock, what do you become?',
        options: [
          GameOption(
            label: 'An employee of the company',
            emoji: '👔',
          ),
          GameOption(
            label: 'A part-owner of the company',
            emoji: '🏢',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Profit!',
      imagePath: 'assets/images/lessons/day4/lesson2/game2.png',
      imagePrompt:
          'cartoon balloons with different ways to profit from stocks, colorful educational game',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which is a way to profit from stocks?',
        options: [
          GameOption(
            label: 'The company sends you free products',
            emoji: '📦',
          ),
          GameOption(
            label: 'Sell for more than you paid (capital gains)',
            emoji: '💰',
          ),
          GameOption(
            label: 'The stock gives you a job',
            emoji: '💼',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day4/lesson2/question.png',
      imagePrompt:
          'cartoon stock price chart with dividend payment, quiz atmosphere',
      questionData: QuestionData(
        question: 'What is a "dividend"?',
        options: [
          'A type of stock exchange',
          'Money companies pay to shareholders from profits',
          'The price of a stock',
          'A fee you pay to buy stocks',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Stock Mission',
      imagePath: 'assets/images/lessons/day4/lesson2/mission.png',
      imagePrompt:
          'cartoon investor researching companies before buying, smart decision making visualization',
      missionData: MissionData(
        mission: 'What should you understand before buying a stock?',
        options: [
          'Nothing, just buy randomly',
          'The company business and why it might grow',
          'Only the stock ticker symbol',
          'What your friends are buying',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 9,
        badgeName: 'Stock Rookie',
        badgeIcon: '📈',
      ),
    ),
  ],
);
