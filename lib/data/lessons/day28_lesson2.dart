import '../../models/lesson_models.dart';

final day28Lesson2 = LessonData(
  day: 28,
  title: "Getting Started Checklist",
  emoji: '✅',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Action Plan',
      imagePath: 'assets/images/lessons/day28/lesson2/story.png',
      imagePrompt: 'cartoon investment getting started checklist, action items, steps',
      content: '''Ready to start investing for real?

Here is your action checklist.

Take it step by step!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Before You Invest',
      imagePath: 'assets/images/lessons/day28/lesson2/content1.png',
      imagePrompt: 'cartoon pre-investment steps: emergency fund, pay debt, set goals',
      content: '''First, get your foundation ready:''',
      bullets: [
        BulletPoint(icon: '🏦', title: 'Emergency Fund', description: '3-6 months of expenses saved.'),
        BulletPoint(icon: '💳', title: 'High-Interest Debt', description: 'Pay off credit cards first.'),
        BulletPoint(icon: '🎯', title: 'Clear Goals', description: 'Know what you are investing for.'),
        BulletPoint(icon: '📅', title: 'Budget', description: 'Know how much you can invest.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Starting Steps',
      imagePath: 'assets/images/lessons/day28/lesson2/content2.png',
      imagePrompt: 'cartoon first investment steps: open account, choose investments, automate',
      content: '''Steps to begin:''',
      bullets: [
        BulletPoint(icon: '📱', title: 'Open Account', description: 'Choose a brokerage.'),
        BulletPoint(icon: '📊', title: 'Select Investments', description: 'Start with index funds.'),
        BulletPoint(icon: '🤖', title: 'Automate', description: 'Set up recurring investments.'),
        BulletPoint(icon: '📚', title: 'Keep Learning', description: 'Continue your education.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Priority Check',
      imagePath: 'assets/images/lessons/day28/lesson2/game1.png',
      imagePrompt: 'cartoon emergency fund priority',
      gameData: GameData(
        type: 'choice',
        instruction: 'Before investing, you should have:',
        options: [GameOption(label: 'No savings at all', emoji: '❌'), GameOption(label: 'An emergency fund', emoji: '🏦')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Step Pop',
      imagePath: 'assets/images/lessons/day28/lesson2/game2.png',
      imagePrompt: 'cartoon automating investments',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Automating investments helps you:',
        options: [GameOption(label: 'Skip saving', emoji: '⏭️'), GameOption(label: 'Invest consistently without thinking', emoji: '🤖'), GameOption(label: 'Avoid investing', emoji: '🚫')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day28/lesson2/question.png',
      imagePrompt: 'cartoon paying off high-interest debt',
      questionData: QuestionData(
        question: 'High-interest debt should be:',
        options: ['Ignored while investing', 'Paid off before aggressive investing', 'Increased', 'Hidden from yourself'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Checklist Mission',
      imagePath: 'assets/images/lessons/day28/lesson2/mission.png',
      imagePrompt: 'cartoon completing investment checklist',
      missionData: MissionData(
        mission: 'The first step to start investing is:',
        options: ['Jump in without preparation', 'Get your financial foundation ready', 'Wait forever', 'Skip all planning'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Action Taker', badgeIcon: '✅')),
  ],
);
