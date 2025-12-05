import '../../models/lesson_models.dart';

final day1Lesson3 = LessonData(
  day: 1,
  title: "The 28-Day Challenge",
  emoji: '🏆',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Challenge Awaits',
      imagePath: 'assets/images/lessons/day1/lesson3/story.png',
      imagePrompt:
          'cartoon treasure map showing 28 checkpoints leading to golden trophy, adventure path with coins and badges along the way, exciting game style',
      content:
          '''You are about to embark on a 28-day investment challenge!

Each day brings new knowledge, games, and rewards.

By the end, you will think and act like a professional investor!''',
    ),

    // Screen 2: Content - Challenge Overview
    const LessonScreen(
      type: ScreenType.content,
      title: 'How It Works',
      imagePath: 'assets/images/lessons/day1/lesson3/content1.png',
      imagePrompt:
          'cartoon calendar with 28 days highlighted, each day showing different financial icons, progress bar filling up, colorful educational style',
      content: '''The 28-Day Challenge is your path to investment mastery.

Here is what you will experience:''',
      bullets: [
        BulletPoint(
          icon: '📚',
          title: '5 Lessons Per Day',
          description: 'Short, focused lessons that build your knowledge step by step.',
        ),
        BulletPoint(
          icon: '🎮',
          title: 'Interactive Games',
          description: 'Fun challenges that test what you have learned.',
        ),
        BulletPoint(
          icon: '📝',
          title: 'Daily Test',
          description: 'Quick quiz to make sure you understood everything.',
        ),
        BulletPoint(
          icon: '🏅',
          title: 'Badges & Coins',
          description: 'Earn rewards for completing lessons and scoring well.',
        ),
      ],
    ),

    // Screen 3: Content - Topics Covered
    const LessonScreen(
      type: ScreenType.content,
      title: 'What You Will Learn',
      imagePath: 'assets/images/lessons/day1/lesson3/content2.png',
      imagePrompt:
          'cartoon brain expanding with financial knowledge icons: stocks, bonds, crypto, charts, globe, AI, all glowing, educational style',
      content: '''Over 28 days, you will master these topics:''',
      bullets: [
        BulletPoint(
          icon: '💭',
          title: 'Investor Mindset',
          description: 'How to think like successful investors.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Financial Markets',
          description: 'Stocks, bonds, forex, crypto, and more.',
        ),
        BulletPoint(
          icon: '🔍',
          title: 'Analysis Skills',
          description: 'Technical, fundamental, and quantitative analysis.',
        ),
        BulletPoint(
          icon: '🛡️',
          title: 'Risk Management',
          description: 'How to protect your investments.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Challenge Check',
      imagePath: 'assets/images/lessons/day1/lesson3/game1.png',
      imagePrompt:
          'cartoon two paths: one showing rushed chaotic learning, other showing steady 28-day structured path, colorful comparison style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Why is a 28-day structured challenge better than random learning?',
        options: [
          GameOption(
            label: 'It builds knowledge step by step',
            emoji: '📊',
          ),
          GameOption(
            label: 'It is faster to skip around',
            emoji: '⚡',
          ),
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find the Treasure!',
      imagePath: 'assets/images/lessons/day1/lesson3/game2.png',
      imagePrompt:
          'cartoon three treasure chests with different learning approaches written on them, one glowing gold, adventure game style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which approach leads to real investment knowledge?',
        options: [
          GameOption(
            label: 'Watch random videos',
            emoji: '📺',
          ),
          GameOption(
            label: 'Complete structured daily lessons',
            emoji: '🎯',
          ),
          GameOption(
            label: 'Only read news headlines',
            emoji: '📰',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day1/lesson3/question.png',
      imagePrompt:
          'cartoon character counting days on calendar with checkmarks, educational quiz atmosphere',
      questionData: QuestionData(
        question: 'How many lessons are there per day in the challenge?',
        options: [
          '3 lessons',
          '5 lessons',
          '10 lessons',
          '1 lesson',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Commitment Mission',
      imagePath: 'assets/images/lessons/day1/lesson3/mission.png',
      imagePrompt:
          'cartoon character making promise gesture with 28-day badge glowing, commitment and determination style',
      missionData: MissionData(
        mission: 'What is the best way to complete the 28-day challenge?',
        options: [
          'Do all lessons in one day',
          'Complete each day consistently',
          'Skip the hard topics',
          'Only do the games',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Challenge Accepted',
        badgeIcon: '🏆',
      ),
    ),
  ],
);
