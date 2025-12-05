import '../../models/lesson_models.dart';

final day15Lesson4 = LessonData(
  day: 15,
  title: "Rebalancing Your Portfolio",
  emoji: '🔄',
  screens: [
    const LessonScreen(
      type: ScreenType.story,
      title: 'Keeping Balance',
      imagePath: 'assets/images/lessons/day15/lesson4/story.png',
      imagePrompt: 'cartoon portfolio drifting out of balance then being rebalanced back to target',
      content: '''Your portfolio drifts over time.

If stocks do well, they become a bigger slice.

Rebalancing brings your portfolio back to target!''',
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'Why Rebalance',
      imagePath: 'assets/images/lessons/day15/lesson4/content1.png',
      imagePrompt: 'cartoon 60/40 portfolio drifting to 75/25 after stock rally',
      content: '''The need for rebalancing:''',
      bullets: [
        BulletPoint(icon: '📊', title: 'Drift Happens', description: 'Winners grow, changing your mix.'),
        BulletPoint(icon: '⚠️', title: 'Risk Changes', description: 'Drift can increase your risk level.'),
        BulletPoint(icon: '🎯', title: 'Stay on Target', description: 'Keep allocation aligned with goals.'),
        BulletPoint(icon: '💰', title: 'Sell High', description: 'Rebalancing sells winners automatically.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.content,
      title: 'How to Rebalance',
      imagePath: 'assets/images/lessons/day15/lesson4/content2.png',
      imagePrompt: 'cartoon rebalancing methods: calendar quarterly, threshold 5%, new money',
      content: '''Rebalancing methods:''',
      bullets: [
        BulletPoint(icon: '📅', title: 'Calendar', description: 'Rebalance quarterly or annually.'),
        BulletPoint(icon: '📏', title: 'Threshold', description: 'Rebalance when 5%+ off target.'),
        BulletPoint(icon: '💵', title: 'New Money', description: 'Direct new investments to fill gaps.'),
        BulletPoint(icon: '⚖️', title: 'Keep Simple', description: 'Do not overthink - consistency matters.'),
      ],
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Rebalance Check',
      imagePath: 'assets/images/lessons/day15/lesson4/game1.png',
      imagePrompt: 'cartoon portfolio drift concept',
      gameData: GameData(
        type: 'choice',
        instruction: 'Rebalancing helps you:',
        options: [GameOption(label: 'Let portfolio drift forever', emoji: '🌊'), GameOption(label: 'Maintain your target allocation', emoji: '🎯')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.game,
      title: 'Method Pop',
      imagePath: 'assets/images/lessons/day15/lesson4/game2.png',
      imagePrompt: 'cartoon rebalancing frequency options',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Calendar rebalancing means:',
        options: [GameOption(label: 'Daily trading', emoji: '📆'), GameOption(label: 'Rebalancing at set intervals', emoji: '📅'), GameOption(label: 'Never rebalancing', emoji: '❌')],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day15/lesson4/question.png',
      imagePrompt: 'cartoon rebalancing benefit',
      questionData: QuestionData(
        question: 'A benefit of rebalancing is:',
        options: ['Increases risk', 'Forces you to sell high and buy low', 'Eliminates all gains', 'Nothing'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Rebalance Mission',
      imagePath: 'assets/images/lessons/day15/lesson4/mission.png',
      imagePrompt: 'cartoon threshold rebalancing at 5%',
      missionData: MissionData(
        mission: 'Threshold rebalancing triggers when:',
        options: ['Every day', 'Allocation drifts beyond set percentage', 'Moon is full', 'Never'],
        correctIndex: 1,
      ),
    ),
    const LessonScreen(type: ScreenType.reward, rewardData: RewardData(coins: 9, badgeName: 'Rebalancer', badgeIcon: '🔄')),
  ],
);
