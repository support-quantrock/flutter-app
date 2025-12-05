import '../../models/lesson_models.dart';

final day5Lesson3 = LessonData(
  day: 5,
  title: "Silver & Precious Metals",
  emoji: '🥈',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Beyond Gold',
      imagePath: 'assets/images/lessons/day5/lesson3/story.png',
      imagePrompt:
          'cartoon silver platinum palladium metals displayed like jewels in museum, each with special glow, precious metals gallery',
      content:
          '''Gold is not the only precious metal worth knowing about.

Silver, platinum, and palladium each have their own story.

Let me introduce you to gold lesser-known cousins!''',
    ),

    // Screen 2: Content - Silver
    const LessonScreen(
      type: ScreenType.content,
      title: 'Silver: The Dual Metal',
      imagePath: 'assets/images/lessons/day5/lesson3/content1.png',
      imagePrompt:
          'cartoon silver being used in both jewelry and electronics, dual purpose visualization, educational style',
      content: '''Silver is unique because it has two roles:''',
      bullets: [
        BulletPoint(
          icon: '💎',
          title: 'Precious Metal',
          description: 'Used in jewelry and as a store of value like gold.',
        ),
        BulletPoint(
          icon: '⚡',
          title: 'Industrial Metal',
          description: 'Used in electronics, solar panels, and medicine.',
        ),
        BulletPoint(
          icon: '📊',
          title: 'More Volatile',
          description: 'Price swings more than gold.',
        ),
        BulletPoint(
          icon: '💰',
          title: 'More Affordable',
          description: 'Easier to buy in smaller amounts than gold.',
        ),
      ],
    ),

    // Screen 3: Content - Other Metals
    const LessonScreen(
      type: ScreenType.content,
      title: 'Platinum & Palladium',
      imagePath: 'assets/images/lessons/day5/lesson3/content2.png',
      imagePrompt:
          'cartoon platinum and palladium in car catalytic converter and jewelry, industrial precious metals, educational style',
      content: '''These metals are rarer than gold:''',
      bullets: [
        BulletPoint(
          icon: '🚗',
          title: 'Platinum',
          description: 'Used in cars, jewelry, and fuel cells. Very rare.',
        ),
        BulletPoint(
          icon: '🔧',
          title: 'Palladium',
          description: 'Essential for car catalytic converters.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Industrial Demand',
          description: 'Prices tied heavily to industrial use.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'Higher Risk',
          description: 'Less liquid and more volatile than gold.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Silver Check',
      imagePath: 'assets/images/lessons/day5/lesson3/game1.png',
      imagePrompt:
          'cartoon silver being used in solar panel vs jewelry, dual use visualization, educational game',
      gameData: GameData(
        type: 'choice',
        instruction: 'What makes silver DIFFERENT from gold?',
        options: [
          GameOption(
            label: 'Silver is only decorative',
            emoji: '💍',
          ),
          GameOption(
            label: 'Silver has both precious and industrial uses',
            emoji: '⚡',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Metal!',
      imagePath: 'assets/images/lessons/day5/lesson3/game2.png',
      imagePrompt:
          'cartoon balloons with different precious metals facts, colorful educational game',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which metal is heavily used in car catalytic converters?',
        options: [
          GameOption(
            label: 'Gold',
            emoji: '🥇',
          ),
          GameOption(
            label: 'Palladium',
            emoji: '🚗',
          ),
          GameOption(
            label: 'Copper',
            emoji: '🔶',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day5/lesson3/question.png',
      imagePrompt:
          'cartoon precious metals comparison chart, quiz atmosphere',
      questionData: QuestionData(
        question: 'Why is silver more volatile than gold?',
        options: [
          'Silver is heavier',
          'Silver demand depends on both industry AND investment',
          'Silver is more common',
          'Silver is always more valuable',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Precious Mission',
      imagePath: 'assets/images/lessons/day5/lesson3/mission.png',
      imagePrompt:
          'cartoon investor comparing precious metals for portfolio, selection process visualization',
      missionData: MissionData(
        mission: 'Why might an investor choose silver over gold?',
        options: [
          'Silver is guaranteed to go up',
          'Silver is more affordable and has growth potential',
          'Silver never loses value',
          'Gold is illegal',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Metal Expert',
        badgeIcon: '🥈',
      ),
    ),
  ],
);
