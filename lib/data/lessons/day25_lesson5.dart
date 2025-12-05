import '../../models/lesson_models.dart';

final day25Lesson5 = LessonData(
  day: 25,
  title: "Staying the Course",
  emoji: '🧭',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Long-Term Discipline',
      imagePath: 'assets/images/lessons/day25/lesson5/story.png',
      imagePrompt: 'cartoon investor staying calm through market storm, ship navigating waves',
      content: '''The best investors stay disciplined.

Markets will test your emotions.

Sticking to your plan is the key to success!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Discipline Matters',
      imagePath: 'assets/images/lessons/day25/lesson5/content1.png',
      imagePrompt: 'cartoon disciplined investor vs emotional investor outcomes',
      content: '''Keys to staying disciplined:''',
      bullets: [
        BulletPoint(icon: '📝', title: 'Have a Plan', description: 'Know your strategy before volatility.'),
        BulletPoint(icon: '🎯', title: 'Know Your Goals', description: 'Remember why you are investing.'),
        BulletPoint(icon: '📰', title: 'Ignore Noise', description: 'Tune out daily headlines.'),
        BulletPoint(icon: '📅', title: 'Think Long Term', description: 'Focus on years, not days.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Handling Downturns',
      imagePath: 'assets/images/lessons/day25/lesson5/content2.png',
      imagePrompt: 'cartoon handling market downturn: stay calm, stick to plan, rebalance, buy opportunities',
      content: '''When markets fall:''',
      bullets: [
        BulletPoint(icon: '🧘', title: 'Stay Calm', description: 'Panic selling locks in losses.'),
        BulletPoint(icon: '📊', title: 'Review Plan', description: 'Is your strategy still right?'),
        BulletPoint(icon: '⚖️', title: 'Rebalance', description: 'Opportunity to buy low.'),
        BulletPoint(icon: '📈', title: 'History', description: 'Markets have always recovered.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Discipline Check',
      imagePath: 'assets/images/lessons/day25/lesson5/game1.png',
      imagePrompt: 'cartoon staying invested during crash',
      gameData: GameData(
        type: 'choice',
        instruction: 'When markets crash, disciplined investors:',
        options: [GameOption(label: 'Panic and sell everything', emoji: '😱'), GameOption(label: 'Stick to their long-term plan', emoji: '🧘')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Focus Pop',
      imagePath: 'assets/images/lessons/day25/lesson5/game2.png',
      imagePrompt: 'cartoon long-term focus',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Successful long-term investors focus on:',
        options: [GameOption(label: 'Daily price changes', emoji: '📊'), GameOption(label: 'Years and decades', emoji: '📅'), GameOption(label: 'Hourly news', emoji: '📰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day25/lesson5/question.png',
      imagePrompt: 'cartoon market recovery history',
      questionData: QuestionData(
        question: 'Historically, stock markets have:',
        options: ['Never recovered from crashes', 'Always eventually recovered', 'Only gone down', 'Stayed flat forever'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Course Mission',
      imagePath: 'assets/images/lessons/day25/lesson5/mission.png',
      imagePrompt: 'cartoon writing investment plan',
      missionData: MissionData(
        mission: 'To stay disciplined during volatility:',
        options: ['React to every headline', 'Have a written plan before turbulence', 'Change strategy daily', 'Follow the crowd'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Steady Navigator', badgeIcon: '🧭')),
  ],
);
