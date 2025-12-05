import '../../models/lesson_models.dart';

final day2Lesson4 = LessonData(
  day: 2,
  title: "Emotional Control",
  emoji: '🎭',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Master Your Emotions',
      imagePath: 'assets/images/lessons/day2/lesson4/story.png',
      imagePrompt:
          'cartoon character on emotional rollercoaster shaped like stock chart, learning to stay calm, fear and greed monsters on sides, educational adventure style',
      content:
          '''The biggest enemy of investors is not the market. It is their own emotions.

Fear makes you sell too early. Greed makes you hold too long.

Today you will learn to master both!''',
    ),

    // Screen 2: Content - Fear
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding Fear',
      imagePath: 'assets/images/lessons/day2/lesson4/content1.png',
      imagePrompt:
          'cartoon scared investor watching red chart, fear monster whispering sell sell sell, emotional investing danger, educational style',
      content: '''Fear is powerful and dangerous for investors.

It makes you do the wrong thing at the wrong time.''',
      bullets: [
        BulletPoint(
          icon: '😰',
          title: 'Panic Selling',
          description: 'Selling when prices drop, locking in losses.',
        ),
        BulletPoint(
          icon: '🏃',
          title: 'Running Away',
          description: 'Avoiding good opportunities because of worry.',
        ),
        BulletPoint(
          icon: '📉',
          title: 'Selling at Bottom',
          description: 'Fear peaks when prices are lowest.',
        ),
        BulletPoint(
          icon: '💔',
          title: 'The Result',
          description: 'Buy high, sell low. The opposite of winning.',
        ),
      ],
    ),

    // Screen 3: Content - Greed
    const LessonScreen(
      type: ScreenType.content,
      title: 'Understanding Greed',
      imagePath: 'assets/images/lessons/day2/lesson4/content2.png',
      imagePrompt:
          'cartoon greedy investor chasing flying gold coins off a cliff, greed monster pushing them forward, cautionary educational style',
      content: '''Greed is fear's dangerous partner.

It makes you take too much risk and ignore warning signs.''',
      bullets: [
        BulletPoint(
          icon: '🤑',
          title: 'Chasing Returns',
          description: 'Buying something just because it went up.',
        ),
        BulletPoint(
          icon: '🎰',
          title: 'Over-Betting',
          description: 'Putting too much money in one place.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Buying at Top',
          description: 'Greed peaks when prices are highest.',
        ),
        BulletPoint(
          icon: '💥',
          title: 'The Result',
          description: 'Big risks, big losses when things turn.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Emotion Check',
      imagePath: 'assets/images/lessons/day2/lesson4/game1.png',
      imagePrompt:
          'cartoon investor choosing between emotional reaction and logical response, angel and devil on shoulders, decision moment',
      gameData: GameData(
        type: 'choice',
        instruction: 'Everyone is buying a hot stock. You should:',
        options: [
          GameOption(
            label: 'Buy immediately before you miss out!',
            emoji: '🏃',
          ),
          GameOption(
            label: 'Research first, then decide calmly',
            emoji: '🧠',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Right Emotion!',
      imagePath: 'assets/images/lessons/day2/lesson4/game2.png',
      imagePrompt:
          'cartoon balloons with emotions: fear, greed, discipline, patience floating, colorful game atmosphere',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which emotion helps investors SUCCEED?',
        options: [
          GameOption(
            label: 'Fear',
            emoji: '😨',
          ),
          GameOption(
            label: 'Greed',
            emoji: '🤑',
          ),
          GameOption(
            label: 'Discipline',
            emoji: '🎯',
          ),
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson4/question.png',
      imagePrompt:
          'cartoon investor at computer with falling chart, testing emotional response, quiz atmosphere',
      questionData: QuestionData(
        question: 'What emotion causes investors to sell too EARLY?',
        options: [
          'Greed',
          'Fear',
          'Patience',
          'Excitement',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Control Mission',
      imagePath: 'assets/images/lessons/day2/lesson4/mission.png',
      imagePrompt:
          'cartoon character with shield blocking fear and greed attacks, discipline armor, battle for emotional control, epic style',
      missionData: MissionData(
        mission: 'How do successful investors control their emotions?',
        options: [
          'They have no emotions',
          'They follow a plan and stick to it',
          'They check prices every minute',
          'They follow social media tips',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 9,
        badgeName: 'Emotion Master',
        badgeIcon: '🎭',
      ),
    ),
  ],
);
