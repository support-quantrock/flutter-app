import '../../models/lesson_models.dart';

final day3Lesson1 = LessonData(
  day: 3,
  title: "The Money Flow",
  emoji: '💵',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Where Does Money Go?',
      imagePath: 'assets/images/lessons/day3/lesson1/story.png',
      imagePrompt:
          'cartoon river of money flowing through different channels: income waterfall, expense drains, savings lake, investment garden, colorful financial flow visualization',
      content:
          '''Money flows in and out of your life like a river.

Understanding this flow is the first step to controlling your financial future.

Let me show you how money really works!''',
    ),

    // Screen 2: Content - Income
    const LessonScreen(
      type: ScreenType.content,
      title: 'Money Coming In',
      imagePath: 'assets/images/lessons/day3/lesson1/content1.png',
      imagePrompt:
          'cartoon multiple income streams flowing into a bucket: salary, side jobs, investments, bright positive educational style',
      content: '''Income is all the money that comes to you.

There are different types:''',
      bullets: [
        BulletPoint(
          icon: '💼',
          title: 'Active Income',
          description: 'Money you earn by working (salary, wages, freelance).',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Passive Income',
          description: 'Money that comes without daily work (investments, rentals).',
        ),
        BulletPoint(
          icon: '🎁',
          title: 'Other Income',
          description: 'Bonuses, gifts, tax refunds, side projects.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Goal',
          description: 'Grow your income over time, especially passive income.',
        ),
      ],
    ),

    // Screen 3: Content - Expenses
    const LessonScreen(
      type: ScreenType.content,
      title: 'Money Going Out',
      imagePath: 'assets/images/lessons/day3/lesson1/content2.png',
      imagePrompt:
          'cartoon money bucket with different drains labeled needs, wants, and waste, some drains bigger than others, educational style',
      content: '''Expenses are where your money goes.

Not all expenses are equal:''',
      bullets: [
        BulletPoint(
          icon: '🏠',
          title: 'Needs',
          description: 'Essential expenses: housing, food, utilities, healthcare.',
        ),
        BulletPoint(
          icon: '🎮',
          title: 'Wants',
          description: 'Nice to have: entertainment, dining out, hobbies.',
        ),
        BulletPoint(
          icon: '🗑️',
          title: 'Waste',
          description: 'Money spent without thinking or value received.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'Warning',
          description: 'Most people spend too much on wants and waste.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Need or Want?',
      imagePath: 'assets/images/lessons/day3/lesson1/game1.png',
      imagePrompt:
          'cartoon items floating: food basket vs designer shoes, rent receipt vs concert ticket, decision game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which is a NEED, not a want?',
        options: [
          GameOption(
            label: 'Latest smartphone upgrade',
            emoji: '📱',
          ),
          GameOption(
            label: 'Basic groceries for the week',
            emoji: '🥗',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Waste!',
      imagePath: 'assets/images/lessons/day3/lesson1/game2.png',
      imagePrompt:
          'cartoon balloons with different expenses: rent, impulse buy, groceries, subscription never used, colorful game style',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which expense is likely WASTE?',
        options: [
          GameOption(
            label: 'Monthly rent payment',
            emoji: '🏠',
          ),
          GameOption(
            label: 'Subscription you never use',
            emoji: '📺',
          ),
          GameOption(
            label: 'Electricity bill',
            emoji: '💡',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day3/lesson1/question.png',
      imagePrompt:
          'cartoon money flow diagram with question marks, income and expense arrows, educational quiz style',
      questionData: QuestionData(
        question: 'What is the formula for building wealth?',
        options: [
          'Spend everything you earn',
          'Income minus expenses equals savings',
          'Borrow more money',
          'Ignore your expenses',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Flow Mission',
      imagePath: 'assets/images/lessons/day3/lesson1/mission.png',
      imagePrompt:
          'cartoon character examining their money flow with magnifying glass, detective style financial review',
      missionData: MissionData(
        mission: 'What is the FIRST step to controlling your money flow?',
        options: [
          'Earn more money immediately',
          'Track where your money actually goes',
          'Cut all spending to zero',
          'Ignore small expenses',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Flow Tracker',
        badgeIcon: '💵',
      ),
    ),
  ],
);
