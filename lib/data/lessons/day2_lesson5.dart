import '../../models/lesson_models.dart';

final day2Lesson5 = LessonData(
  day: 2,
  title: "The Power of Compounding",
  emoji: '🌳',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Magic of Growth',
      imagePath: 'assets/images/lessons/day2/lesson5/story.png',
      imagePrompt:
          'cartoon tiny seed being planted, growing into massive money tree over time, magical transformation sequence, inspiring educational style',
      content:
          '''Einstein called it the eighth wonder of the world: compound interest.

Small amounts, given time, become fortunes.

This is the most powerful force in investing!''',
    ),

    // Screen 2: Content - What is Compounding
    const LessonScreen(
      type: ScreenType.content,
      title: 'What is Compounding?',
      imagePath: 'assets/images/lessons/day2/lesson5/content1.png',
      imagePrompt:
          'cartoon snowball rolling downhill getting bigger, coins multiplying exponentially, visual compounding explanation, educational style',
      content: '''Compounding is when your money earns money, and that money earns more money.

It is like a snowball rolling downhill.''',
      bullets: [
        BulletPoint(
          icon: '💰',
          title: 'Year 1',
          description: 'You invest \$100, earn 10% = \$110',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Year 2',
          description: '\$110 earns 10% = \$121 (not just \$120!)',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Year 10',
          description: '\$100 becomes \$259 without adding more!',
        ),
        BulletPoint(
          icon: '🚀',
          title: 'Year 30',
          description: '\$100 becomes \$1,745! That is the power!',
        ),
      ],
    ),

    // Screen 3: Content - Keys to Compounding
    const LessonScreen(
      type: ScreenType.content,
      title: 'Keys to Compounding',
      imagePath: 'assets/images/lessons/day2/lesson5/content2.png',
      imagePrompt:
          'cartoon three golden keys: start early, be consistent, be patient, unlocking treasure chest of wealth, educational style',
      content: '''Three things make compounding work:''',
      bullets: [
        BulletPoint(
          icon: '⏰',
          title: 'Start Early',
          description: 'Time is your biggest advantage. Every year counts.',
        ),
        BulletPoint(
          icon: '🔄',
          title: 'Be Consistent',
          description: 'Regular small investments beat random large ones.',
        ),
        BulletPoint(
          icon: '🧘',
          title: 'Be Patient',
          description: 'The magic happens in later years. Do not quit early.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Reinvest',
          description: 'Let your earnings earn more. Do not withdraw.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Compounding Race',
      imagePath: 'assets/images/lessons/day2/lesson5/game1.png',
      imagePrompt:
          'cartoon two characters: one starting at 20, other at 30, racing to retirement wealth, time advantage visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'Who ends up with MORE money at 60?',
        options: [
          GameOption(
            label: 'Starts at 20, invests for 40 years',
            emoji: '🏆',
          ),
          GameOption(
            label: 'Starts at 30, invests for 30 years',
            emoji: '🥈',
          ),
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find the Secret!',
      imagePath: 'assets/images/lessons/day2/lesson5/game2.png',
      imagePrompt:
          'cartoon three treasure chests with different investing approaches, one glowing with compounding power, adventure style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which approach builds the MOST wealth?',
        options: [
          GameOption(
            label: 'Save cash under mattress',
            emoji: '🛏️',
          ),
          GameOption(
            label: 'Invest and let it compound',
            emoji: '🌳',
          ),
          GameOption(
            label: 'Spend everything now',
            emoji: '🛍️',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson5/question.png',
      imagePrompt:
          'cartoon exponential growth chart with question marks, compounding quiz atmosphere',
      questionData: QuestionData(
        question: 'What makes compounding more powerful?',
        options: [
          'Withdrawing profits regularly',
          'Starting late with more money',
          'Starting early and being patient',
          'Checking prices daily',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Compound Mission',
      imagePath: 'assets/images/lessons/day2/lesson5/mission.png',
      imagePrompt:
          'cartoon character planting money seeds in garden of wealth, patient farming approach, long-term vision style',
      missionData: MissionData(
        mission: 'What is the best way to use compounding?',
        options: [
          'Wait until you have a lot of money',
          'Start small now and be consistent',
          'Only invest once a year',
          'Take out profits every month',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Compound Master',
        badgeIcon: '🌳',
      ),
    ),
  ],
);
