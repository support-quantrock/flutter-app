import '../../models/lesson_models.dart';

final day6Lesson3 = LessonData(
  day: 6,
  title: "What Moves Currencies",
  emoji: '📰',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Drivers',
      imagePath: 'assets/images/lessons/day6/lesson3/story.png',
      imagePrompt: 'cartoon currency being pushed and pulled by various forces: interest rates, news, economy indicators',
      content: '''Currency prices do not move randomly.

They respond to economic news, interest rates, and global events.

Understanding these drivers is key to forex trading!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Interest Rates',
      imagePath: 'assets/images/lessons/day6/lesson3/content1.png',
      imagePrompt: 'cartoon central bank raising interest rates causing currency to strengthen with upward arrows',
      content: '''Interest rates are the biggest currency driver:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Higher Rates', description: 'Attract foreign investment, strengthen currency.'),
        BulletPoint(icon: '📉', title: 'Lower Rates', description: 'Less attractive, weaken currency.'),
        BulletPoint(icon: '🏦', title: 'Central Banks', description: 'Fed, ECB, BOJ control interest rates.'),
        BulletPoint(icon: '👀', title: 'Trader Focus', description: 'Rate decisions move markets dramatically.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Other Factors',
      imagePath: 'assets/images/lessons/day6/lesson3/content2.png',
      imagePrompt: 'cartoon multiple factors affecting currency: GDP report, inflation data, political news',
      content: '''Many other factors move currency prices:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Economic Data', description: 'GDP, employment, inflation reports.'),
        BulletPoint(icon: '🏛️', title: 'Political Events', description: 'Elections, policy changes, stability.'),
        BulletPoint(icon: '🌍', title: 'Global Events', description: 'Wars, pandemics, trade agreements.'),
        BulletPoint(icon: '😰', title: 'Market Sentiment', description: 'Fear and confidence affect prices.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Rate Impact',
      imagePath: 'assets/images/lessons/day6/lesson3/game1.png',
      imagePrompt: 'cartoon central bank raising rates, currency strength visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'If a country RAISES interest rates, its currency usually:',
        options: [GameOption(label: 'Weakens', emoji: '📉'), GameOption(label: 'Strengthens', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Factor Find',
      imagePath: 'assets/images/lessons/day6/lesson3/game2.png',
      imagePrompt: 'cartoon balloons with different currency drivers',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What is the BIGGEST driver of currency prices?',
        options: [GameOption(label: 'Weather', emoji: '🌦️'), GameOption(label: 'Interest Rates', emoji: '🏦'), GameOption(label: 'Sports Results', emoji: '⚽')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day6/lesson3/question.png',
      imagePrompt: 'cartoon economic calendar with important dates highlighted',
      questionData: QuestionData(
        question: 'Who controls interest rates in the USA?',
        options: ['The President', 'The Federal Reserve (Fed)', 'Banks', 'Congress'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Driver Mission',
      imagePath: 'assets/images/lessons/day6/lesson3/mission.png',
      imagePrompt: 'cartoon trader watching news and economic data for currency trading',
      missionData: MissionData(
        mission: 'Why should forex traders watch economic news?',
        options: ['For entertainment', 'Economic data moves currency prices', 'News is always accurate', 'It has no effect'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'News Watcher', badgeIcon: '📰')),
  ],
);
