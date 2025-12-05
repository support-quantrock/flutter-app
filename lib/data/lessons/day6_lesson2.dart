import '../../models/lesson_models.dart';

final day6Lesson2 = LessonData(
  day: 6,
  title: "Currency Pairs Explained",
  emoji: '🔄',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Dancing Partners',
      imagePath: 'assets/images/lessons/day6/lesson2/story.png',
      imagePrompt: 'cartoon EUR and USD characters dancing together as a pair, currency pair visualization',
      content: '''In Forex, currencies always come in pairs.

You cannot buy a dollar without selling something else!

EUR/USD, GBP/JPY - these pairs tell a story. Let me explain!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Currency Pairs',
      imagePath: 'assets/images/lessons/day6/lesson2/content1.png',
      imagePrompt: 'cartoon currency pair structure: base currency / quote currency with arrows',
      content: '''Every forex trade involves two currencies:''',
      bullets: [
        BulletPoint(icon: '1️⃣', title: 'Base Currency', description: 'The first currency in the pair (EUR in EUR/USD).'),
        BulletPoint(icon: '2️⃣', title: 'Quote Currency', description: 'The second currency (USD in EUR/USD).'),
        BulletPoint(icon: '📊', title: 'Exchange Rate', description: 'How much quote currency for 1 base currency.'),
        BulletPoint(icon: '💡', title: 'Example', description: 'EUR/USD = 1.10 means 1 Euro = 1.10 US Dollars.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Major Pairs',
      imagePath: 'assets/images/lessons/day6/lesson2/content2.png',
      imagePrompt: 'cartoon major currency pairs displayed like superhero cards: EUR/USD, GBP/USD, USD/JPY',
      content: '''The most traded pairs are called "majors":''',
      bullets: [
        BulletPoint(icon: '🇪🇺', title: 'EUR/USD', description: 'Euro vs Dollar - Most traded pair.'),
        BulletPoint(icon: '🇬🇧', title: 'GBP/USD', description: 'British Pound vs Dollar.'),
        BulletPoint(icon: '🇯🇵', title: 'USD/JPY', description: 'Dollar vs Japanese Yen.'),
        BulletPoint(icon: '🇨🇭', title: 'USD/CHF', description: 'Dollar vs Swiss Franc.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pair Check',
      imagePath: 'assets/images/lessons/day6/lesson2/game1.png',
      imagePrompt: 'cartoon EUR/USD pair with question about base currency',
      gameData: GameData(
        type: 'choice',
        instruction: 'In EUR/USD, which is the BASE currency?',
        options: [GameOption(label: 'USD (US Dollar)', emoji: '🇺🇸'), GameOption(label: 'EUR (Euro)', emoji: '🇪🇺')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Rate Reading',
      imagePath: 'assets/images/lessons/day6/lesson2/game2.png',
      imagePrompt: 'cartoon exchange rate board with EUR/USD = 1.10',
      gameData: GameData(
        type: 'balloon',
        instruction: 'EUR/USD = 1.10 means:',
        options: [GameOption(label: '1 USD = 1.10 EUR', emoji: '🇺🇸'), GameOption(label: '1 EUR = 1.10 USD', emoji: '🇪🇺'), GameOption(label: 'Both are equal', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day6/lesson2/question.png',
      imagePrompt: 'cartoon major currency pairs lineup',
      questionData: QuestionData(
        question: 'Which is the MOST traded currency pair?',
        options: ['GBP/JPY', 'EUR/USD', 'AUD/CAD', 'USD/INR'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Pair Mission',
      imagePath: 'assets/images/lessons/day6/lesson2/mission.png',
      imagePrompt: 'cartoon investor studying currency pair relationships',
      missionData: MissionData(
        mission: 'Why do currencies trade in pairs?',
        options: ['For fun', 'You need to sell one currency to buy another', 'It is a tradition', 'Pairs are easier to count'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Pair Expert', badgeIcon: '🔄')),
  ],
);
