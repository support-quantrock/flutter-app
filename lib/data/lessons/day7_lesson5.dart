import '../../models/lesson_models.dart';

final day7Lesson5 = LessonData(
  day: 7,
  title: "Using Derivatives Wisely",
  emoji: '🎯',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Power and Responsibility',
      imagePath: 'assets/images/lessons/day7/lesson5/story.png',
      imagePrompt: 'cartoon derivatives as powerful tools with both shield (hedging) and fire (speculation) sides',
      content: '''Derivatives can be powerful tools or dangerous weapons.

Used wisely, they protect portfolios and manage risk.

Used recklessly, they can cause massive losses!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Smart Uses',
      imagePath: 'assets/images/lessons/day7/lesson5/content1.png',
      imagePrompt: 'cartoon smart derivative strategies: hedging, portfolio insurance, risk management',
      content: '''How professionals use derivatives wisely:''',
      bullets: [
        BulletPoint(icon: '🛡️', title: 'Portfolio Hedging', description: 'Protect investments from losses.'),
        BulletPoint(icon: '📊', title: 'Income Generation', description: 'Sell options for premium income.'),
        BulletPoint(icon: '⚖️', title: 'Risk Management', description: 'Balance portfolio exposure.'),
        BulletPoint(icon: '🎯', title: 'Strategic Bets', description: 'Limited risk speculation.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Dangerous Mistakes',
      imagePath: 'assets/images/lessons/day7/lesson5/content2.png',
      imagePrompt: 'cartoon warning signs around derivative misuse: excessive leverage, no understanding, gambling',
      content: '''Common derivative mistakes to avoid:''',
      bullets: [
        BulletPoint(icon: '⚡', title: 'Too Much Leverage', description: 'Amplifies losses dramatically.'),
        BulletPoint(icon: '❓', title: 'Not Understanding', description: 'Trading what you do not understand.'),
        BulletPoint(icon: '🎰', title: 'Pure Gambling', description: 'Speculating without strategy.'),
        BulletPoint(icon: '📉', title: 'Ignoring Expiration', description: 'Options expire worthless if not managed.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Wise Choice',
      imagePath: 'assets/images/lessons/day7/lesson5/game1.png',
      imagePrompt: 'cartoon smart vs risky derivative usage comparison',
      gameData: GameData(
        type: 'choice',
        instruction: 'What is a SMART way to use derivatives?',
        options: [GameOption(label: 'Maximum leverage always', emoji: '💥'), GameOption(label: 'Hedging to protect investments', emoji: '🛡️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Mistake Pop',
      imagePath: 'assets/images/lessons/day7/lesson5/game2.png',
      imagePrompt: 'cartoon balloons with derivative mistakes',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What is a common derivative MISTAKE?',
        options: [GameOption(label: 'Learning before trading', emoji: '📚'), GameOption(label: 'Trading without understanding', emoji: '❓'), GameOption(label: 'Managing risk carefully', emoji: '⚖️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day7/lesson5/question.png',
      imagePrompt: 'cartoon derivative education and research',
      questionData: QuestionData(
        question: 'Before trading derivatives, you should:',
        options: ['Jump in immediately', 'Understand how they work', 'Use maximum leverage', 'Ignore all risks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Wisdom Mission',
      imagePath: 'assets/images/lessons/day7/lesson5/mission.png',
      imagePrompt: 'cartoon balanced approach to derivative trading',
      missionData: MissionData(
        mission: 'What is the KEY to using derivatives successfully?',
        options: ['Trade as much as possible', 'Education, strategy, and risk management', 'Follow random tips', 'Ignore expiration dates'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Derivative Wise', badgeIcon: '🎯')),
  ],
);
