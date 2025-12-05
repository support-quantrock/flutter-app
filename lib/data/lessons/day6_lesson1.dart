import '../../models/lesson_models.dart';

final day6Lesson1 = LessonData(
  day: 6,
  title: "What Is Forex?",
  emoji: '💱',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Biggest Market',
      imagePath: 'assets/images/lessons/day6/lesson1/story.png',
      imagePrompt: 'cartoon globe with currency symbols USD EUR JPY GBP swirling around it, massive trading volume visualization, colorful financial style',
      content: '''Welcome to the largest financial market in the world!

The foreign exchange market (Forex) trades over 6 TRILLION dollars every day.

That is more than all stock markets combined!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding Forex',
      imagePath: 'assets/images/lessons/day6/lesson1/content1.png',
      imagePrompt: 'cartoon traveler exchanging dollars for euros at airport, simple currency exchange visualization',
      content: '''Forex is simply exchanging one currency for another.''',
      bullets: [
        BulletPoint(icon: '💵', title: 'Currency Exchange', description: 'Trading one country money for another.'),
        BulletPoint(icon: '🌍', title: '24/5 Market', description: 'Open 24 hours, 5 days a week worldwide.'),
        BulletPoint(icon: '📊', title: 'Largest Market', description: 'Over \$6 trillion traded daily.'),
        BulletPoint(icon: '🏦', title: 'Key Players', description: 'Banks, governments, companies, and traders.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Forex Exists',
      imagePath: 'assets/images/lessons/day6/lesson1/content2.png',
      imagePrompt: 'cartoon showing international trade, tourism, and investment requiring currency exchange',
      content: '''People and businesses need forex for many reasons:''',
      bullets: [
        BulletPoint(icon: '✈️', title: 'Travel', description: 'Tourists exchange money for trips abroad.'),
        BulletPoint(icon: '🚢', title: 'Trade', description: 'Companies pay suppliers in foreign currencies.'),
        BulletPoint(icon: '💼', title: 'Investment', description: 'Investors buy assets in other countries.'),
        BulletPoint(icon: '📈', title: 'Speculation', description: 'Traders try to profit from price changes.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Forex Basics',
      imagePath: 'assets/images/lessons/day6/lesson1/game1.png',
      imagePrompt: 'cartoon currency exchange counter with question marks',
      gameData: GameData(
        type: 'choice',
        instruction: 'What does Forex trading involve?',
        options: [GameOption(label: 'Buying and selling stocks', emoji: '📈'), GameOption(label: 'Exchanging one currency for another', emoji: '💱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Market Size',
      imagePath: 'assets/images/lessons/day6/lesson1/game2.png',
      imagePrompt: 'cartoon balloons with market size facts',
      gameData: GameData(
        type: 'balloon',
        instruction: 'How much is traded daily in Forex?',
        options: [GameOption(label: '\$1 million', emoji: '💵'), GameOption(label: '\$6 trillion', emoji: '🌍'), GameOption(label: '\$100', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day6/lesson1/question.png',
      imagePrompt: 'cartoon 24-hour clock with global currencies',
      questionData: QuestionData(
        question: 'When is the Forex market open?',
        options: ['Only weekdays 9-5', '24 hours, 5 days a week', 'Only on weekends', 'One hour per day'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Forex Mission',
      imagePath: 'assets/images/lessons/day6/lesson1/mission.png',
      imagePrompt: 'cartoon explorer entering forex market gates',
      missionData: MissionData(
        mission: 'Why is Forex the largest financial market?',
        options: ['Because governments force trading', 'Global trade, travel, and investment require currency exchange', 'It is the oldest market', 'It is risk-free'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Forex Explorer', badgeIcon: '💱')),
  ],
);
