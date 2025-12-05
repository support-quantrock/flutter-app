import '../../models/lesson_models.dart';

final day1Lesson4 = LessonData(
  day: 1,
  title: "Navigating the App",
  emoji: '🧭',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Navigation Guide',
      imagePath: 'assets/images/lessons/day1/lesson4/story.png',
      imagePrompt:
          'cartoon friendly guide character holding glowing compass, showing different app sections floating around like magical portals, colorful tutorial style',
      content:
          '''Let me show you around Quantrook!

Knowing where everything is will help you learn faster and have more fun.

Each section has special tools to help you become a better investor!''',
    ),

    // Screen 2: Content - Main Sections
    const LessonScreen(
      type: ScreenType.content,
      title: 'App Sections',
      imagePath: 'assets/images/lessons/day1/lesson4/content1.png',
      imagePrompt:
          'cartoon app interface showing five main sections with icons: AI brain, crystal ball, tracker chart, trophy challenge, portfolio bag, bright UI style',
      content: '''Quantrook has five main sections to explore:''',
      bullets: [
        BulletPoint(
          icon: '🤖',
          title: 'AI Picks',
          description: 'Smart investment recommendations powered by artificial intelligence.',
        ),
        BulletPoint(
          icon: '🔮',
          title: 'Forecast',
          description: 'Market predictions and trend analysis.',
        ),
        BulletPoint(
          icon: '📊',
          title: 'Tracker',
          description: 'Follow your investments and watchlist.',
        ),
        BulletPoint(
          icon: '🏆',
          title: 'Challenge',
          description: 'Your 28-day learning journey lives here!',
        ),
      ],
    ),

    // Screen 3: Content - Challenge Section
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Challenge Section',
      imagePath: 'assets/images/lessons/day1/lesson4/content2.png',
      imagePrompt:
          'cartoon detailed view of challenge section with daily lessons, progress bars, badges collection, and rewards, gamified UI style',
      content: '''The Challenge section is where you will spend most of your time learning.

Here is what you will find:''',
      bullets: [
        BulletPoint(
          icon: '📅',
          title: 'Daily Lessons',
          description: 'Access each day\'s five lessons and test.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Progress Tracker',
          description: 'See how far you have come in your journey.',
        ),
        BulletPoint(
          icon: '🎖️',
          title: 'Badge Collection',
          description: 'View all the badges you have earned.',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Coin Balance',
          description: 'Track your reward coins.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find the Feature',
      imagePath: 'assets/images/lessons/day1/lesson4/game1.png',
      imagePrompt:
          'cartoon app sections displayed as doors, character choosing which to enter for learning, colorful game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Where do you go to complete your daily lessons?',
        options: [
          GameOption(
            label: 'AI Picks section',
            emoji: '🤖',
          ),
          GameOption(
            label: 'Challenge section',
            emoji: '🏆',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Right One!',
      imagePath: 'assets/images/lessons/day1/lesson4/game2.png',
      imagePrompt:
          'cartoon balloons with different app features written on them, floating in colorful space, game atmosphere',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which section shows market predictions?',
        options: [
          GameOption(
            label: 'Tracker',
            emoji: '📊',
          ),
          GameOption(
            label: 'Forecast',
            emoji: '🔮',
          ),
          GameOption(
            label: 'Challenge',
            emoji: '🏆',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day1/lesson4/question.png',
      imagePrompt:
          'cartoon character looking at coin balance display, question marks floating, educational quiz style',
      questionData: QuestionData(
        question: 'What can you track in the Challenge section?',
        options: [
          'Weather updates',
          'Your badges and coins',
          'Social media posts',
          'Food delivery',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Navigation Mission',
      imagePath: 'assets/images/lessons/day1/lesson4/mission.png',
      imagePrompt:
          'cartoon character with map exploring app features, treasure locations marked, adventure style',
      missionData: MissionData(
        mission: 'What should you do to get the most out of Quantrook?',
        options: [
          'Only use one section',
          'Explore all sections and features',
          'Skip the tutorials',
          'Never check your progress',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 7,
        badgeName: 'Navigator',
        badgeIcon: '🧭',
      ),
    ),
  ],
);
