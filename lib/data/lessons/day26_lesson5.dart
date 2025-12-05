import '../../models/lesson_models.dart';

final day26Lesson5 = LessonData(
  day: 26,
  title: "Avoiding Scams & Bad Advice",
  emoji: '🛡️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Protect Yourself',
      imagePath: 'assets/images/lessons/day26/lesson5/story.png',
      imagePrompt: 'cartoon investment scam warning: too good to be true offers, pressure tactics, fake gurus',
      content: '''Scams and bad advice can cost you everything.

Learn to spot red flags.

Protect your hard-earned money!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Warning Signs',
      imagePath: 'assets/images/lessons/day26/lesson5/content1.png',
      imagePrompt: 'cartoon investment scam red flags: guaranteed returns, pressure, secrecy, unregistered',
      content: '''Red flags to watch for:''',
      bullets: [
        BulletPoint(icon: '🚩', title: 'Guaranteed Returns', description: 'No investment is guaranteed.'),
        BulletPoint(icon: '⏰', title: 'Pressure Tactics', description: 'Act now or miss out!'),
        BulletPoint(icon: '🤫', title: 'Secrecy', description: 'Exclusive or secret strategies.'),
        BulletPoint(icon: '📋', title: 'Unregistered', description: 'Not licensed or regulated.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How to Protect Yourself',
      imagePath: 'assets/images/lessons/day26/lesson5/content2.png',
      imagePrompt: 'cartoon protecting yourself: verify credentials, research, skepticism, diversify',
      content: '''Stay safe:''',
      bullets: [
        BulletPoint(icon: '🔍', title: 'Verify Credentials', description: 'Check licenses and registration.'),
        BulletPoint(icon: '📚', title: 'Research', description: 'Look up reviews and complaints.'),
        BulletPoint(icon: '🤔', title: 'Be Skeptical', description: 'If it sounds too good, it probably is.'),
        BulletPoint(icon: '🗣️', title: 'Get Second Opinions', description: 'Ask trusted sources.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Red Flag Check',
      imagePath: 'assets/images/lessons/day26/lesson5/game1.png',
      imagePrompt: 'cartoon guaranteed returns scam',
      gameData: GameData(
        type: 'choice',
        instruction: 'A promise of guaranteed high returns is:',
        options: [GameOption(label: 'A great opportunity', emoji: '✅'), GameOption(label: 'A major red flag', emoji: '🚩')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Protect Pop',
      imagePath: 'assets/images/lessons/day26/lesson5/game2.png',
      imagePrompt: 'cartoon verifying investment advisor',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Before working with an advisor, you should:',
        options: [GameOption(label: 'Trust them immediately', emoji: '👍'), GameOption(label: 'Verify their credentials', emoji: '🔍'), GameOption(label: 'Give them all your money', emoji: '💰')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day26/lesson5/question.png',
      imagePrompt: 'cartoon pressure to invest quickly',
      questionData: QuestionData(
        question: 'Pressure to invest immediately is:',
        options: ['Normal practice', 'A warning sign', 'Always a good deal', 'Required by law'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Safety Mission',
      imagePath: 'assets/images/lessons/day26/lesson5/mission.png',
      imagePrompt: 'cartoon skeptical investor',
      missionData: MissionData(
        mission: 'When evaluating an investment opportunity:',
        options: ['Trust everything you hear', 'Be skeptical and do research', 'Act without thinking', 'Ignore red flags'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 10, badgeName: 'Scam Spotter', badgeIcon: '🛡️')),
  ],
);
