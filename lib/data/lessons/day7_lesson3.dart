import '../../models/lesson_models.dart';

final day7Lesson3 = LessonData(
  day: 7,
  title: "Futures Contracts",
  emoji: '📅',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Agreements for Tomorrow',
      imagePath: 'assets/images/lessons/day7/lesson3/story.png',
      imagePrompt: 'cartoon handshake over calendar showing future date, futures contract agreement visualization',
      content: '''Futures are contracts to buy or sell at a future date.

Unlike options, futures are OBLIGATIONS - you must follow through!

Farmers and companies use them to lock in prices ahead of time.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Futures Work',
      imagePath: 'assets/images/lessons/day7/lesson3/content1.png',
      imagePrompt: 'cartoon futures contract between buyer and seller with commodity in middle, date stamp visible',
      content: '''Understanding futures contracts:''',
      bullets: [
        BulletPoint(icon: '📝', title: 'Agreement', description: 'Contract to buy/sell at a set future date.'),
        BulletPoint(icon: '💰', title: 'Fixed Price', description: 'Price is locked in today.'),
        BulletPoint(icon: '⚠️', title: 'Obligation', description: 'Must complete the trade (unlike options).'),
        BulletPoint(icon: '📊', title: 'Standardized', description: 'Traded on exchanges with set terms.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Who Uses Futures',
      imagePath: 'assets/images/lessons/day7/lesson3/content2.png',
      imagePrompt: 'cartoon farmer and airline company both using futures contracts for protection',
      content: '''Futures serve real business needs:''',
      bullets: [
        BulletPoint(icon: '🌾', title: 'Farmers', description: 'Lock in crop prices before harvest.'),
        BulletPoint(icon: '✈️', title: 'Airlines', description: 'Secure fuel prices in advance.'),
        BulletPoint(icon: '🏭', title: 'Manufacturers', description: 'Guarantee material costs.'),
        BulletPoint(icon: '📈', title: 'Speculators', description: 'Bet on future price movements.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Futures vs Options',
      imagePath: 'assets/images/lessons/day7/lesson3/game1.png',
      imagePrompt: 'cartoon comparison between futures obligation and options choice',
      gameData: GameData(
        type: 'choice',
        instruction: 'Futures contracts are:',
        options: [GameOption(label: 'Optional to complete', emoji: '🤷'), GameOption(label: 'Obligatory to complete', emoji: '✅')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'User Finder',
      imagePath: 'assets/images/lessons/day7/lesson3/game2.png',
      imagePrompt: 'cartoon balloons with different futures users',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Who might use futures to lock in crop prices?',
        options: [GameOption(label: 'Doctors', emoji: '👨‍⚕️'), GameOption(label: 'Farmers', emoji: '👨‍🌾'), GameOption(label: 'Teachers', emoji: '👨‍🏫')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day7/lesson3/question.png',
      imagePrompt: 'cartoon futures contract with key features highlighted',
      questionData: QuestionData(
        question: 'What does a futures contract lock in?',
        options: ['Only the quantity', 'Both price and future date', 'Nothing specific', 'Only the buyer'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Futures Mission',
      imagePath: 'assets/images/lessons/day7/lesson3/mission.png',
      imagePrompt: 'cartoon airline using futures to manage fuel costs',
      missionData: MissionData(
        mission: 'Why would an airline use oil futures?',
        options: ['For fun', 'To lock in fuel prices and reduce uncertainty', 'They are required to', 'To gamble on prices'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Futures Explorer', badgeIcon: '📅')),
  ],
);
