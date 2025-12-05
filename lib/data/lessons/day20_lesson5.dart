import '../../models/lesson_models.dart';

final day20Lesson5 = LessonData(
  day: 20,
  title: "ESG Investing in Practice",
  emoji: '🎯',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'How to Invest ESG',
      imagePath: 'assets/images/lessons/day20/lesson5/story.png',
      imagePrompt: 'cartoon ESG investment options: ESG funds, screened portfolios, impact investing',
      content: '''Ready to invest with ESG in mind?

There are many practical options available.

From simple ESG funds to targeted impact investing!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'ESG Investment Options',
      imagePath: 'assets/images/lessons/day20/lesson5/content1.png',
      imagePrompt: 'cartoon ESG investment types: ESG ETFs, sustainable funds, impact investments',
      content: '''Ways to invest ESG:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'ESG ETFs', description: 'Low-cost ESG index funds.'),
        BulletPoint(icon: '🌱', title: 'Sustainable Funds', description: 'Actively managed ESG funds.'),
        BulletPoint(icon: '🎯', title: 'Impact Investing', description: 'Target specific outcomes.'),
        BulletPoint(icon: '❌', title: 'Exclusion', description: 'Avoid certain industries.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Things to Consider',
      imagePath: 'assets/images/lessons/day20/lesson5/content2.png',
      imagePrompt: 'cartoon ESG considerations: ratings vary, greenwashing warning, balance returns',
      content: '''ESG investing considerations:''',
      bullets: [
        BulletPoint(icon: '📏', title: 'Ratings Vary', description: 'Different providers score differently.'),
        BulletPoint(icon: '⚠️', title: 'Greenwashing', description: 'Some claims are exaggerated.'),
        BulletPoint(icon: '💰', title: 'Returns', description: 'ESG can perform well financially.'),
        BulletPoint(icon: '🎯', title: 'Your Values', description: 'Define what matters to you.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Option Check',
      imagePath: 'assets/images/lessons/day20/lesson5/game1.png',
      imagePrompt: 'cartoon ESG ETF simplicity',
      gameData: GameData(
        type: 'choice',
        instruction: 'A simple way to invest ESG is:',
        options: [GameOption(label: 'Research every company yourself', emoji: '🔍'), GameOption(label: 'Use an ESG ETF', emoji: '📊')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Warning Pop',
      imagePath: 'assets/images/lessons/day20/lesson5/game2.png',
      imagePrompt: 'cartoon greenwashing warning',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Greenwashing means:',
        options: [GameOption(label: 'Very good ESG practices', emoji: '🌱'), GameOption(label: 'Exaggerated environmental claims', emoji: '⚠️'), GameOption(label: 'Washing things green', emoji: '🧼')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day20/lesson5/question.png',
      imagePrompt: 'cartoon ESG performance',
      questionData: QuestionData(
        question: 'ESG investing:',
        options: ['Always loses money', 'Can perform well financially', 'Is illegal', 'Has no options available'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'ESG Mission',
      imagePath: 'assets/images/lessons/day20/lesson5/mission.png',
      imagePrompt: 'cartoon investor defining their ESG values',
      missionData: MissionData(
        mission: 'Before ESG investing, you should:',
        options: ['Buy any green fund', 'Define what values matter to you', 'Ignore all factors', 'Only look at returns'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'ESG Investor', badgeIcon: '🎯')),
  ],
);
