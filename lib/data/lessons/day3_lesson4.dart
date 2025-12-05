import '../../models/lesson_models.dart';

final day3Lesson4 = LessonData(
  day: 3,
  title: "From Saving to Investing",
  emoji: '🌱',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Make Your Money Work',
      imagePath: 'assets/images/lessons/day3/lesson4/story.png',
      imagePrompt:
          'cartoon money coins sitting idle vs money coins planting seeds and growing into money trees, lazy money vs working money comparison, educational style',
      content:
          '''Saving is great, but saved money just sits there.

Investing makes your money work FOR you, even while you sleep!

Let us learn when and how to make the leap from saving to investing.''',
    ),

    // Screen 2: Content - Saving vs Investing
    const LessonScreen(
      type: ScreenType.content,
      title: 'Saving vs Investing',
      imagePath: 'assets/images/lessons/day3/lesson4/content1.png',
      imagePrompt:
          'cartoon comparison: savings account with small interest vs investment growing rapidly, side by side visualization',
      content: '''Saving and investing are both important, but different:''',
      bullets: [
        BulletPoint(
          icon: '🏦',
          title: 'Saving',
          description: 'Safe, low returns (1-2%), good for short-term goals.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Investing',
          description: 'Higher returns (7-10%+), some risk, for long-term goals.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'Inflation Risk',
          description: 'Savings lose value over time due to inflation.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'The Goal',
          description: 'Use both wisely based on your timeline.',
        ),
      ],
    ),

    // Screen 3: Content - When to Invest
    const LessonScreen(
      type: ScreenType.content,
      title: 'When to Start Investing',
      imagePath: 'assets/images/lessons/day3/lesson4/content2.png',
      imagePrompt:
          'cartoon checklist with requirements before investing: emergency fund check, debt check, starting capital check, ready to invest celebration',
      content: '''Before investing, make sure you have:''',
      bullets: [
        BulletPoint(
          icon: '✅',
          title: 'Emergency Fund',
          description: 'At least 3 months of expenses saved.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'High-Interest Debt Paid',
          description: 'Credit cards and bad debt cleared.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'Extra Money',
          description: 'Money you will not need for 5+ years.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'Basic Knowledge',
          description: 'Understanding of what you are investing in.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Ready to Invest?',
      imagePath: 'assets/images/lessons/day3/lesson4/game1.png',
      imagePrompt:
          'cartoon character at crossroads: save more path vs invest now path, decision checkpoint, educational game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'You have credit card debt at 20% interest. Should you:',
        options: [
          GameOption(
            label: 'Invest in stocks immediately',
            emoji: '📈',
          ),
          GameOption(
            label: 'Pay off the debt first',
            emoji: '💳',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Right Choice!',
      imagePath: 'assets/images/lessons/day3/lesson4/game2.png',
      imagePrompt:
          'cartoon balloons with different financial decisions, one correct path glowing, colorful game atmosphere',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What should you have BEFORE investing?',
        options: [
          GameOption(
            label: 'Lots of credit card debt',
            emoji: '💳',
          ),
          GameOption(
            label: 'An emergency fund',
            emoji: '🛡️',
          ),
          GameOption(
            label: 'Zero savings',
            emoji: '0️⃣',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day3/lesson4/question.png',
      imagePrompt:
          'cartoon savings vs investing comparison chart, quiz atmosphere, educational style',
      questionData: QuestionData(
        question: 'Why do investors earn more than savers long-term?',
        options: [
          'Banks charge savers fees',
          'Investments can grow faster than inflation',
          'Saving is illegal',
          'Investors are luckier',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Leap Mission',
      imagePath: 'assets/images/lessons/day3/lesson4/mission.png',
      imagePrompt:
          'cartoon character preparing to jump from saving island to investing island, bridge building visualization',
      missionData: MissionData(
        mission: 'What is the right order for financial success?',
        options: [
          'Invest → Save → Pay Debt',
          'Pay Debt → Emergency Fund → Invest',
          'Spend → Borrow → Hope',
          'Invest → Borrow → Spend',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 9,
        badgeName: 'Wealth Grower',
        badgeIcon: '🌱',
      ),
    ),
  ],
);
