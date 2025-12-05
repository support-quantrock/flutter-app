import '../../models/lesson_models.dart';

final day1Lesson1 = LessonData(
  day: 1,
  title: "Welcome to Quantrook",
  emoji: '🚀',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Journey Begins',
      imagePath: 'assets/images/lessons/day1/lesson1/story.png',
      imagePrompt:
          'cartoon young explorer standing at the entrance of a magical financial kingdom, glowing path ahead with coins and charts floating, bright welcoming colors, cute educational style',
      content:
          '''Welcome to Quantrook, your gateway to becoming a smart investor!

Today marks the beginning of an exciting 28-day journey that will transform how you think about money.

Are you ready to unlock the secrets of investing?''',
    ),

    // Screen 2: Content - What is Quantrook
    const LessonScreen(
      type: ScreenType.content,
      title: 'What is Quantrook?',
      imagePath: 'assets/images/lessons/day1/lesson1/content1.png',
      imagePrompt:
          'cartoon friendly robot assistant holding a glowing tablet showing investment charts, surrounded by floating icons of stocks bonds and coins, bright educational style',
      content: '''Quantrook is your personal investment learning companion.

Think of it as a smart friend who helps you understand money and investing.''',
      bullets: [
        BulletPoint(
          icon: '🎯',
          title: 'Learn by Doing',
          description: 'Interactive lessons that make investing fun and easy to understand.',
        ),
        BulletPoint(
          icon: '🎮',
          title: 'Gamified Experience',
          description: 'Earn coins, badges, and rewards as you master new skills.',
        ),
        BulletPoint(
          icon: '📊',
          title: 'Real Knowledge',
          description: 'Learn what professional investors know, explained simply.',
        ),
        BulletPoint(
          icon: '🌟',
          title: 'Your Pace',
          description: 'Complete lessons at your own speed, no pressure.',
        ),
      ],
    ),

    // Screen 3: Content - Why Learn Investing
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Learn Investing?',
      imagePath: 'assets/images/lessons/day1/lesson1/content2.png',
      imagePrompt:
          'cartoon split image showing person working hard for money vs money working for person while they relax, colorful educational comparison style',
      content: '''Money can work FOR you, not just the other way around.

Learning to invest is one of the most valuable skills you can develop.''',
      bullets: [
        BulletPoint(
          icon: '💰',
          title: 'Build Wealth',
          description: 'Turn small amounts into large sums over time.',
        ),
        BulletPoint(
          icon: '🛡️',
          title: 'Financial Security',
          description: 'Protect yourself and your family from money worries.',
        ),
        BulletPoint(
          icon: '🌴',
          title: 'Freedom',
          description: 'Create options and choices in your life.',
        ),
        BulletPoint(
          icon: '🎓',
          title: 'Knowledge is Power',
          description: 'Make smart decisions about your money.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Quick Choice',
      imagePath: 'assets/images/lessons/day1/lesson1/game1.png',
      imagePrompt:
          'cartoon two paths diverging, one with person working forever, other with money tree growing, bright colorful choice game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which is smarter for building wealth?',
        options: [
          GameOption(
            label: 'Work harder and harder forever',
            emoji: '😓',
          ),
          GameOption(
            label: 'Learn to make money work for you',
            emoji: '🧠',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Truth!',
      imagePath: 'assets/images/lessons/day1/lesson1/game2.png',
      imagePrompt:
          'cartoon colorful balloons floating with different money myths written on them, fun game atmosphere, bright educational style',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which statement is TRUE about investing?',
        options: [
          GameOption(
            label: 'Only rich people can invest',
            emoji: '🤑',
          ),
          GameOption(
            label: 'Anyone can start with small amounts',
            emoji: '✨',
          ),
          GameOption(
            label: 'Investing is just gambling',
            emoji: '🎰',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day1/lesson1/question.png',
      imagePrompt:
          'cartoon character with question mark above head, thinking pose, colorful educational quiz style',
      questionData: QuestionData(
        question: 'What is the main purpose of Quantrook?',
        options: [
          'To help you learn investing in a fun way',
          'To sell you financial products',
          'To replace your bank',
          'To manage your money automatically',
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Your First Mission',
      imagePath: 'assets/images/lessons/day1/lesson1/mission.png',
      imagePrompt:
          'cartoon character receiving a glowing scroll mission, treasure chest nearby, adventure game style, bright colors',
      missionData: MissionData(
        mission: 'What mindset will help you succeed in learning to invest?',
        options: [
          'Curious and open to learning',
          'Impatient for quick results',
          'Scared of making any mistakes',
          'Only caring about getting rich fast',
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Journey Starter',
        badgeIcon: '🚀',
      ),
    ),
  ],
);
