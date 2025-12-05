import '../../models/lesson_models.dart';

final day28Lesson3 = LessonData(
  day: 28,
  title: "Common Beginner Mistakes",
  emoji: '⚠️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Learn From Others',
      imagePath: 'assets/images/lessons/day28/lesson3/story.png',
      imagePrompt: 'cartoon common investing mistakes: panic selling, chasing trends, no diversification',
      content: '''Smart investors learn from mistakes.

Avoid these common beginner errors.

Save yourself time and money!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Emotional Mistakes',
      imagePath: 'assets/images/lessons/day28/lesson3/content1.png',
      imagePrompt: 'cartoon emotional investing mistakes: panic selling, FOMO buying, impatience',
      content: '''Emotional errors to avoid:''',
      bullets: [
        BulletPoint(icon: '😱', title: 'Panic Selling', description: 'Selling during market drops.'),
        BulletPoint(icon: '🏃', title: 'FOMO Buying', description: 'Chasing hot investments.'),
        BulletPoint(icon: '⏰', title: 'Impatience', description: 'Expecting quick riches.'),
        BulletPoint(icon: '📺', title: 'Following Hype', description: 'Acting on headlines.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Strategy Mistakes',
      imagePath: 'assets/images/lessons/day28/lesson3/content2.png',
      imagePrompt: 'cartoon strategy mistakes: no diversification, timing market, ignoring fees',
      content: '''Strategy errors to avoid:''',
      bullets: [
        BulletPoint(icon: '1️⃣', title: 'No Diversification', description: 'All eggs in one basket.'),
        BulletPoint(icon: '⏱️', title: 'Market Timing', description: 'Trying to predict markets.'),
        BulletPoint(icon: '💸', title: 'Ignoring Fees', description: 'High costs eat returns.'),
        BulletPoint(icon: '🔄', title: 'Overtrading', description: 'Buying and selling too much.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Mistake Check',
      imagePath: 'assets/images/lessons/day28/lesson3/game1.png',
      imagePrompt: 'cartoon panic selling during crash',
      gameData: GameData(
        type: 'choice',
        instruction: 'Selling everything during a market crash is:',
        options: [GameOption(label: 'Smart investing', emoji: '🧠'), GameOption(label: 'A common mistake', emoji: '⚠️')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Error Pop',
      imagePath: 'assets/images/lessons/day28/lesson3/game2.png',
      imagePrompt: 'cartoon chasing hot stocks',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Buying an investment just because it recently went up a lot is:',
        options: [GameOption(label: 'Good strategy', emoji: '✅'), GameOption(label: 'FOMO and often a mistake', emoji: '🏃'), GameOption(label: 'Required by law', emoji: '📜')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day28/lesson3/question.png',
      imagePrompt: 'cartoon overtrading costs',
      questionData: QuestionData(
        question: 'Frequent trading often:',
        options: ['Guarantees profits', 'Increases costs and hurts returns', 'Has no impact', 'Is the only way to invest'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Avoidance Mission',
      imagePath: 'assets/images/lessons/day28/lesson3/mission.png',
      imagePrompt: 'cartoon wise investor avoiding mistakes',
      missionData: MissionData(
        mission: 'To avoid common mistakes:',
        options: ['Follow emotions blindly', 'Have a plan and stick to it', 'React to every headline', 'Trade constantly'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Mistake Avoider', badgeIcon: '⚠️')),
  ],
);
