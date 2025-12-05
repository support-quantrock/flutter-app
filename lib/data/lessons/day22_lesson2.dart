import '../../models/lesson_models.dart';

final day22Lesson2 = LessonData(
  day: 22,
  title: "How Much Do You Need?",
  emoji: '🎯',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Setting Your Target',
      imagePath: 'assets/images/lessons/day22/lesson2/story.png',
      imagePrompt: 'cartoon retirement goal calculator with target number, planning the amount needed',
      content: '''How much money do you need to retire?

It depends on your lifestyle and expenses.

Rules of thumb can help you estimate!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Estimating Your Need',
      imagePath: 'assets/images/lessons/day22/lesson2/content1.png',
      imagePrompt: 'cartoon retirement calculation: annual expenses times 25, 4% rule visualization',
      content: '''Common retirement rules:''',
      bullets: [
        BulletPoint(icon: '✖️', title: '25x Rule', description: 'Save 25 times your annual expenses.'),
        BulletPoint(icon: '4️⃣', title: '4% Rule', description: 'Withdraw 4% per year in retirement.'),
        BulletPoint(icon: '📊', title: 'Example', description: 'Need 40K per year = 1 million saved.'),
        BulletPoint(icon: '⚠️', title: 'Estimate', description: 'Your situation may vary.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Factors to Consider',
      imagePath: 'assets/images/lessons/day22/lesson2/content2.png',
      imagePrompt: 'cartoon retirement factors: lifestyle, healthcare, inflation, longevity',
      content: '''Things that affect your number:''',
      bullets: [
        BulletPoint(icon: '🏠', title: 'Lifestyle', description: 'Modest vs luxurious retirement.'),
        BulletPoint(icon: '🏥', title: 'Healthcare', description: 'Medical costs increase with age.'),
        BulletPoint(icon: '📈', title: 'Inflation', description: 'Prices rise over time.'),
        BulletPoint(icon: '⏳', title: 'Longevity', description: 'How long you might live.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Rule Check',
      imagePath: 'assets/images/lessons/day22/lesson2/game1.png',
      imagePrompt: 'cartoon 25x rule visualization',
      gameData: GameData(
        type: 'choice',
        instruction: 'The 25x rule says to save:',
        options: [GameOption(label: '25 thousand dollars', emoji: '💵'), GameOption(label: '25 times your annual expenses', emoji: '✖️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Factor Pop',
      imagePath: 'assets/images/lessons/day22/lesson2/game2.png',
      imagePrompt: 'cartoon healthcare costs in retirement',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Healthcare costs in retirement typically:',
        options: [GameOption(label: 'Decrease', emoji: '📉'), GameOption(label: 'Increase', emoji: '📈'), GameOption(label: 'Stay same', emoji: '=')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day22/lesson2/question.png',
      imagePrompt: 'cartoon 4% withdrawal rate',
      questionData: QuestionData(
        question: 'The 4% rule suggests withdrawing:',
        options: ['4% of income', '4% of savings per year', '4% of social security', '4% of your age'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Target Mission',
      imagePath: 'assets/images/lessons/day22/lesson2/mission.png',
      imagePrompt: 'cartoon person calculating their retirement number',
      missionData: MissionData(
        mission: 'Using the 25x rule, if you need 50K per year:',
        options: ['You need 500K', 'You need 1.25 million', 'You need 50K total', 'You need 25K'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Goal Setter', badgeIcon: '🎯')),
  ],
);
