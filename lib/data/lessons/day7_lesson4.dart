import '../../models/lesson_models.dart';

final day7Lesson4 = LessonData(
  day: 7,
  title: "Swaps & Forwards",
  emoji: '🔄',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Custom Agreements',
      imagePath: 'assets/images/lessons/day7/lesson4/story.png',
      imagePrompt: 'cartoon two companies exchanging cash flows, swap agreement visualization with arrows',
      content: '''Swaps and forwards are private agreements between parties.

Swaps exchange cash flows - like trading fixed for floating interest rates.

Forwards are like futures but customized and private!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Are Swaps',
      imagePath: 'assets/images/lessons/day7/lesson4/content1.png',
      imagePrompt: 'cartoon interest rate swap with fixed and floating arrows exchanging between two parties',
      content: '''Swaps are exchanges of cash flows:''',
      bullets: [
        BulletPoint(icon: '🔄', title: 'Exchange', description: 'Trade one type of payment for another.'),
        BulletPoint(icon: '📊', title: 'Interest Rate Swaps', description: 'Fixed rate for floating rate.'),
        BulletPoint(icon: '💱', title: 'Currency Swaps', description: 'Exchange different currencies.'),
        BulletPoint(icon: '🏢', title: 'Corporate Use', description: 'Companies manage interest rate risk.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Forward Contracts',
      imagePath: 'assets/images/lessons/day7/lesson4/content2.png',
      imagePrompt: 'cartoon forward contract as customized private agreement between two parties',
      content: '''Forwards are customized future agreements:''',
      bullets: [
        BulletPoint(icon: '📝', title: 'Private', description: 'Traded directly between parties.'),
        BulletPoint(icon: '🎨', title: 'Customized', description: 'Terms can be tailored to needs.'),
        BulletPoint(icon: '📅', title: 'Future Date', description: 'Agree now, settle later.'),
        BulletPoint(icon: '⚠️', title: 'Counterparty Risk', description: 'Depends on other party honoring deal.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Swap Spotter',
      imagePath: 'assets/images/lessons/day7/lesson4/game1.png',
      imagePrompt: 'cartoon swap types visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'In an interest rate swap, parties exchange:',
        options: [GameOption(label: 'Stocks', emoji: '📊'), GameOption(label: 'Interest payments', emoji: '💵')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Forward Find',
      imagePath: 'assets/images/lessons/day7/lesson4/game2.png',
      imagePrompt: 'cartoon forwards vs futures comparison balloons',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Forwards are different from futures because they are:',
        options: [GameOption(label: 'Traded on exchanges', emoji: '🏛️'), GameOption(label: 'Private and customized', emoji: '🤝'), GameOption(label: 'Always free', emoji: '🆓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day7/lesson4/question.png',
      imagePrompt: 'cartoon company using swap to manage risk',
      questionData: QuestionData(
        question: 'Why might a company use an interest rate swap?',
        options: ['For entertainment', 'To manage interest rate risk', 'To avoid all payments', 'To increase debt'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Swap Mission',
      imagePath: 'assets/images/lessons/day7/lesson4/mission.png',
      imagePrompt: 'cartoon forward contract negotiation between two businesses',
      missionData: MissionData(
        mission: 'What is a key risk of forward contracts?',
        options: ['Too public', 'Counterparty might not honor the deal', 'They are too simple', 'No dates involved'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Swap Master', badgeIcon: '🔄')),
  ],
);
