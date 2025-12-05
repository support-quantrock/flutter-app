import '../../models/lesson_models.dart';

final day3Lesson3 = LessonData(
  day: 3,
  title: "Emergency Fund Basics",
  emoji: '🛡️',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Financial Shield',
      imagePath: 'assets/images/lessons/day3/lesson3/story.png',
      imagePrompt:
          'cartoon knight character holding shield labeled Emergency Fund blocking incoming arrows labeled job loss, medical bills, car repair, protective financial style',
      content:
          '''Life throws surprises at everyone. Job loss, medical bills, car repairs.

Without protection, these surprises can destroy your finances.

An emergency fund is your shield against the unexpected!''',
    ),

    // Screen 2: Content - What is Emergency Fund
    const LessonScreen(
      type: ScreenType.content,
      title: 'What is an Emergency Fund?',
      imagePath: 'assets/images/lessons/day3/lesson3/content1.png',
      imagePrompt:
          'cartoon safe deposit box filled with emergency cash, easily accessible, protective glow, educational style',
      content: '''An emergency fund is money set aside ONLY for true emergencies.

It is NOT for sales, vacations, or impulse buys!''',
      bullets: [
        BulletPoint(
          icon: '💰',
          title: 'Purpose',
          description: 'Cover unexpected expenses without going into debt.',
        ),
        BulletPoint(
          icon: '📍',
          title: 'Location',
          description: 'Keep it in a separate, easily accessible savings account.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Target',
          description: '3-6 months of living expenses is the goal.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'Rule',
          description: 'Only touch it for real emergencies!',
        ),
      ],
    ),

    // Screen 3: Content - Real Emergencies
    const LessonScreen(
      type: ScreenType.content,
      title: 'Real vs Fake Emergencies',
      imagePath: 'assets/images/lessons/day3/lesson3/content2.png',
      imagePrompt:
          'cartoon split screen: real emergencies (hospital, broken car) vs fake emergencies (sale sign, new phone), comparison educational style',
      content: '''Know the difference between real and fake emergencies:''',
      bullets: [
        BulletPoint(
          icon: '✅',
          title: 'Real: Job Loss',
          description: 'Covers expenses while you find new work.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'Real: Medical Bills',
          description: 'Unexpected health expenses.',
        ),
        BulletPoint(
          icon: '❌',
          title: 'Fake: Big Sale',
          description: 'Sales are not emergencies!',
        ),
        BulletPoint(
          icon: '❌',
          title: 'Fake: New Phone',
          description: 'Wanting something new is not an emergency.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Emergency Check',
      imagePath: 'assets/images/lessons/day3/lesson3/game1.png',
      imagePrompt:
          'cartoon emergency siren and question mark, real vs fake emergency decision, game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which is a REAL emergency worth using your fund?',
        options: [
          GameOption(
            label: '50% off sale on electronics',
            emoji: '🏷️',
          ),
          GameOption(
            label: 'Unexpected car repair needed for work',
            emoji: '🔧',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find the Safe Amount!',
      imagePath: 'assets/images/lessons/day3/lesson3/game2.png',
      imagePrompt:
          'cartoon treasure chests with different emergency fund sizes, one glowing as correct target, adventure style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'How much should your emergency fund cover?',
        options: [
          GameOption(
            label: '1 week of expenses',
            emoji: '📅',
          ),
          GameOption(
            label: '3-6 months of expenses',
            emoji: '🛡️',
          ),
          GameOption(
            label: '10 years of expenses',
            emoji: '📆',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day3/lesson3/question.png',
      imagePrompt:
          'cartoon piggy bank with shield emblem, emergency fund quiz atmosphere',
      questionData: QuestionData(
        question: 'Where should you keep your emergency fund?',
        options: [
          'Under your mattress',
          'In risky investments',
          'In an accessible savings account',
          'In your wallet',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Shield Mission',
      imagePath: 'assets/images/lessons/day3/lesson3/mission.png',
      imagePrompt:
          'cartoon character building shield brick by brick, steady progress visualization, protective style',
      missionData: MissionData(
        mission: 'What is the FIRST step to building an emergency fund?',
        options: [
          'Wait until you earn more money',
          'Start with a small amount, like one month expenses',
          'Borrow money to create it',
          'Skip it and invest instead',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Shield Builder',
        badgeIcon: '🛡️',
      ),
    ),
  ],
);
