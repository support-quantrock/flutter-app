import '../../models/lesson_models.dart';

final day24Lesson5 = LessonData(
  day: 24,
  title: "Alternatives in Your Portfolio",
  emoji: '⚖️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Adding Alternatives Wisely',
      imagePath: 'assets/images/lessons/day24/lesson5/story.png',
      imagePrompt: 'cartoon balanced portfolio with small allocation to alternatives alongside stocks and bonds',
      content: '''Alternative investments can enhance your portfolio.

But they should be a small part of most portfolios.

Understand the risks before investing!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Benefits of Alternatives',
      imagePath: 'assets/images/lessons/day24/lesson5/content1.png',
      imagePrompt: 'cartoon benefits of alternatives: diversification, inflation protection, unique returns',
      content: '''Why consider alternatives:''',
      bullets: [
        BulletPoint(icon: '🔀', title: 'Diversification', description: 'Different from stocks and bonds.'),
        BulletPoint(icon: '📈', title: 'Inflation Protection', description: 'Some hedge against inflation.'),
        BulletPoint(icon: '🎯', title: 'Unique Returns', description: 'Access different opportunities.'),
        BulletPoint(icon: '⚖️', title: 'Balance', description: 'Can reduce overall portfolio risk.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Risks to Consider',
      imagePath: 'assets/images/lessons/day24/lesson5/content2.png',
      imagePrompt: 'cartoon alternative investment risks: illiquidity, complexity, high fees, lack of transparency',
      content: '''Important risks:''',
      bullets: [
        BulletPoint(icon: '🔒', title: 'Illiquidity', description: 'Hard to sell quickly.'),
        BulletPoint(icon: '🧩', title: 'Complexity', description: 'May be hard to understand.'),
        BulletPoint(icon: '💸', title: 'Higher Fees', description: 'Often more expensive.'),
        BulletPoint(icon: '🔍', title: 'Less Transparent', description: 'Limited information available.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Benefit Check',
      imagePath: 'assets/images/lessons/day24/lesson5/game1.png',
      imagePrompt: 'cartoon diversification benefit',
      gameData: GameData(
        type: 'choice',
        instruction: 'Alternatives help portfolios through:',
        options: [GameOption(label: 'Matching stock returns exactly', emoji: '='), GameOption(label: 'Providing diversification', emoji: '🔀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Pop',
      imagePath: 'assets/images/lessons/day24/lesson5/game2.png',
      imagePrompt: 'cartoon alternative investment fees',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Alternative investments often have:',
        options: [GameOption(label: 'Lower fees than index funds', emoji: '💵'), GameOption(label: 'Higher fees', emoji: '💸'), GameOption(label: 'No fees at all', emoji: '🆓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day24/lesson5/question.png',
      imagePrompt: 'cartoon portfolio allocation to alternatives',
      questionData: QuestionData(
        question: 'For most investors, alternatives should be:',
        options: ['100% of portfolio', 'A small portion of portfolio', 'Ignored completely', 'The only investment'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Allocation Mission',
      imagePath: 'assets/images/lessons/day24/lesson5/mission.png',
      imagePrompt: 'cartoon understanding alternatives before investing',
      missionData: MissionData(
        mission: 'Before adding alternatives to your portfolio:',
        options: ['Invest blindly', 'Understand the risks and your goals', 'Put all money in alternatives', 'Ignore all research'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Alt Allocator', badgeIcon: '⚖️')),
  ],
);
