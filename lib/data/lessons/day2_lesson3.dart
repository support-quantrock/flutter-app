import '../../models/lesson_models.dart';

final day2Lesson3 = LessonData(
  day: 2,
  title: "Long-Term Vision",
  emoji: '🔭',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Sky View',
      imagePath: 'assets/images/lessons/day2/lesson3/story.png',
      imagePrompt:
          'cartoon character in hot air balloon rising above daily noise, seeing long-term growth path stretching into bright future, inspirational style',
      content:
          '''Most people are stuck looking at today. Investors look at tomorrow.

When you zoom out and see the big picture, everything changes.

Let me show you the power of long-term vision!''',
    ),

    // Screen 2: Content - Short vs Long Term
    const LessonScreen(
      type: ScreenType.content,
      title: 'Short-Term vs Long-Term',
      imagePath: 'assets/images/lessons/day2/lesson3/content1.png',
      imagePrompt:
          'cartoon split view: chaotic short-term chart with stressed person vs smooth long-term upward chart with calm person, comparison style',
      content: '''Time changes everything in investing.

Short-term is noisy. Long-term is clear.''',
      bullets: [
        BulletPoint(
          icon: '📉',
          title: 'Short-Term (Days/Weeks)',
          description: 'Chaotic, emotional, unpredictable movements.',
        ),
        BulletPoint(
          icon: '📊',
          title: 'Medium-Term (Months)',
          description: 'Patterns start to emerge, less noise.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Long-Term (Years)',
          description: 'Clear trends, compounding works its magic.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'The Truth',
          description: 'Most wealth is built over years, not days.',
        ),
      ],
    ),

    // Screen 3: Content - Benefits of Long-Term
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Think Long-Term?',
      imagePath: 'assets/images/lessons/day2/lesson3/content2.png',
      imagePrompt:
          'cartoon peaceful investor meditating while short-term traders run around stressed, zen long-term approach, educational style',
      content: '''Long-term thinking gives you superpowers:''',
      bullets: [
        BulletPoint(
          icon: '😌',
          title: 'Less Stress',
          description: 'Daily price moves do not bother you.',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Compounding',
          description: 'Your money has time to multiply.',
        ),
        BulletPoint(
          icon: '🛡️',
          title: 'Protection',
          description: 'Time smooths out the bumps.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Better Decisions',
          description: 'Less emotion, more logic.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Time Horizon',
      imagePath: 'assets/images/lessons/day2/lesson3/game1.png',
      imagePrompt:
          'cartoon two investors: one panicking at daily chart, other calmly looking at yearly chart, contrasting reactions, educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Your investment drops 5% today. What should you do?',
        options: [
          GameOption(
            label: 'Panic and sell immediately',
            emoji: '😱',
          ),
          GameOption(
            label: 'Stay calm, check your long-term plan',
            emoji: '🧘',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Short-Term!',
      imagePath: 'assets/images/lessons/day2/lesson3/game2.png',
      imagePrompt:
          'cartoon balloons with different time horizons written on them, some chaotic some peaceful, game style',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which timeframe shows TRUE wealth growth?',
        options: [
          GameOption(
            label: 'Daily price movements',
            emoji: '📉',
          ),
          GameOption(
            label: 'Multi-year trends',
            emoji: '📈',
          ),
          GameOption(
            label: 'Hourly changes',
            emoji: '⏰',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson3/question.png',
      imagePrompt:
          'cartoon calendar showing years with growth chart overlay, time and wealth connection, educational style',
      questionData: QuestionData(
        question: 'Why is long-term thinking better for most investors?',
        options: [
          'You can get rich quick',
          'Compounding needs time to work',
          'You never have to check your investments',
          'Short-term is too boring',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Vision Mission',
      imagePath: 'assets/images/lessons/day2/lesson3/mission.png',
      imagePrompt:
          'cartoon character with telescope looking at distant mountain peak labeled financial goals, journey ahead, inspirational style',
      missionData: MissionData(
        mission: 'How often should a long-term investor check prices?',
        options: [
          'Every 5 minutes',
          'Every hour',
          'Monthly or less frequently',
          'Never invest at all',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Big Picture Thinker',
        badgeIcon: '🔭',
      ),
    ),
  ],
);
