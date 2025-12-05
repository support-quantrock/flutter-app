import '../../models/lesson_models.dart';

final day28Lesson1 = LessonData(
  day: 28,
  title: "Your Journey So Far",
  emoji: '🎓',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Look How Far You Have Come',
      imagePath: 'assets/images/lessons/day28/lesson1/story.png',
      imagePrompt: 'cartoon celebrating 28 day investment learning journey, graduation cap, certificates',
      content: '''Congratulations on completing 28 days!

You have learned so much about investing.

Now it is time to put knowledge into action!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'What You Learned',
      imagePath: 'assets/images/lessons/day28/lesson1/content1.png',
      imagePrompt: 'cartoon review of topics: stocks, bonds, funds, strategies, psychology',
      content: '''Key concepts you have mastered:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Investment Types', description: 'Stocks, bonds, funds, alternatives.'),
        BulletPoint(icon: '📈', title: 'Analysis', description: 'Technical and fundamental methods.'),
        BulletPoint(icon: '🧠', title: 'Psychology', description: 'Emotions and behavior in investing.'),
        BulletPoint(icon: '📋', title: 'Planning', description: 'Goals, allocation, and strategy.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Key Principles',
      imagePath: 'assets/images/lessons/day28/lesson1/content2.png',
      imagePrompt: 'cartoon key investing principles: diversify, long-term, low cost, discipline',
      content: '''Core principles to remember:''',
      bullets: [
        BulletPoint(icon: '🔀', title: 'Diversify', description: 'Do not put all eggs in one basket.'),
        BulletPoint(icon: '⏰', title: 'Think Long-Term', description: 'Time in market beats timing.'),
        BulletPoint(icon: '💰', title: 'Keep Costs Low', description: 'Fees eat into returns.'),
        BulletPoint(icon: '🧘', title: 'Stay Disciplined', description: 'Stick to your plan.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Principle Check',
      imagePath: 'assets/images/lessons/day28/lesson1/game1.png',
      imagePrompt: 'cartoon diversification principle',
      gameData: GameData(
        type: 'choice',
        instruction: 'Diversification means:',
        options: [GameOption(label: 'Put everything in one stock', emoji: '1️⃣'), GameOption(label: 'Spread investments across many assets', emoji: '🔀')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Wisdom Pop',
      imagePath: 'assets/images/lessons/day28/lesson1/game2.png',
      imagePrompt: 'cartoon long-term investing wisdom',
      gameData: GameData(
        type: 'balloon',
        instruction: 'For most investors, the best approach is:',
        options: [GameOption(label: 'Day trading', emoji: '📱'), GameOption(label: 'Long-term investing with discipline', emoji: '⏰'), GameOption(label: 'Following hot tips', emoji: '🔥')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day28/lesson1/question.png',
      imagePrompt: 'cartoon low-cost investing',
      questionData: QuestionData(
        question: 'Investment fees:',
        options: ['Do not matter', 'Compound over time and reduce returns', 'Improve performance', 'Should be as high as possible'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Review Mission',
      imagePath: 'assets/images/lessons/day28/lesson1/mission.png',
      imagePrompt: 'cartoon investor ready for action',
      missionData: MissionData(
        mission: 'The best investors:',
        options: ['Trade constantly', 'Stay disciplined and patient', 'Follow every trend', 'Ignore all principles'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Knowledge Master', badgeIcon: '🎓')),
  ],
);
