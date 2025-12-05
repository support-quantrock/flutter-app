import '../../models/lesson_models.dart';

final day13Lesson2 = LessonData(
  day: 13,
  title: "P/E Ratio Explained",
  emoji: '💹',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Price to Earnings',
      imagePath: 'assets/images/lessons/day13/lesson2/story.png',
      imagePrompt: 'cartoon P/E ratio as price tag divided by earnings bag, valuation concept',
      content: '''P/E ratio is the most famous valuation metric.

It shows how much you pay for each dollar of earnings.

Lower P/E might mean better value - but not always!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding P/E',
      imagePath: 'assets/images/lessons/day13/lesson2/content1.png',
      imagePrompt: 'cartoon P/E calculation: stock price divided by earnings per share, with examples',
      content: '''How P/E ratio works:''',
      bullets: [
        BulletPoint(icon: '➗', title: 'Formula', description: 'Stock Price ÷ Earnings Per Share.'),
        BulletPoint(icon: '🔢', title: 'Example', description: '\$100 price ÷ \$5 EPS = P/E of 20.'),
        BulletPoint(icon: '⏰', title: 'Years to Payback', description: 'P/E 20 = 20 years of earnings to equal price.'),
        BulletPoint(icon: '📊', title: 'Compare', description: 'Compare to industry average.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'High vs Low P/E',
      imagePath: 'assets/images/lessons/day13/lesson2/content2.png',
      imagePrompt: 'cartoon high P/E growth rocket vs low P/E value treasure chest',
      content: '''What different P/E ratios mean:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'High P/E', description: 'Investors expect high growth.'),
        BulletPoint(icon: '📉', title: 'Low P/E', description: 'Might be undervalued or troubled.'),
        BulletPoint(icon: '🏭', title: 'Industry Matters', description: 'Tech has higher P/E than utilities.'),
        BulletPoint(icon: '⚠️', title: 'Not Perfect', description: 'Use with other metrics.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'P/E Check',
      imagePath: 'assets/images/lessons/day13/lesson2/game1.png',
      imagePrompt: 'cartoon P/E ratio calculation',
      gameData: GameData(
        type: 'choice',
        instruction: 'P/E ratio is calculated as:',
        options: [GameOption(label: 'Earnings ÷ Price', emoji: '➗'), GameOption(label: 'Price ÷ Earnings', emoji: '💹')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Meaning Pop',
      imagePath: 'assets/images/lessons/day13/lesson2/game2.png',
      imagePrompt: 'cartoon high P/E growth expectation',
      gameData: GameData(
        type: 'balloon',
        instruction: 'A HIGH P/E usually means investors expect:',
        options: [GameOption(label: 'Company is failing', emoji: '📉'), GameOption(label: 'High future growth', emoji: '🚀'), GameOption(label: 'Nothing special', emoji: '😐')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day13/lesson2/question.png',
      imagePrompt: 'cartoon comparing P/E ratios',
      questionData: QuestionData(
        question: 'When comparing P/E ratios, you should compare:',
        options: ['Any companies', 'Companies in similar industries', 'Only tech companies', 'Your favorite stocks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'P/E Mission',
      imagePath: 'assets/images/lessons/day13/lesson2/mission.png',
      imagePrompt: 'cartoon low P/E investigation',
      missionData: MissionData(
        mission: 'A low P/E stock could mean:',
        options: ['Always a good buy', 'Undervalued OR there are problems', 'Guaranteed profit', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'P/E Expert', badgeIcon: '💹')),
  ],
);
