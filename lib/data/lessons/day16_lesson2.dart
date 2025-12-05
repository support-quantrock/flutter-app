import '../../models/lesson_models.dart';

final day16Lesson2 = LessonData(
  day: 16,
  title: "Growth Investing",
  emoji: '🚀',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Riding the Rocket',
      imagePath: 'assets/images/lessons/day16/lesson2/story.png',
      imagePrompt: 'cartoon growth stock as rocket ship launching upward, fast-growing company',
      content: '''Growth investing bets on fast-growing companies.

These stocks often look expensive but grow into their value.

Think early Amazon, Google, or Tesla!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Growth Investing Basics',
      imagePath: 'assets/images/lessons/day16/lesson2/content1.png',
      imagePrompt: 'cartoon growth stock characteristics: rising revenue, expanding market, innovation',
      content: '''What growth investors look for:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Revenue Growth', description: 'Sales increasing 20%+ yearly.'),
        BulletPoint(icon: '🌍', title: 'Market Expansion', description: 'Growing into new markets.'),
        BulletPoint(icon: '💡', title: 'Innovation', description: 'Disrupting industries.'),
        BulletPoint(icon: '🏆', title: 'Market Leader', description: 'Dominant in their space.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Growth vs Value',
      imagePath: 'assets/images/lessons/day16/lesson2/content2.png',
      imagePrompt: 'cartoon growth vs value comparison: high P/E fast growth vs low P/E stable',
      content: '''How growth differs from value:''',
      bullets: [
        BulletPoint(icon: '💹', title: 'Higher P/E', description: 'Growth stocks often expensive.'),
        BulletPoint(icon: '📊', title: 'Future Focused', description: 'Pay for future potential.'),
        BulletPoint(icon: '💸', title: 'Low Dividends', description: 'Reinvest profits for growth.'),
        BulletPoint(icon: '⚡', title: 'More Volatile', description: 'Bigger swings up and down.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Growth Check',
      imagePath: 'assets/images/lessons/day16/lesson2/game1.png',
      imagePrompt: 'cartoon growth stock characteristics',
      gameData: GameData(
        type: 'choice',
        instruction: 'Growth stocks typically have:',
        options: [GameOption(label: 'Low P/E and slow growth', emoji: '🐢'), GameOption(label: 'High P/E and fast revenue growth', emoji: '🚀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Dividend Pop',
      imagePath: 'assets/images/lessons/day16/lesson2/game2.png',
      imagePrompt: 'cartoon growth stock dividend policy',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Growth companies usually pay:',
        options: [GameOption(label: 'High dividends', emoji: '💰'), GameOption(label: 'Low or no dividends', emoji: '📉'), GameOption(label: 'Only in Bitcoin', emoji: '₿')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day16/lesson2/question.png',
      imagePrompt: 'cartoon growth stock volatility',
      questionData: QuestionData(
        question: 'Growth stocks tend to be:',
        options: ['Very stable', 'More volatile', 'Risk-free', 'Always profitable'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Growth Mission',
      imagePath: 'assets/images/lessons/day16/lesson2/mission.png',
      imagePrompt: 'cartoon growth company reinvesting profits',
      missionData: MissionData(
        mission: 'Why do growth companies pay low dividends?',
        options: ['They are failing', 'They reinvest profits for more growth', 'Dividends are illegal', 'No reason'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Growth Hunter', badgeIcon: '🚀')),
  ],
);
