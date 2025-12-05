import '../../models/lesson_models.dart';

final day22Lesson1 = LessonData(
  day: 22,
  title: "Why Plan for Retirement?",
  emoji: '🏖️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Your Future Self',
      imagePath: 'assets/images/lessons/day22/lesson1/story.png',
      imagePrompt: 'cartoon young person sending money forward in time to happy retired version of themselves',
      content: '''One day you will stop working.

Will you have enough money to live well?

Planning now ensures a comfortable future!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Start Early',
      imagePath: 'assets/images/lessons/day22/lesson1/content1.png',
      imagePrompt: 'cartoon compound growth over decades, small early investments becoming large',
      content: '''The power of starting early:''',
      bullets: [
        BulletPoint(icon: '📈', title: 'Compounding', description: 'Money grows on itself over decades.'),
        BulletPoint(icon: '⏰', title: 'Time', description: 'More time = more growth potential.'),
        BulletPoint(icon: '💵', title: 'Less Needed', description: 'Start early, save less per month.'),
        BulletPoint(icon: '😌', title: 'Less Stress', description: 'No panic saving later in life.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Retirement Basics',
      imagePath: 'assets/images/lessons/day22/lesson1/content2.png',
      imagePrompt: 'cartoon retirement planning elements: savings, investments, pension, social security',
      content: '''Retirement income sources:''',
      bullets: [
        BulletPoint(icon: '💰', title: 'Personal Savings', description: 'What you save and invest.'),
        BulletPoint(icon: '🏢', title: 'Employer Plans', description: '401k and pension if available.'),
        BulletPoint(icon: '🏛️', title: 'Social Security', description: 'Government benefit (varies by country).'),
        BulletPoint(icon: '📊', title: 'Mix Needed', description: 'Usually need multiple sources.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Timing Check',
      imagePath: 'assets/images/lessons/day22/lesson1/game1.png',
      imagePrompt: 'cartoon early start advantage',
      gameData: GameData(
        type: 'choice',
        instruction: 'For retirement savings, it is best to start:',
        options: [GameOption(label: 'At age 60', emoji: '⏰'), GameOption(label: 'As early as possible', emoji: '🌱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Source Pop',
      imagePath: 'assets/images/lessons/day22/lesson1/game2.png',
      imagePrompt: 'cartoon multiple retirement income sources',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Retirement income typically comes from:',
        options: [GameOption(label: 'Only social security', emoji: '🏛️'), GameOption(label: 'Multiple sources combined', emoji: '📊'), GameOption(label: 'Only savings', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day22/lesson1/question.png',
      imagePrompt: 'cartoon compounding over decades',
      questionData: QuestionData(
        question: 'Starting to save early is powerful because of:',
        options: ['Luck', 'Compound growth over time', 'Nothing special', 'Guaranteed returns'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Retirement Mission',
      imagePath: 'assets/images/lessons/day22/lesson1/mission.png',
      imagePrompt: 'cartoon planning for future self',
      missionData: MissionData(
        mission: 'Why plan for retirement now?',
        options: ['Retirement is not real', 'Future you will need income when not working', 'Money does not matter', 'Only old people need to'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 8, badgeName: 'Future Planner', badgeIcon: '🏖️')),
  ],
);
