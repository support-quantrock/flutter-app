import '../../models/lesson_models.dart';

final day27Lesson1 = LessonData(
  day: 27,
  title: "Setting Investment Goals",
  emoji: '🎯',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Know Your Destination',
      imagePath: 'assets/images/lessons/day27/lesson1/story.png',
      imagePrompt: 'cartoon investment goals: retirement beach, house, education, travel, financial freedom',
      content: '''Every investment journey needs a destination.

What are you investing for?

Clear goals guide your entire strategy!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Goals',
      imagePath: 'assets/images/lessons/day27/lesson1/content1.png',
      imagePrompt: 'cartoon short, medium, long term goals: emergency fund, house, retirement',
      content: '''Common investment goals:''',
      bullets: [
        BulletPoint(icon: '🏖️', title: 'Retirement', description: 'Long-term financial security.'),
        BulletPoint(icon: '🏠', title: 'Home Purchase', description: 'Save for a down payment.'),
        BulletPoint(icon: '🎓', title: 'Education', description: 'Fund future learning.'),
        BulletPoint(icon: '💰', title: 'Financial Freedom', description: 'Live off investments.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'SMART Goals',
      imagePath: 'assets/images/lessons/day27/lesson1/content2.png',
      imagePrompt: 'cartoon SMART goals: specific, measurable, achievable, relevant, time-bound',
      content: '''Make goals SMART:''',
      bullets: [
        BulletPoint(icon: '🎯', title: 'Specific', description: 'Clear and defined.'),
        BulletPoint(icon: '📏', title: 'Measurable', description: 'Track your progress.'),
        BulletPoint(icon: '✅', title: 'Achievable', description: 'Realistic to accomplish.'),
        BulletPoint(icon: '🔗', title: 'Relevant', description: 'Matters to you.'),
        BulletPoint(icon: '⏰', title: 'Time-bound', description: 'Has a deadline.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Goal Check',
      imagePath: 'assets/images/lessons/day27/lesson1/game1.png',
      imagePrompt: 'cartoon setting specific investment goal',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which is a better investment goal?',
        options: [GameOption(label: 'I want to be rich someday', emoji: '💭'), GameOption(label: 'Save 100000 for retirement by age 60', emoji: '🎯')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'SMART Pop',
      imagePath: 'assets/images/lessons/day27/lesson1/game2.png',
      imagePrompt: 'cartoon time-bound goal',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Time-bound in SMART goals means:',
        options: [GameOption(label: 'No deadline needed', emoji: '∞'), GameOption(label: 'Has a target date', emoji: '⏰'), GameOption(label: 'Takes forever', emoji: '🐌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day27/lesson1/question.png',
      imagePrompt: 'cartoon investment goals guiding strategy',
      questionData: QuestionData(
        question: 'Investment goals help you:',
        options: ['Waste time', 'Guide your investment strategy', 'Avoid investing', 'Pick random stocks'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Goal Mission',
      imagePath: 'assets/images/lessons/day27/lesson1/mission.png',
      imagePrompt: 'cartoon writing investment goals',
      missionData: MissionData(
        mission: 'Before starting to invest, you should:',
        options: ['Jump in without planning', 'Define clear investment goals', 'Avoid all goals', 'Only think about today'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Goal Setter', badgeIcon: '🎯')),
  ],
);
