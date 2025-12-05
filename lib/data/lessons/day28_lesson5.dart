import '../../models/lesson_models.dart';

final day28Lesson5 = LessonData(
  day: 28,
  title: "Your Investing Future",
  emoji: '🚀',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Journey Continues',
      imagePath: 'assets/images/lessons/day28/lesson5/story.png',
      imagePrompt: 'cartoon bright investing future: financial freedom, growth, success, rocket',
      content: '''This is just the beginning of your journey!

Keep learning, keep growing.

Your financial future is in your hands!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Continue Learning',
      imagePath: 'assets/images/lessons/day28/lesson5/content1.png',
      imagePrompt: 'cartoon continued learning: books, courses, podcasts, practice',
      content: '''Ways to keep growing:''',
      bullets: [
        BulletPoint(icon: '📚', title: 'Read Books', description: 'Classic investing books.'),
        BulletPoint(icon: '🎧', title: 'Podcasts', description: 'Learn while commuting.'),
        BulletPoint(icon: '🎓', title: 'Courses', description: 'Deepen specific knowledge.'),
        BulletPoint(icon: '💼', title: 'Practice', description: 'Start small and learn by doing.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Power of Starting',
      imagePath: 'assets/images/lessons/day28/lesson5/content2.png',
      imagePrompt: 'cartoon compound growth over time, starting early, small amounts growing big',
      content: '''Why starting matters:''',
      bullets: [
        BulletPoint(icon: '⏰', title: 'Time is Powerful', description: 'Compounding needs time.'),
        BulletPoint(icon: '🌱', title: 'Start Small', description: 'Any amount helps.'),
        BulletPoint(icon: '📈', title: 'Grow Over Time', description: 'Increase as you learn.'),
        BulletPoint(icon: '🎯', title: 'Stay Focused', description: 'Keep your goals in sight.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Future Check',
      imagePath: 'assets/images/lessons/day28/lesson5/game1.png',
      imagePrompt: 'cartoon starting to invest early',
      gameData: GameData(
        type: 'choice',
        instruction: 'The best time to start investing is:',
        options: [GameOption(label: 'When you have millions', emoji: '💰'), GameOption(label: 'As early as possible with whatever you have', emoji: '🌱')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Growth Pop',
      imagePath: 'assets/images/lessons/day28/lesson5/game2.png',
      imagePrompt: 'cartoon lifelong learning investor',
      gameData: GameData(
        type: 'balloon',
        instruction: 'After this course, you should:',
        options: [GameOption(label: 'Stop learning forever', emoji: '🛑'), GameOption(label: 'Continue learning and growing', emoji: '📚'), GameOption(label: 'Forget everything', emoji: '🧠')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day28/lesson5/question.png',
      imagePrompt: 'cartoon compound growth over decades',
      questionData: QuestionData(
        question: 'Compound growth is most powerful when:',
        options: ['You start late', 'You have decades to grow', 'You never invest', 'You withdraw constantly'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Final Mission',
      imagePath: 'assets/images/lessons/day28/lesson5/mission.png',
      imagePrompt: 'cartoon investor ready for future success',
      missionData: MissionData(
        mission: 'Your investing journey:',
        options: ['Ends after this course', 'Is just beginning - keep learning and growing', 'Should be abandoned', 'Does not matter'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 15, badgeName: 'Future Investor', badgeIcon: '🚀')),
  ],
);
