import '../../models/lesson_models.dart';

final day20Lesson4 = LessonData(
  day: 20,
  title: "Governance Factors",
  emoji: '⚖️',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'How Companies Are Run',
      imagePath: 'assets/images/lessons/day20/lesson4/story.png',
      imagePrompt: 'cartoon boardroom with ethical leadership, transparent reporting, fair practices',
      content: '''Governance is about how companies are managed.

Good leadership, ethics, and transparency matter.

Poor governance has destroyed many companies!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Governance Issues',
      imagePath: 'assets/images/lessons/day20/lesson4/content1.png',
      imagePrompt: 'cartoon governance factors: board independence, executive pay, transparency, ethics',
      content: '''Key governance factors:''',
      bullets: [
        BulletPoint(icon: '👔', title: 'Board', description: 'Independent and diverse board.'),
        BulletPoint(icon: '💰', title: 'Executive Pay', description: 'Fair compensation tied to performance.'),
        BulletPoint(icon: '👀', title: 'Transparency', description: 'Honest reporting and disclosure.'),
        BulletPoint(icon: '🤝', title: 'Ethics', description: 'Anti-corruption and integrity.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Governance Failures',
      imagePath: 'assets/images/lessons/day20/lesson4/content2.png',
      imagePrompt: 'cartoon corporate scandals from poor governance: Enron, fraud, cover-ups',
      content: '''What happens with bad governance:''',
      bullets: [
        BulletPoint(icon: '📉', title: 'Scandals', description: 'Fraud and cover-ups destroy value.'),
        BulletPoint(icon: '💸', title: 'Excessive Pay', description: 'Leaders enrich themselves unfairly.'),
        BulletPoint(icon: '🙈', title: 'Hidden Risks', description: 'Problems hidden until too late.'),
        BulletPoint(icon: '💔', title: 'Collapse', description: 'Companies can fail completely.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Governance Check',
      imagePath: 'assets/images/lessons/day20/lesson4/game1.png',
      imagePrompt: 'cartoon governance factor example',
      gameData: GameData(
        type: 'choice',
        instruction: 'A governance factor is:',
        options: [GameOption(label: 'Water usage', emoji: '💧'), GameOption(label: 'Board independence', emoji: '👔')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Risk Pop',
      imagePath: 'assets/images/lessons/day20/lesson4/game2.png',
      imagePrompt: 'cartoon poor governance risk',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Poor governance can lead to:',
        options: [GameOption(label: 'Better performance', emoji: '📈'), GameOption(label: 'Scandals and company failure', emoji: '📉'), GameOption(label: 'Nothing bad', emoji: '👍')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day20/lesson4/question.png',
      imagePrompt: 'cartoon transparent reporting',
      questionData: QuestionData(
        question: 'Transparent reporting means:',
        options: ['Hiding problems', 'Honest disclosure of information', 'No reports at all', 'Only good news'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Governance Mission',
      imagePath: 'assets/images/lessons/day20/lesson4/mission.png',
      imagePrompt: 'cartoon well-governed company success',
      missionData: MissionData(
        mission: 'Good governance helps companies by:',
        options: ['Increasing scandals', 'Building trust and avoiding disasters', 'Hiding information', 'Paying executives more'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Governance Guru', badgeIcon: '⚖️')),
  ],
);
