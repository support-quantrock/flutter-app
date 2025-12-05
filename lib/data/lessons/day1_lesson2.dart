import '../../models/lesson_models.dart';

final day1Lesson2 = LessonData(
  day: 1,
  title: "Your Investment Profile",
  emoji: '👤',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Know Yourself',
      imagePath: 'assets/images/lessons/day1/lesson2/story.png',
      imagePrompt:
          'cartoon character looking into magical mirror showing different investor types, reflections showing conservative cautious and bold versions, colorful fantasy style',
      content:
          '''Before you start investing, you need to understand yourself.

Every investor is different. Some like safety, others prefer excitement.

Discovering your investor type is the first step to success!''',
    ),

    // Screen 2: Content - Investor Types
    const LessonScreen(
      type: ScreenType.content,
      title: 'Types of Investors',
      imagePath: 'assets/images/lessons/day1/lesson2/content1.png',
      imagePrompt:
          'cartoon three different investor characters: cautious turtle with shield, balanced owl with scales, bold lion with rocket, colorful educational style',
      content: '''There are different types of investors based on how much risk they can handle.

None is better than others - it depends on YOU!''',
      bullets: [
        BulletPoint(
          icon: '🐢',
          title: 'Conservative',
          description: 'Prefers safety over high returns. Slow and steady wins the race.',
        ),
        BulletPoint(
          icon: '🦉',
          title: 'Moderate',
          description: 'Balanced approach. Some risk for better returns.',
        ),
        BulletPoint(
          icon: '🦁',
          title: 'Aggressive',
          description: 'Comfortable with risk. Aims for higher growth.',
        ),
      ],
    ),

    // Screen 3: Content - What Affects Your Profile
    const LessonScreen(
      type: ScreenType.content,
      title: 'What Shapes Your Profile?',
      imagePath: 'assets/images/lessons/day1/lesson2/content2.png',
      imagePrompt:
          'cartoon puzzle pieces coming together showing age, goals, timeline, and comfort level, forming investor profile picture, bright educational style',
      content: '''Several factors determine what kind of investor you should be.

Understanding these helps you make better decisions.''',
      bullets: [
        BulletPoint(
          icon: '📅',
          title: 'Time Horizon',
          description: 'How long until you need the money? Years? Decades?',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Goals',
          description: 'What are you investing for? Retirement? House? Education?',
        ),
        BulletPoint(
          icon: '💪',
          title: 'Risk Tolerance',
          description: 'How do you feel when investments go up and down?',
        ),
        BulletPoint(
          icon: '💵',
          title: 'Financial Situation',
          description: 'Your income, savings, and expenses matter.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Profile Match',
      imagePath: 'assets/images/lessons/day1/lesson2/game1.png',
      imagePrompt:
          'cartoon young person with 30 years until retirement, arrows pointing to different investment paths, colorful decision game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Someone with 30 years until retirement should likely be:',
        options: [
          GameOption(
            label: 'Very conservative (mostly safe investments)',
            emoji: '🐢',
          ),
          GameOption(
            label: 'More aggressive (growth-focused)',
            emoji: '🦁',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Right Answer!',
      imagePath: 'assets/images/lessons/day1/lesson2/game2.png',
      imagePrompt:
          'cartoon balloons with investor personality traits floating, colorful game atmosphere, educational style',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Which is TRUE about investor profiles?',
        options: [
          GameOption(
            label: 'Everyone should invest the same way',
            emoji: '👥',
          ),
          GameOption(
            label: 'Your profile should match YOUR situation',
            emoji: '🎯',
          ),
          GameOption(
            label: 'Only aggressive investing works',
            emoji: '📈',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day1/lesson2/question.png',
      imagePrompt:
          'cartoon elderly person thinking about investments, question bubbles around, educational quiz style',
      questionData: QuestionData(
        question: 'Someone retiring next year should probably be:',
        options: [
          'Very aggressive',
          'More conservative',
          'It does not matter',
          'Only in crypto',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Profile Mission',
      imagePath: 'assets/images/lessons/day1/lesson2/mission.png',
      imagePrompt:
          'cartoon character choosing between different investor paths, glowing options, adventure style',
      missionData: MissionData(
        mission: 'What is the FIRST step before investing?',
        options: [
          'Buy the hottest stock',
          'Understand your investor profile',
          'Follow social media tips',
          'Wait for the perfect moment',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Self-Aware',
        badgeIcon: '🪞',
      ),
    ),
  ],
);
