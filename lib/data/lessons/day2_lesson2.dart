import '../../models/lesson_models.dart';

final day2Lesson2 = LessonData(
  day: 2,
  title: "Value Over Price (The Investor's Vision)",
  emoji: '💎',
  screens: [
    // Screen 1: Story - "The Hall of Shiny Distractions"
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Hall of Shiny Distractions',
      imagePath: 'assets/images/lessons/day2/lesson2/story.png',
      videoPath: 'https://drive.usercontent.google.com/download?id=1f9khxZNgKJ07piugBRNbogTAdMKW3Tu2&export=download',
      imagePrompt:
          'cartoon treasure hall filled with shiny objects and glowing distractions, with a wise cartoon owl mentor pointing toward a golden treasure chest labeled VALUE, colorful educational style',
      content: '',
    ),

    // Screen 2: Game - Price vs Value
    const LessonScreen(
      type: ScreenType.game,
      title: 'Price vs Value',
      imagePath: 'assets/images/lessons/day2/lesson2/game1_price_value.png',
      imagePrompt:
          'cartoon split image showing price tag on flashy useless item vs glowing valuable item with VALUE label, soft educational colors',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which one has MORE value?',
        options: [
          GameOption(
            label: 'Diamond toy (\$100)',
            emoji: '💎',
          ),
          GameOption(
            label: 'Book that grows income (\$10)',
            emoji: '📚',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 3: Game - Value Is Hidden
    const LessonScreen(
      type: ScreenType.game,
      title: 'Value Is Hidden',
      imagePath: 'assets/images/lessons/day2/lesson2/game2_hidden_value.png',
      imagePrompt:
          'cartoon seed sprouting into a glowing money tree symbolizing hidden value, cute simple educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What does an INVESTOR see that a consumer doesn\'t?',
        options: [
          GameOption(
            label: 'Sparkle, Hype & Trends',
            emoji: '✨',
          ),
          GameOption(
            label: 'Potential, Growth & Stability',
            emoji: '🌱',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 4: Game - The Value Test
    const LessonScreen(
      type: ScreenType.game,
      title: 'The Value Test',
      imagePath: 'assets/images/lessons/day2/lesson2/game3_value_test.png',
      imagePrompt:
          'cartoon glowing checklist with boxes labeled long-term growth, helpful, future reward, cute educational notebook style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Before buying, which question reveals TRUE value?',
        options: [
          GameOption(
            label: 'Is it trendy right now?',
            emoji: '🔥',
          ),
          GameOption(
            label: 'Will future-me thank me?',
            emoji: '🎯',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Choose the True Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Choose the True Treasure',
      imagePath: 'assets/images/lessons/day2/lesson2/game4_treasure.png',
      imagePrompt:
          'cartoon treasure chests labeled price, hype, and value; the value chest glowing gold, colorful and playful educational game style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Three treasure chests appear! Tap the one with REAL value.',
        options: [
          GameOption(
            label: 'High Price!',
            emoji: '💰',
          ),
          GameOption(
            label: 'Trending Now!',
            emoji: '📈',
          ),
          GameOption(
            label: 'Real Value Inside',
            emoji: '🏆',
          ),
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 6: Question - Multiple Choice
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson2/question.png',
      imagePrompt:
          'cartoon comparison of trendy flashy object vs glowing valuable skill book, cute educational style',
      questionData: QuestionData(
        question: 'Which of the following has REAL value, not fake shine?',
        options: [
          'Fancy packaging',
          'A trending toy',
          'A skill that grows income',
          'A luxury logo',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 7: Mission - Value Check Challenge
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Your Mission',
      imagePath: 'assets/images/lessons/day2/lesson2/mission.png',
      imagePrompt:
          'cartoon character choosing between options on a glowing decision screen; the valuable option glowing brighter, cute educational art',
      missionData: MissionData(
        mission: 'Which of these behaviors helps you become a value-focused investor?',
        options: [
          'Asking "Will this grow my future?"',
          'Buying anything with a discount',
          'Following trends',
          'Choosing the most expensive item',
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Value Hunter',
        badgeIcon: '🎯',
      ),
    ),
  ],
);
