import '../../models/lesson_models.dart';

final day2Lesson1 = LessonData(
  day: 2,
  title: "Consumer vs Investor Mindset",
  emoji: '🧠',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Two Mindsets',
      imagePath: 'assets/images/lessons/day2/lesson1/story.png',
      imagePrompt:
          'cartoon split scene showing consumer spending money happily on one side, investor growing money tree on other side, colorful comparison style',
      content:
          '''There are two ways to think about money: like a consumer or like an investor.

Consumers spend money. Investors grow money.

Today you will learn the difference and why it matters for your future!''',
    ),

    // Screen 2: Content - Consumer Mindset
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Consumer Mindset',
      imagePath: 'assets/images/lessons/day2/lesson1/content1.png',
      imagePrompt:
          'cartoon character surrounded by shopping bags, impulse buys, instant gratification items, money flying away, colorful but cautionary style',
      content: '''The consumer mindset focuses on NOW.

It is driven by emotions and instant gratification.''',
      bullets: [
        BulletPoint(
          icon: '🛍️',
          title: 'Instant Gratification',
          description: 'Buys things immediately for temporary happiness.',
        ),
        BulletPoint(
          icon: '😰',
          title: 'Emotional Spending',
          description: 'Feels stressed? Buy something. Feels happy? Buy something.',
        ),
        BulletPoint(
          icon: '📉',
          title: 'Short-Term Thinking',
          description: 'Asks: What can I enjoy today?',
        ),
        BulletPoint(
          icon: '💸',
          title: 'Money Outflow',
          description: 'Money comes in and quickly goes out.',
        ),
      ],
    ),

    // Screen 3: Content - Investor Mindset
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Investor Mindset',
      imagePath: 'assets/images/lessons/day2/lesson1/content2.png',
      imagePrompt:
          'cartoon wise character calmly watching money tree grow, long-term vision chart in background, patient and strategic atmosphere, educational style',
      content: '''The investor mindset focuses on the FUTURE.

It is driven by logic and long-term growth.''',
      bullets: [
        BulletPoint(
          icon: '🌱',
          title: 'Delayed Gratification',
          description: 'Plants seeds today for a harvest tomorrow.',
        ),
        BulletPoint(
          icon: '🧠',
          title: 'Logical Decisions',
          description: 'Thinks before spending. Asks: Is this worth it?',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Long-Term Thinking',
          description: 'Asks: What will this become in 5 years?',
        ),
        BulletPoint(
          icon: '💰',
          title: 'Money Growth',
          description: 'Money comes in, gets invested, and multiplies.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Mindset Check',
      imagePath: 'assets/images/lessons/day2/lesson1/game1.png',
      imagePrompt:
          'cartoon two paths: one leading to empty wallet, other to growing wealth, character choosing direction, colorful decision style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which behavior shows an INVESTOR mindset?',
        options: [
          GameOption(
            label: 'Buy now, think later',
            emoji: '🛒',
          ),
          GameOption(
            label: 'Save first, spend what is left',
            emoji: '💎',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Consumer!',
      imagePath: 'assets/images/lessons/day2/lesson1/game2.png',
      imagePrompt:
          'cartoon colorful balloons with different spending behaviors written on them, fun game atmosphere',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which is a CONSUMER mindset behavior?',
        options: [
          GameOption(
            label: 'Planning purchases carefully',
            emoji: '📋',
          ),
          GameOption(
            label: 'Investing before spending',
            emoji: '📊',
          ),
          GameOption(
            label: 'Buying on impulse',
            emoji: '🛍️',
          ),
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson1/question.png',
      imagePrompt:
          'cartoon thinking character with thought bubbles showing short-term vs long-term, quiz atmosphere',
      questionData: QuestionData(
        question: 'What question does an INVESTOR ask?',
        options: [
          'What can I buy right now?',
          'What will this become over time?',
          'How can I impress others?',
          'What is trending today?',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Mindset Mission',
      imagePath: 'assets/images/lessons/day2/lesson1/mission.png',
      imagePrompt:
          'cartoon character at crossroads choosing between consumer path and investor path, epic decision moment, bright colors',
      missionData: MissionData(
        mission: 'What is the FIRST step to think like an investor?',
        options: [
          'Buy expensive things',
          'Follow what everyone else does',
          'Set aside money BEFORE spending',
          'Spend everything while you can',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Mindset Shifter',
        badgeIcon: '🧠',
      ),
    ),
  ],
);
