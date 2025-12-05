import '../../models/lesson_models.dart';

final day5Lesson2 = LessonData(
  day: 5,
  title: "Gold: The Safe Haven",
  emoji: '🥇',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Timeless Metal',
      imagePath: 'assets/images/lessons/day5/lesson2/story.png',
      imagePrompt:
          'cartoon ancient treasure vault with gold glowing through ages, pyramids to modern banks, timeless value visualization',
      content:
          '''For thousands of years, gold has been treasured by humans.

Kings stored it, wars were fought over it, and today investors still trust it.

Why is gold so special? Let me explain!''',
    ),

    // Screen 2: Content - Why Gold
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Gold Is Special',
      imagePath: 'assets/images/lessons/day5/lesson2/content1.png',
      imagePrompt:
          'cartoon gold bar with crown, showing its properties: rare, durable, universal, shining with importance',
      content: '''Gold has unique properties that make it valuable:''',
      bullets: [
        BulletPoint(
          icon: '💎',
          title: 'Rare',
          description: 'Limited supply - cannot be printed or created.',
        ),
        BulletPoint(
          icon: '🛡️',
          title: 'Durable',
          description: 'Does not rust, corrode, or decay.',
        ),
        BulletPoint(
          icon: '🌍',
          title: 'Universal',
          description: 'Accepted and valued everywhere in the world.',
        ),
        BulletPoint(
          icon: '⏰',
          title: 'Store of Value',
          description: 'Has held value for thousands of years.',
        ),
      ],
    ),

    // Screen 3: Content - Gold as Investment
    const LessonScreen(
      type: ScreenType.content,
      title: 'Gold as Investment',
      imagePath: 'assets/images/lessons/day5/lesson2/content2.png',
      imagePrompt:
          'cartoon gold acting as safe harbor while stock ships struggle in storm, safe haven visualization, educational style',
      content: '''Investors use gold for protection:''',
      bullets: [
        BulletPoint(
          icon: '🛡️',
          title: 'Safe Haven',
          description: 'When markets crash, investors often buy gold.',
        ),
        BulletPoint(
          icon: '📉',
          title: 'Inflation Hedge',
          description: 'Gold often rises when currency loses value.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Portfolio Balance',
          description: 'Adds diversification to your investments.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'No Income',
          description: 'Gold does not pay dividends or interest.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Gold Check',
      imagePath: 'assets/images/lessons/day5/lesson2/game1.png',
      imagePrompt:
          'cartoon market crash scene with gold rising while stocks fall, safe haven game visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'During a market crisis, investors often:',
        options: [
          GameOption(
            label: 'Sell all their gold',
            emoji: '📤',
          ),
          GameOption(
            label: 'Buy gold as a safe haven',
            emoji: '🥇',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find Gold Truth!',
      imagePath: 'assets/images/lessons/day5/lesson2/game2.png',
      imagePrompt:
          'cartoon treasure chests with gold facts vs myths, one true statement glowing, adventure style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which statement about gold is TRUE?',
        options: [
          GameOption(
            label: 'Gold pays monthly dividends',
            emoji: '💰',
          ),
          GameOption(
            label: 'Gold is a store of value for thousands of years',
            emoji: '⏰',
          ),
          GameOption(
            label: 'Gold rusts over time',
            emoji: '🔧',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day5/lesson2/question.png',
      imagePrompt:
          'cartoon gold vs paper money comparison during inflation, quiz atmosphere',
      questionData: QuestionData(
        question: 'Why is gold called an "inflation hedge"?',
        options: [
          'Gold always goes down during inflation',
          'Gold often maintains value when currency loses purchasing power',
          'Gold is made of paper',
          'The government controls gold prices',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Gold Mission',
      imagePath: 'assets/images/lessons/day5/lesson2/mission.png',
      imagePrompt:
          'cartoon investor adding gold to portfolio for balance, strategic allocation visualization',
      missionData: MissionData(
        mission: 'What is ONE downside of investing in gold?',
        options: [
          'It is too heavy to carry',
          'It does not generate income (no dividends)',
          'It is illegal to own',
          'It always loses value',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 9,
        badgeName: 'Gold Seeker',
        badgeIcon: '🥇',
      ),
    ),
  ],
);
