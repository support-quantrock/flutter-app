import '../../models/lesson_models.dart';

final day17Lesson4 = LessonData(
  day: 17,
  title: "FOMO & Panic",
  emoji: '😱',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Fear of Missing Out',
      imagePath: 'assets/images/lessons/day17/lesson4/story.png',
      imagePrompt: 'cartoon investor watching rocket stock go up, feeling desperate to jump in late',
      content: '''FOMO makes you chase hot stocks at the worst time.

Everyone is getting rich - you want in too!

But by the time you hear about it, it might be too late.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding FOMO',
      imagePath: 'assets/images/lessons/day17/lesson4/content1.png',
      imagePrompt: 'cartoon FOMO cycle: see gains, fear missing out, buy at peak, price drops',
      content: '''How FOMO hurts investors:''',
      bullets: [
        BulletPoint(icon: '🚀', title: 'See Others Win', description: 'Friends making money on hot stock.'),
        BulletPoint(icon: '😰', title: 'Fear Sets In', description: 'Worried about missing gains.'),
        BulletPoint(icon: '🏃', title: 'Chase', description: 'Buy at or near the top.'),
        BulletPoint(icon: '📉', title: 'Regret', description: 'Price drops after you buy.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Managing Fear',
      imagePath: 'assets/images/lessons/day17/lesson4/content2.png',
      imagePrompt: 'cartoon calm investor with investment plan while others panic around them',
      content: '''How to handle fear and FOMO:''',
      bullets: [
        BulletPoint(icon: '📝', title: 'Have a Plan', description: 'Stick to your strategy.'),
        BulletPoint(icon: '🧘', title: 'Stay Calm', description: 'Emotional decisions are usually wrong.'),
        BulletPoint(icon: '⏰', title: 'Remember History', description: 'Hot stocks often cool down.'),
        BulletPoint(icon: '🎯', title: 'Focus on You', description: 'Your timeline, your goals.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'FOMO Check',
      imagePath: 'assets/images/lessons/day17/lesson4/game1.png',
      imagePrompt: 'cartoon FOMO buying behavior',
      gameData: GameData(
        type: 'choice',
        instruction: 'FOMO often leads to:',
        options: [GameOption(label: 'Buying at the bottom', emoji: '📉'), GameOption(label: 'Buying at or near the top', emoji: '📈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Calm Pop',
      imagePath: 'assets/images/lessons/day17/lesson4/game2.png',
      imagePrompt: 'cartoon staying calm during market excitement',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The best response to FOMO is:',
        options: [GameOption(label: 'Buy immediately', emoji: '🏃'), GameOption(label: 'Stick to your plan', emoji: '📝'), GameOption(label: 'Sell everything', emoji: '😱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day17/lesson4/question.png',
      imagePrompt: 'cartoon hot stock warning',
      questionData: QuestionData(
        question: 'When everyone is talking about a hot stock:',
        options: ['Rush to buy', 'It might already be too late', 'It will definitely go higher', 'Ignore it completely'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'FOMO Mission',
      imagePath: 'assets/images/lessons/day17/lesson4/mission.png',
      imagePrompt: 'cartoon investor with written investment plan',
      missionData: MissionData(
        mission: 'How does having a plan help with FOMO?',
        options: ['It does not help', 'Gives you guidelines to stick to', 'Makes you trade more', 'Guarantees profits'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'FOMO Fighter', badgeIcon: '😱')),
  ],
);
