import '../../models/lesson_models.dart';

final day17Lesson3 = LessonData(
  day: 17,
  title: "Confirmation Bias",
  emoji: '👓',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Seeing What You Want',
      imagePath: 'assets/images/lessons/day17/lesson3/story.png',
      imagePrompt: 'cartoon investor only seeing positive news about their stock, ignoring warnings',
      content: '''Confirmation bias means seeking information that supports your beliefs.

Own a stock? You notice the good news.
Hate a stock? You notice the bad news.

This blind spot can cost you money!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How It Works',
      imagePath: 'assets/images/lessons/day17/lesson3/content1.png',
      imagePrompt: 'cartoon filter showing only agreeable information passing through',
      content: '''Confirmation bias explained:''',
      bullets: [
        BulletPoint(icon: '🔍', title: 'Selective Search', description: 'Only look for agreeable info.'),
        BulletPoint(icon: '👂', title: 'Selective Hearing', description: 'Only hear what you want.'),
        BulletPoint(icon: '🧠', title: 'Selective Memory', description: 'Remember confirming facts.'),
        BulletPoint(icon: '😑', title: 'Ignore Contrary', description: 'Dismiss opposing views.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Fighting Confirmation Bias',
      imagePath: 'assets/images/lessons/day17/lesson3/content2.png',
      imagePrompt: 'cartoon investor actively seeking opposing viewpoints, devil advocate',
      content: '''How to overcome it:''',
      bullets: [
        BulletPoint(icon: '😈', title: 'Devil\'s Advocate', description: 'Actively seek opposing views.'),
        BulletPoint(icon: '❓', title: 'Ask Why Not', description: 'List reasons you might be wrong.'),
        BulletPoint(icon: '👥', title: 'Diverse Sources', description: 'Read different perspectives.'),
        BulletPoint(icon: '📊', title: 'Focus on Data', description: 'Let numbers guide you.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Bias Check',
      imagePath: 'assets/images/lessons/day17/lesson3/game1.png',
      imagePrompt: 'cartoon confirmation bias in action',
      gameData: GameData(
        type: 'choice',
        instruction: 'Confirmation bias makes you:',
        options: [GameOption(label: 'Seek all information equally', emoji: '⚖️'), GameOption(label: 'Only notice information you agree with', emoji: '👓')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Fix Pop',
      imagePath: 'assets/images/lessons/day17/lesson3/game2.png',
      imagePrompt: 'cartoon seeking opposing views',
      gameData: GameData(
        type: 'balloon',
        instruction: 'To fight confirmation bias, you should:',
        options: [GameOption(label: 'Only read positive news', emoji: '😊'), GameOption(label: 'Actively seek opposing views', emoji: '😈'), GameOption(label: 'Ignore all news', emoji: '🙈')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day17/lesson3/question.png',
      imagePrompt: 'cartoon investor asking why they might be wrong',
      questionData: QuestionData(
        question: 'A good practice is to ask yourself:',
        options: ['Why am I always right?', 'Why might I be wrong?', 'How can I ignore this?', 'Who agrees with me?'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Bias Mission',
      imagePath: 'assets/images/lessons/day17/lesson3/mission.png',
      imagePrompt: 'cartoon diverse information sources',
      missionData: MissionData(
        mission: 'Confirmation bias is dangerous because:',
        options: ['It helps you invest', 'It makes you miss important warning signs', 'It has no effect', 'Everyone has it so it is fine'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Bias Buster', badgeIcon: '👓')),
  ],
);
