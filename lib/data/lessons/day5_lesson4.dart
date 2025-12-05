import '../../models/lesson_models.dart';

final day5Lesson4 = LessonData(
  day: 5,
  title: "Oil & Energy Markets",
  emoji: '🛢️',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The World Fuel',
      imagePath: 'assets/images/lessons/day5/lesson4/story.png',
      imagePrompt:
          'cartoon oil drop powering entire city, cars planes factories all connected to oil, energy lifeline visualization',
      content:
          '''Oil is called "black gold" for a reason.

It powers cars, planes, factories, and entire economies.

Understanding oil means understanding how the world works!''',
    ),

    // Screen 2: Content - Why Oil Matters
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Oil Matters',
      imagePath: 'assets/images/lessons/day5/lesson4/content1.png',
      imagePrompt:
          'cartoon world map with oil flowing through it like blood through veins, global importance visualization',
      content: '''Oil is the lifeblood of the global economy:''',
      bullets: [
        BulletPoint(
          icon: '🚗',
          title: 'Transportation',
          description: 'Powers most cars, trucks, ships, and planes.',
        ),
        BulletPoint(
          icon: '🏭',
          title: 'Manufacturing',
          description: 'Used to make plastics, chemicals, and more.',
        ),
        BulletPoint(
          icon: '⚡',
          title: 'Energy',
          description: 'Generates electricity in many countries.',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Economic Impact',
          description: 'Oil price changes affect everything.',
        ),
      ],
    ),

    // Screen 3: Content - What Moves Oil Prices
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Moves Oil Prices',
      imagePath: 'assets/images/lessons/day5/lesson4/content2.png',
      imagePrompt:
          'cartoon oil price on scale affected by OPEC decisions, war, economy, weather, multiple factors visualization',
      content: '''Oil prices are affected by many factors:''',
      bullets: [
        BulletPoint(
          icon: '🏛️',
          title: 'OPEC Decisions',
          description: 'Oil-producing countries can limit supply.',
        ),
        BulletPoint(
          icon: '⚔️',
          title: 'Geopolitics',
          description: 'Wars and conflicts in oil regions move prices.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Economic Growth',
          description: 'Growing economies use more oil.',
        ),
        BulletPoint(
          icon: '🌿',
          title: 'Green Energy',
          description: 'Shift to renewables affects long-term demand.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Oil Impact',
      imagePath: 'assets/images/lessons/day5/lesson4/game1.png',
      imagePrompt:
          'cartoon economy growing vs shrinking effect on oil demand, cause and effect visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'When the global economy grows, oil prices usually:',
        options: [
          GameOption(
            label: 'Fall because people save more',
            emoji: '📉',
          ),
          GameOption(
            label: 'Rise because demand increases',
            emoji: '📈',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Factor!',
      imagePath: 'assets/images/lessons/day5/lesson4/game2.png',
      imagePrompt:
          'cartoon balloons with factors that affect oil prices, colorful educational game',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which affects oil prices MOST?',
        options: [
          GameOption(
            label: 'Ice cream sales',
            emoji: '🍦',
          ),
          GameOption(
            label: 'OPEC production decisions',
            emoji: '🏛️',
          ),
          GameOption(
            label: 'Movie releases',
            emoji: '🎬',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day5/lesson4/question.png',
      imagePrompt:
          'cartoon OPEC meeting room, oil decisions, quiz atmosphere',
      questionData: QuestionData(
        question: 'What is OPEC?',
        options: [
          'A video game company',
          'Organization of oil-producing countries that coordinate supply',
          'A type of oil',
          'An environmental group',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Energy Mission',
      imagePath: 'assets/images/lessons/day5/lesson4/mission.png',
      imagePrompt:
          'cartoon investor watching oil news and geopolitical events, informed investing visualization',
      missionData: MissionData(
        mission: 'Why is oil called a "volatile" commodity?',
        options: [
          'It explodes easily',
          'Its price changes dramatically based on many global factors',
          'It is always stable',
          'It is not tradeable',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 9,
        badgeName: 'Energy Aware',
        badgeIcon: '🛢️',
      ),
    ),
  ],
);
