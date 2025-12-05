import '../../models/lesson_models.dart';

final day10Lesson1 = LessonData(
  day: 10,
  title: "What is Risk?",
  emoji: '⚠️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Risk in Investing',
      imagePath: 'assets/images/lessons/day10/lesson1/story.png',
      imagePrompt: 'cartoon balance scale showing risk and reward, investment decision concept',
      content: '''Every investment carries risk.

Risk is the chance of losing some or all of your money.

But without risk, there is often no reward!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Risk',
      imagePath: 'assets/images/lessons/day10/lesson1/content1.png',
      imagePrompt: 'cartoon different investment risks: market crash, company failure, inflation, currency change',
      content: '''Common investment risks:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Market Risk', description: 'Overall market declines affect your investments.'),
        BulletPoint(icon: '🏢', title: 'Company Risk', description: 'Individual company problems or failure.'),
        BulletPoint(icon: '💸', title: 'Inflation Risk', description: 'Money loses purchasing power over time.'),
        BulletPoint(icon: '💱', title: 'Currency Risk', description: 'Exchange rate changes affect value.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Risk vs Reward',
      imagePath: 'assets/images/lessons/day10/lesson1/content2.png',
      imagePrompt: 'cartoon risk-reward spectrum: low risk savings, medium risk bonds, high risk stocks, very high risk crypto',
      content: '''The risk-reward relationship:''',
      bullets: [
        BulletPoint(icon: '🏦', title: 'Low Risk', description: 'Savings accounts - safe but low returns.'),
        BulletPoint(icon: '📊', title: 'Medium Risk', description: 'Bonds - moderate risk and returns.'),
        BulletPoint(icon: '📈', title: 'Higher Risk', description: 'Stocks - more risk, potentially more reward.'),
        BulletPoint(icon: '🚀', title: 'High Risk', description: 'Crypto, options - highest risk and potential.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Reality',
      imagePath: 'assets/images/lessons/day10/lesson1/game1.png',
      imagePrompt: 'cartoon risk definition concept',
      gameData: GameData(
        type: 'choice',
        instruction: 'In investing, risk means:',
        options: [GameOption(label: 'Guaranteed profit', emoji: '💰'), GameOption(label: 'Chance of losing money', emoji: '📉')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Level Pop',
      imagePath: 'assets/images/lessons/day10/lesson1/game2.png',
      imagePrompt: 'cartoon risk levels comparison',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which typically has the LOWEST risk?',
        options: [GameOption(label: 'Cryptocurrency', emoji: '₿'), GameOption(label: 'Savings account', emoji: '🏦'), GameOption(label: 'Options trading', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day10/lesson1/question.png',
      imagePrompt: 'cartoon risk-reward balance',
      questionData: QuestionData(
        question: 'Generally, higher potential returns mean:',
        options: ['Lower risk', 'Higher risk', 'No risk', 'Guaranteed profit'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Risk Mission',
      imagePath: 'assets/images/lessons/day10/lesson1/mission.png',
      imagePrompt: 'cartoon investor understanding risk',
      missionData: MissionData(
        mission: 'Why should investors understand risk?',
        options: ['To avoid all investments', 'To make informed decisions', 'Risk does not matter', 'To guarantee profits'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Risk Aware', badgeIcon: '⚠️')),
  ],
);
