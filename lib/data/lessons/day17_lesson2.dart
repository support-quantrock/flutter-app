import '../../models/lesson_models.dart';

final day17Lesson2 = LessonData(
  day: 17,
  title: "Loss Aversion",
  emoji: '😰',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Losses Hurt More',
      imagePath: 'assets/images/lessons/day17/lesson2/story.png',
      imagePrompt: 'cartoon scale showing loss pain weighing more than gain joy, asymmetric reaction',
      content: '''Losing hurts twice as much as winning feels good.

This is called loss aversion.

It makes us hold losers too long and sell winners too soon!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding Loss Aversion',
      imagePath: 'assets/images/lessons/day17/lesson2/content1.png',
      imagePrompt: 'cartoon research showing 2x pain from losses vs gains, emotional asymmetry',
      content: '''How loss aversion works:''',
      bullets: [
        BulletPoint(icon: '📊', title: '2x Pain', description: 'Losses feel twice as bad as gains feel good.'),
        BulletPoint(icon: '🔒', title: 'Hold Losers', description: 'Refuse to sell and realize loss.'),
        BulletPoint(icon: '💨', title: 'Sell Winners', description: 'Take profits too quickly.'),
        BulletPoint(icon: '🧬', title: 'Hardwired', description: 'Evolution made us this way.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Fighting Loss Aversion',
      imagePath: 'assets/images/lessons/day17/lesson2/content2.png',
      imagePrompt: 'cartoon strategies to overcome loss aversion: stop losses, rules, automation',
      content: '''How to overcome it:''',
      bullets: [
        BulletPoint(icon: '🛑', title: 'Use Stop Losses', description: 'Automate selling losers.'),
        BulletPoint(icon: '📝', title: 'Have Rules', description: 'Decide exits before you invest.'),
        BulletPoint(icon: '🤖', title: 'Automate', description: 'Remove emotion from the process.'),
        BulletPoint(icon: '📊', title: 'Focus on Process', description: 'Not individual trade outcomes.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Loss Check',
      imagePath: 'assets/images/lessons/day17/lesson2/game1.png',
      imagePrompt: 'cartoon loss vs gain emotional impact',
      gameData: GameData(
        type: 'choice',
        instruction: 'Loss aversion means losses feel:',
        options: [GameOption(label: 'Same as gains', emoji: '='), GameOption(label: 'Worse than gains feel good', emoji: '😰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Behavior Pop',
      imagePath: 'assets/images/lessons/day17/lesson2/game2.png',
      imagePrompt: 'cartoon holding losing stock too long',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Loss aversion makes people:',
        options: [GameOption(label: 'Sell losers quickly', emoji: '🏃'), GameOption(label: 'Hold losers too long', emoji: '🔒'), GameOption(label: 'Never invest', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day17/lesson2/question.png',
      imagePrompt: 'cartoon stop loss as protection',
      questionData: QuestionData(
        question: 'Stop losses help overcome loss aversion by:',
        options: ['Increasing losses', 'Automating the selling of losers', 'Holding forever', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Loss Mission',
      imagePath: 'assets/images/lessons/day17/lesson2/mission.png',
      imagePrompt: 'cartoon investor with rules-based approach',
      missionData: MissionData(
        mission: 'The best way to fight loss aversion is:',
        options: ['Ignore it', 'Have predetermined rules and stick to them', 'Trade more often', 'Avoid all investments'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Loss Aware', badgeIcon: '😰')),
  ],
);
