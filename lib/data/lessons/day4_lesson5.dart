import '../../models/lesson_models.dart';

final day4Lesson5 = LessonData(
  day: 4,
  title: "Brokers & Regulators",
  emoji: '🏦',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Market Gatekeepers',
      imagePath: 'assets/images/lessons/day4/lesson5/story.png',
      imagePrompt:
          'cartoon broker as helpful guide at market entrance, regulator as referee ensuring fair play, market gatekeepers visualization',
      content:
          '''You cannot just walk into a stock exchange and buy shares directly.

You need a broker to help you trade, and regulators to keep everything fair.

Let me introduce you to these important players!''',
    ),

    // Screen 2: Content - Brokers
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Are Brokers?',
      imagePath: 'assets/images/lessons/day4/lesson5/content1.png',
      imagePrompt:
          'cartoon broker as middleman connecting investor to stock exchange, bridge between buyer and market, educational style',
      content: '''A broker is your gateway to the financial markets.''',
      bullets: [
        BulletPoint(
          icon: '🌉',
          title: 'Middleman',
          description: 'Connects you to stock exchanges and markets.',
        ),
        BulletPoint(
          icon: '📱',
          title: 'Platform',
          description: 'Provides apps and tools to buy and sell.',
        ),
        BulletPoint(
          icon: '💵',
          title: 'Fees',
          description: 'May charge commissions or fees for trades.',
        ),
        BulletPoint(
          icon: '🔍',
          title: 'Research',
          description: 'Some offer research and investment advice.',
        ),
      ],
    ),

    // Screen 3: Content - Regulators
    const LessonScreen(
      type: ScreenType.content,
      title: 'Who Are Regulators?',
      imagePath: 'assets/images/lessons/day4/lesson5/content2.png',
      imagePrompt:
          'cartoon referee in striped shirt watching over market trading floor, ensuring fair play, regulator visualization',
      content: '''Regulators are the referees of financial markets.''',
      bullets: [
        BulletPoint(
          icon: '⚖️',
          title: 'Fair Play',
          description: 'Make sure everyone follows the rules.',
        ),
        BulletPoint(
          icon: '🛡️',
          title: 'Protection',
          description: 'Protect investors from fraud and manipulation.',
        ),
        BulletPoint(
          icon: '📋',
          title: 'Rules',
          description: 'Create and enforce trading regulations.',
        ),
        BulletPoint(
          icon: '🏛️',
          title: 'Examples',
          description: 'SEC (USA), FCA (UK), and others worldwide.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Role Check',
      imagePath: 'assets/images/lessons/day4/lesson5/game1.png',
      imagePrompt:
          'cartoon broker and regulator side by side, role identification game, educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What is the main job of a BROKER?',
        options: [
          GameOption(
            label: 'Enforce trading rules',
            emoji: '⚖️',
          ),
          GameOption(
            label: 'Help you buy and sell investments',
            emoji: '🤝',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Regulator!',
      imagePath: 'assets/images/lessons/day4/lesson5/game2.png',
      imagePrompt:
          'cartoon balloons with different roles in financial markets, colorful game atmosphere',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What do REGULATORS do?',
        options: [
          GameOption(
            label: 'Execute your trades',
            emoji: '📊',
          ),
          GameOption(
            label: 'Protect investors and enforce rules',
            emoji: '🛡️',
          ),
          GameOption(
            label: 'Recommend which stocks to buy',
            emoji: '💡',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day4/lesson5/question.png',
      imagePrompt:
          'cartoon SEC building representing regulators, quiz atmosphere',
      questionData: QuestionData(
        question: 'Why do we need financial regulators?',
        options: [
          'To make trading more complicated',
          'To protect investors and ensure fair markets',
          'To slow down trading',
          'Regulators are not important',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Gateway Mission',
      imagePath: 'assets/images/lessons/day4/lesson5/mission.png',
      imagePrompt:
          'cartoon investor choosing a broker from multiple options, selection process visualization',
      missionData: MissionData(
        mission: 'What should you check when choosing a broker?',
        options: [
          'Just pick the first one you see',
          'Fees, reputation, tools, and regulatory approval',
          'Only look at the logo',
          'The broker office location',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Market Ready',
        badgeIcon: '🏦',
      ),
    ),
  ],
);
