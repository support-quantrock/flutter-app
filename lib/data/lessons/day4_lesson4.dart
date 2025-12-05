import '../../models/lesson_models.dart';

final day4Lesson4 = LessonData(
  day: 4,
  title: "Options & Futures Intro",
  emoji: '🎯',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Contracts for Tomorrow',
      imagePath: 'assets/images/lessons/day4/lesson4/story.png',
      imagePrompt:
          'cartoon time machine with financial contracts, buying rights to future prices, futuristic financial visualization',
      content:
          '''What if you could lock in a price today for something you will buy or sell in the future?

Options and futures let you do exactly that!

These are advanced tools, but understanding the basics is important.''',
    ),

    // Screen 2: Content - Options
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Are Options?',
      imagePath: 'assets/images/lessons/day4/lesson4/content1.png',
      imagePrompt:
          'cartoon key that gives the right but not obligation to buy a house at set price, choice visualization, educational style',
      content: '''An option gives you the RIGHT (but not obligation) to buy or sell at a set price.''',
      bullets: [
        BulletPoint(
          icon: '📞',
          title: 'Call Option',
          description: 'The right to BUY something at a set price.',
        ),
        BulletPoint(
          icon: '📤',
          title: 'Put Option',
          description: 'The right to SELL something at a set price.',
        ),
        BulletPoint(
          icon: '💵',
          title: 'Premium',
          description: 'The price you pay for the option.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'Complex',
          description: 'Options are advanced. Learn more before using.',
        ),
      ],
    ),

    // Screen 3: Content - Futures
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Are Futures?',
      imagePath: 'assets/images/lessons/day4/lesson4/content2.png',
      imagePrompt:
          'cartoon farmer shaking hands with buyer agreeing on future wheat price, contract locking in price, simple futures visualization',
      content: '''A future is a CONTRACT to buy or sell something at a set price on a future date.''',
      bullets: [
        BulletPoint(
          icon: '📝',
          title: 'Binding Contract',
          description: 'Unlike options, you MUST complete the trade.',
        ),
        BulletPoint(
          icon: '🛢️',
          title: 'Common Uses',
          description: 'Oil, gold, crops, currencies.',
        ),
        BulletPoint(
          icon: '🛡️',
          title: 'Hedging',
          description: 'Companies use them to protect against price changes.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'High Risk',
          description: 'Futures can be very risky for beginners.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Option Check',
      imagePath: 'assets/images/lessons/day4/lesson4/game1.png',
      imagePrompt:
          'cartoon call option vs put option comparison, buying vs selling rights, educational game',
      gameData: GameData(
        type: 'choice',
        instruction: 'A CALL option gives you the right to:',
        options: [
          GameOption(
            label: 'Sell something at a set price',
            emoji: '📤',
          ),
          GameOption(
            label: 'Buy something at a set price',
            emoji: '📥',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Difference!',
      imagePath: 'assets/images/lessons/day4/lesson4/game2.png',
      imagePrompt:
          'cartoon balloons with options vs futures characteristics, colorful educational comparison game',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What is the KEY difference between options and futures?',
        options: [
          GameOption(
            label: 'Options are free',
            emoji: '🆓',
          ),
          GameOption(
            label: 'Options give choice, futures are obligations',
            emoji: '⚖️',
          ),
          GameOption(
            label: 'Futures are always safer',
            emoji: '🛡️',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day4/lesson4/question.png',
      imagePrompt:
          'cartoon futures contract document, quiz atmosphere',
      questionData: QuestionData(
        question: 'When you enter a futures contract:',
        options: [
          'You can decide later if you want to complete it',
          'You MUST complete the trade on the set date',
          'You get free shares',
          'Nothing happens until you sell',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Derivatives Mission',
      imagePath: 'assets/images/lessons/day4/lesson4/mission.png',
      imagePrompt:
          'cartoon warning sign with advanced tools, proceed with caution visualization',
      missionData: MissionData(
        mission: 'What should beginners know about options and futures?',
        options: [
          'They are easy ways to get rich quick',
          'They are advanced tools - learn thoroughly before using',
          'Everyone should start with futures',
          'They have no risks',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 9,
        badgeName: 'Derivatives Aware',
        badgeIcon: '🎯',
      ),
    ),
  ],
);
