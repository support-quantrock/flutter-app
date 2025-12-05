import '../../models/lesson_models.dart';

final day20Lesson1 = LessonData(
  day: 20,
  title: "What is ESG?",
  emoji: '🌱',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Investing with Values',
      imagePath: 'assets/images/lessons/day20/lesson1/story.png',
      imagePrompt: 'cartoon ESG letters with environmental nature, social people, governance building',
      content: '''ESG stands for Environmental, Social, and Governance.

It means considering more than just profits.

Invest in companies that do good while doing well!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Three Pillars',
      imagePath: 'assets/images/lessons/day20/lesson1/content1.png',
      imagePrompt: 'cartoon three ESG pillars: E with trees, S with people, G with scales of justice',
      content: '''What ESG covers:''',
      bullets: [
        BulletPoint(icon: '🌍', title: 'Environmental', description: 'Climate, pollution, resources.'),
        BulletPoint(icon: '👥', title: 'Social', description: 'Workers, community, diversity.'),
        BulletPoint(icon: '⚖️', title: 'Governance', description: 'Leadership, ethics, transparency.'),
        BulletPoint(icon: '🎯', title: 'Together', description: 'Holistic view of company quality.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why ESG Matters',
      imagePath: 'assets/images/lessons/day20/lesson1/content2.png',
      imagePrompt: 'cartoon ESG benefits: better risk management, long-term thinking, positive impact',
      content: '''ESG can help investors:''',
      bullets: [
        BulletPoint(icon: '🛡️', title: 'Risk', description: 'Avoid companies with hidden risks.'),
        BulletPoint(icon: '⏳', title: 'Long Term', description: 'Sustainable companies last longer.'),
        BulletPoint(icon: '💚', title: 'Values', description: 'Align money with beliefs.'),
        BulletPoint(icon: '🌟', title: 'Impact', description: 'Support positive change.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'ESG Check',
      imagePath: 'assets/images/lessons/day20/lesson1/game1.png',
      imagePrompt: 'cartoon ESG meaning',
      gameData: GameData(
        type: 'choice',
        instruction: 'The E in ESG stands for:',
        options: [GameOption(label: 'Earnings', emoji: '💰'), GameOption(label: 'Environmental', emoji: '🌍')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pillar Pop',
      imagePath: 'assets/images/lessons/day20/lesson1/game2.png',
      imagePrompt: 'cartoon social factor examples',
      gameData: GameData(
        type: 'balloon',
        instruction: 'The S (Social) includes:',
        options: [GameOption(label: 'Stock price', emoji: '📈'), GameOption(label: 'Workers and community', emoji: '👥'), GameOption(label: 'Only profit', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day20/lesson1/question.png',
      imagePrompt: 'cartoon governance meaning',
      questionData: QuestionData(
        question: 'Governance in ESG refers to:',
        options: ['Government regulations', 'Company leadership and ethics', 'Stock trading', 'Marketing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'ESG Mission',
      imagePath: 'assets/images/lessons/day20/lesson1/mission.png',
      imagePrompt: 'cartoon ESG investing purpose',
      missionData: MissionData(
        mission: 'ESG investing considers:',
        options: ['Only profits', 'Environmental, social, and governance factors', 'Only stock price', 'Nothing important'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'ESG Starter', badgeIcon: '🌱')),
  ],
);
