import '../../models/lesson_models.dart';

final day5Lesson1 = LessonData(
  day: 5,
  title: "What Are Commodities?",
  emoji: '🌾',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Real Stuff',
      imagePath: 'assets/images/lessons/day5/lesson1/story.png',
      imagePrompt:
          'cartoon warehouse filled with gold bars, oil barrels, wheat bags, and metal ingots, physical goods investment visualization',
      content:
          '''Unlike stocks and bonds, commodities are REAL, physical things you can touch.

Gold, oil, wheat, coffee - these are the raw materials that power our world.

And yes, you can invest in them too!''',
    ),

    // Screen 2: Content - What Are Commodities
    const LessonScreen(
      type: ScreenType.content,
      title: 'Physical Assets',
      imagePath: 'assets/images/lessons/day5/lesson1/content1.png',
      imagePrompt:
          'cartoon variety of commodities: gold coins, oil drum, corn stalk, copper wire, all glowing, educational style',
      content: '''Commodities are basic goods used to produce other things.

They are the building blocks of the economy!''',
      bullets: [
        BulletPoint(
          icon: '🥇',
          title: 'Precious Metals',
          description: 'Gold, silver, platinum - valuable and rare.',
        ),
        BulletPoint(
          icon: '⛽',
          title: 'Energy',
          description: 'Oil, natural gas, coal - powers everything.',
        ),
        BulletPoint(
          icon: '🌾',
          title: 'Agriculture',
          description: 'Wheat, corn, coffee, sugar - feeds the world.',
        ),
        BulletPoint(
          icon: '🔩',
          title: 'Industrial Metals',
          description: 'Copper, aluminum, steel - builds our cities.',
        ),
      ],
    ),

    // Screen 3: Content - Why Invest
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Invest in Commodities?',
      imagePath: 'assets/images/lessons/day5/lesson1/content2.png',
      imagePrompt:
          'cartoon shield made of gold protecting portfolio from inflation fire, diversification visualization, educational style',
      content: '''Commodities offer unique benefits:''',
      bullets: [
        BulletPoint(
          icon: '🛡️',
          title: 'Inflation Protection',
          description: 'When prices rise, commodities often rise too.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Diversification',
          description: 'They often move differently than stocks.',
        ),
        BulletPoint(
          icon: '🌍',
          title: 'Global Demand',
          description: 'The world always needs raw materials.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'Volatility',
          description: 'Prices can swing wildly based on supply/demand.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Commodity Check',
      imagePath: 'assets/images/lessons/day5/lesson1/game1.png',
      imagePrompt:
          'cartoon items floating: gold bar, Apple stock certificate, oil barrel, which is commodity, educational game',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which of these is a COMMODITY?',
        options: [
          GameOption(
            label: 'Apple stock',
            emoji: '📱',
          ),
          GameOption(
            label: 'Gold bars',
            emoji: '🥇',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Commodity!',
      imagePath: 'assets/images/lessons/day5/lesson1/game2.png',
      imagePrompt:
          'cartoon balloons with different investment types, some commodities some not, colorful game',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which is an ENERGY commodity?',
        options: [
          GameOption(
            label: 'Wheat',
            emoji: '🌾',
          ),
          GameOption(
            label: 'Crude Oil',
            emoji: '🛢️',
          ),
          GameOption(
            label: 'Company bonds',
            emoji: '📜',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day5/lesson1/question.png',
      imagePrompt:
          'cartoon commodities with question marks, quiz atmosphere',
      questionData: QuestionData(
        question: 'Why might commodities protect against inflation?',
        options: [
          'They are always cheap',
          'Their prices often rise with general price levels',
          'The government guarantees them',
          'They are risk-free',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Commodity Mission',
      imagePath: 'assets/images/lessons/day5/lesson1/mission.png',
      imagePrompt:
          'cartoon investor examining different commodity categories, exploration visualization',
      missionData: MissionData(
        mission: 'What makes commodities different from stocks?',
        options: [
          'Commodities are imaginary',
          'Commodities are physical goods, stocks are company ownership',
          'Stocks are physical goods',
          'There is no difference',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Commodity Novice',
        badgeIcon: '🌾',
      ),
    ),
  ],
);
