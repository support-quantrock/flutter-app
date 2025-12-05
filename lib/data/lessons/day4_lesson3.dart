import '../../models/lesson_models.dart';

final day4Lesson3 = LessonData(
  day: 4,
  title: "Bonds Basics",
  emoji: '📜',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Be the Lender',
      imagePath: 'assets/images/lessons/day4/lesson3/story.png',
      imagePrompt:
          'cartoon investor lending money to government building and receiving IOUs with interest, role reversal with bank, educational style',
      content:
          '''What if YOU could be the bank and lend money to governments and big companies?

With bonds, you can! They borrow from you and pay you back with interest.

Let me show you how bonds work!''',
    ),

    // Screen 2: Content - What Are Bonds
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Are Bonds?',
      imagePath: 'assets/images/lessons/day4/lesson3/content1.png',
      imagePrompt:
          'cartoon IOU certificate with government seal, showing loan amount and interest rate, simple bond visualization',
      content: '''A bond is like an IOU. You lend money and get paid back with interest.''',
      bullets: [
        BulletPoint(
          icon: '📜',
          title: 'Loan Agreement',
          description: 'You lend money to a government or company.',
        ),
        BulletPoint(
          icon: '💵',
          title: 'Interest Payments',
          description: 'They pay you regular interest (called coupon).',
        ),
        BulletPoint(
          icon: '📅',
          title: 'Maturity Date',
          description: 'On this date, you get your original money back.',
        ),
        BulletPoint(
          icon: '🛡️',
          title: 'Generally Safer',
          description: 'Bonds are usually less risky than stocks.',
        ),
      ],
    ),

    // Screen 3: Content - Types of Bonds
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Bonds',
      imagePath: 'assets/images/lessons/day4/lesson3/content2.png',
      imagePrompt:
          'cartoon three bond types: government building (safest), corporate tower (medium), municipal city hall (tax benefits), comparison style',
      content: '''Different borrowers issue different bonds:''',
      bullets: [
        BulletPoint(
          icon: '🏛️',
          title: 'Government Bonds',
          description: 'Safest. Backed by the government. Lower interest.',
        ),
        BulletPoint(
          icon: '🏢',
          title: 'Corporate Bonds',
          description: 'From companies. Higher interest, more risk.',
        ),
        BulletPoint(
          icon: '🏙️',
          title: 'Municipal Bonds',
          description: 'From cities/states. Often tax-free.',
        ),
        BulletPoint(
          icon: '⚖️',
          title: 'Risk vs Return',
          description: 'Higher risk bonds pay higher interest.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Bond Basics',
      imagePath: 'assets/images/lessons/day4/lesson3/game1.png',
      imagePrompt:
          'cartoon investor choosing between lender and borrower roles, role identification game',
      gameData: GameData(
        type: 'choice',
        instruction: 'When you buy a bond, you are:',
        options: [
          GameOption(
            label: 'Borrowing money',
            emoji: '🙏',
          ),
          GameOption(
            label: 'Lending money',
            emoji: '🏦',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find the Safest!',
      imagePath: 'assets/images/lessons/day4/lesson3/game2.png',
      imagePrompt:
          'cartoon treasure chests labeled with different bond types, one glowing as safest, adventure style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which type of bond is usually SAFEST?',
        options: [
          GameOption(
            label: 'Startup Company Bond',
            emoji: '🚀',
          ),
          GameOption(
            label: 'Government Bond',
            emoji: '🏛️',
          ),
          GameOption(
            label: 'Unknown Company Bond',
            emoji: '❓',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day4/lesson3/question.png',
      imagePrompt:
          'cartoon bond certificate with interest rate circled, quiz atmosphere',
      questionData: QuestionData(
        question: 'What is the "coupon" of a bond?',
        options: [
          'A discount code',
          'The regular interest payment',
          'The bond color',
          'A free gift',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Bond Mission',
      imagePath: 'assets/images/lessons/day4/lesson3/mission.png',
      imagePrompt:
          'cartoon investor balancing stocks and bonds on a scale, portfolio balance visualization',
      missionData: MissionData(
        mission: 'Why might someone include bonds in their portfolio?',
        options: [
          'Bonds always make more money than stocks',
          'For stability and regular income',
          'Bonds are more exciting',
          'Because everyone else does',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Bond Banker',
        badgeIcon: '📜',
      ),
    ),
  ],
);
