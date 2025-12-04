import '../../models/lesson_models.dart';

final day2Lesson5 = LessonData(
  day: 2,
  title: "The Power of Compounding (Small Steps → Big Wealth)",
  emoji: '🌳',
  screens: [
    // Screen 1: Story - "The Tiny Coin That Grew"
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Tiny Coin That Grew',
      imagePath: 'assets/images/lessons/day2/lesson5/story.png',
      videoPath: 'https://drive.usercontent.google.com/download?id=1-F24tBHi8c-xTfVPT9LcplyubTss4Kox&export=download',
      imagePrompt:
          'cartoon tiny smiling coin planting itself in soil and growing into a glowing money tree, magical meadow background, cute educational style',
      content: '',
    ),

    // Screen 2: Game - What Is Compounding?
    const LessonScreen(
      type: ScreenType.game,
      title: 'What Is Compounding?',
      imagePath: 'assets/images/lessons/day2/lesson5/game1_compounding.png',
      imagePrompt:
          'cartoon snowball rolling down a hill growing bigger representing compounding, cute colorful educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'How does compounding work?',
        options: [
          GameOption(
            label: 'Money stays the same forever',
            emoji: '😐',
          ),
          GameOption(
            label: 'Money earns money, and that earns more',
            emoji: '❄️',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 3: Game - Why Small Steps Matter
    const LessonScreen(
      type: ScreenType.game,
      title: 'Why Small Steps Matter',
      imagePath: 'assets/images/lessons/day2/lesson5/game2_small_steps.png',
      imagePrompt:
          'cartoon small coins stacking gradually into a tall shining tower, symbolizing compounding and small steps, cute educational art style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What do small, regular investments do?',
        options: [
          GameOption(
            label: 'Nothing, they are too small',
            emoji: '🤷',
          ),
          GameOption(
            label: 'Build habits and multiply over time',
            emoji: '📈',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 4: Game - Time: The Secret Ingredient
    const LessonScreen(
      type: ScreenType.game,
      title: 'Time: The Secret Ingredient',
      imagePath: 'assets/images/lessons/day2/lesson5/game3_time.png',
      imagePrompt:
          'cartoon hourglass where sand is tiny coins falling and turning into a growing money tree, cute soft educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Investor A starts at 20, Investor B at 30. Who ends up with more?',
        options: [
          GameOption(
            label: 'Investor A (started earlier)',
            emoji: '🏆',
          ),
          GameOption(
            label: 'Both end up the same',
            emoji: '🤝',
          ),
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 5: Game - Choose the Compounding Winner
    const LessonScreen(
      type: ScreenType.game,
      title: 'Choose the Compounding Winner',
      imagePath: 'assets/images/lessons/day2/lesson5/game4_winner.png',
      imagePrompt:
          'cartoon two characters: one investing small amounts regularly and money growing, the other saving cash but no growth, cute educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Who grows wealth faster?',
        options: [
          GameOption(
            label: 'Invests \$10 every week',
            emoji: '💰',
          ),
          GameOption(
            label: 'Saves \$100 but never invests',
            emoji: '🏦',
          ),
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 6: Question - Multiple Choice
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson5/question.png',
      imagePrompt:
          'cartoon steady upward compounding chart with a happy character pointing at it, cute educational style',
      questionData: QuestionData(
        question: 'What makes compounding MORE powerful?',
        options: [
          'Starting late',
          'Only investing one time',
          'Starting early and being consistent',
          'Relying on luck',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 7: Mission - Compounding Challenge
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Your Mission',
      imagePath: 'assets/images/lessons/day2/lesson5/mission.png',
      imagePrompt:
          'cartoon character placing small coins into a glowing jar labeled Compounding, cute simple educational style',
      missionData: MissionData(
        mission: 'Which action will help you start compounding TODAY?',
        options: [
          'Invest a small amount regularly',
          'Wait until you have a lot of money',
          'Spend first, save later',
          'Check the price every hour',
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 7,
        badgeName: 'Compound Master',
        badgeIcon: '🌳',
      ),
    ),
  ],
);
