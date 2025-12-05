import '../../models/lesson_models.dart';

final day23Lesson5 = LessonData(
  day: 23,
  title: "Real Estate Risks",
  emoji: '⚠️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Know the Risks',
      imagePath: 'assets/images/lessons/day23/lesson5/story.png',
      imagePrompt: 'cartoon real estate risks: market crash, vacancy, repairs, interest rates',
      content: '''Real estate is not risk-free!

Property values can fall, tenants can leave.

Understanding risks helps you invest wisely.''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Market Risks',
      imagePath: 'assets/images/lessons/day23/lesson5/content1.png',
      imagePrompt: 'cartoon real estate market risks: price crash, local economy decline, oversupply',
      content: '''External risks:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Price Drops', description: 'Markets can crash like 2008.'),
        BulletPoint(icon: '📍', title: 'Location', description: 'Local economy affects value.'),
        BulletPoint(icon: '📈', title: 'Interest Rates', description: 'Rising rates hurt prices.'),
        BulletPoint(icon: '🏗️', title: 'Oversupply', description: 'Too much building lowers values.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Property Risks',
      imagePath: 'assets/images/lessons/day23/lesson5/content2.png',
      imagePrompt: 'cartoon property-specific risks: vacancy, repairs, problem tenants, damage',
      content: '''Property-specific risks:''',
      bullets: [
        BulletPoint(icon: '🚫', title: 'Vacancy', description: 'Empty units earn no rent.'),
        BulletPoint(icon: '🔧', title: 'Repairs', description: 'Unexpected maintenance costs.'),
        BulletPoint(icon: '😤', title: 'Bad Tenants', description: 'Non-payment or damage.'),
        BulletPoint(icon: '🌊', title: 'Disasters', description: 'Fire, flood, earthquake damage.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Check',
      imagePath: 'assets/images/lessons/day23/lesson5/game1.png',
      imagePrompt: 'cartoon 2008 real estate crash',
      gameData: GameData(
        type: 'choice',
        instruction: 'Real estate prices:',
        options: [GameOption(label: 'Only go up', emoji: '📈'), GameOption(label: 'Can fall significantly', emoji: '📉')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Issue Pop',
      imagePath: 'assets/images/lessons/day23/lesson5/game2.png',
      imagePrompt: 'cartoon vacancy risk',
      gameData: GameData(
        type: 'balloon',
        instruction: 'An empty rental property:',
        options: [GameOption(label: 'Still earns rent', emoji: '💵'), GameOption(label: 'Earns no income but has costs', emoji: '📉'), GameOption(label: 'Is not a problem', emoji: '👍')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day23/lesson5/question.png',
      imagePrompt: 'cartoon interest rate effect on real estate',
      questionData: QuestionData(
        question: 'Rising interest rates often:',
        options: ['Boost property prices', 'Hurt property prices', 'Have no effect', 'Only affect stocks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Risk Mission',
      imagePath: 'assets/images/lessons/day23/lesson5/mission.png',
      imagePrompt: 'cartoon understanding real estate risks',
      missionData: MissionData(
        mission: 'Before investing in real estate, you should:',
        options: ['Ignore all risks', 'Understand the potential risks involved', 'Assume prices only rise', 'Skip research'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Risk Aware', badgeIcon: '⚠️')),
  ],
);
