import '../../models/lesson_models.dart';

final day19Lesson2 = LessonData(
  day: 19,
  title: "The Case for Passive",
  emoji: '📊',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Why Passive Often Wins',
      imagePath: 'assets/images/lessons/day19/lesson2/story.png',
      imagePrompt: 'cartoon tortoise (passive) beating hare (active) in race, consistent wins over time',
      content: '''Most active managers fail to beat their benchmarks.

After fees, passive investing wins more often.

Even Warren Buffett recommends index funds for most people!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Data',
      imagePath: 'assets/images/lessons/day19/lesson2/content1.png',
      imagePrompt: 'cartoon chart showing most active managers underperforming over 15 years',
      content: '''What research shows:''',
      bullets: [
        BulletPoint(icon: '📉', title: '90% Fail', description: 'Most active funds underperform over 15 years.'),
        BulletPoint(icon: '💸', title: 'Fees Hurt', description: 'Higher fees drag down returns.'),
        BulletPoint(icon: '🎲', title: 'Hard to Pick', description: 'Winning managers hard to identify ahead.'),
        BulletPoint(icon: '📊', title: 'Consistency', description: 'Past winners often become losers.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Passive Benefits',
      imagePath: 'assets/images/lessons/day19/lesson2/content2.png',
      imagePrompt: 'cartoon passive investing benefits: low cost, diversified, tax efficient, simple',
      content: '''Why passive works well:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'Low Cost', description: 'Keep more of your returns.'),
        BulletPoint(icon: '🌈', title: 'Diversified', description: 'Instant broad exposure.'),
        BulletPoint(icon: '📋', title: 'Tax Efficient', description: 'Less trading means fewer taxes.'),
        BulletPoint(icon: '😌', title: 'Simple', description: 'No manager selection needed.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Data Check',
      imagePath: 'assets/images/lessons/day19/lesson2/game1.png',
      imagePrompt: 'cartoon active fund failure rate',
      gameData: GameData(
        type: 'choice',
        instruction: 'Over 15 years, most active funds:',
        options: [GameOption(label: 'Beat their benchmark', emoji: '🏆'), GameOption(label: 'Underperform their benchmark', emoji: '📉')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Benefit Pop',
      imagePath: 'assets/images/lessons/day19/lesson2/game2.png',
      imagePrompt: 'cartoon low fees compounding over time',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Lower fees mean:',
        options: [GameOption(label: 'Lower returns', emoji: '📉'), GameOption(label: 'You keep more of your returns', emoji: '💰'), GameOption(label: 'Nothing different', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day19/lesson2/question.png',
      imagePrompt: 'cartoon Buffett recommending index funds',
      questionData: QuestionData(
        question: 'Warren Buffett recommends for most people:',
        options: ['Active fund managers', 'Low-cost index funds', 'Day trading', 'Avoiding stocks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Passive Mission',
      imagePath: 'assets/images/lessons/day19/lesson2/mission.png',
      imagePrompt: 'cartoon passive advantage over time',
      missionData: MissionData(
        mission: 'Why do fees matter so much in investing?',
        options: ['They do not matter', 'They compound over time, reducing returns', 'Higher fees mean better returns', 'Fees are always the same'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Passive Pro', badgeIcon: '📊')),
  ],
);
