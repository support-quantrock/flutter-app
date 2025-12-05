import '../../models/lesson_models.dart';

final day2Lesson2 = LessonData(
  day: 2,
  title: "Value Over Price",
  emoji: '💎',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Hidden Treasure',
      imagePath: 'assets/images/lessons/day2/lesson2/story.png',
      imagePrompt:
          'cartoon treasure room with shiny distracting objects and one glowing true treasure chest labeled VALUE, wise owl pointing to it, adventure style',
      content:
          '''In a world full of shiny distractions, investors see something others miss.

They see VALUE, not just price.

Let me teach you how to spot the difference!''',
    ),

    // Screen 2: Content - Price vs Value
    const LessonScreen(
      type: ScreenType.content,
      title: 'Price vs Value',
      imagePath: 'assets/images/lessons/day2/lesson2/content1.png',
      imagePrompt:
          'cartoon comparison: expensive flashy item with low value vs simple item with high value glowing, educational comparison style',
      content: '''Price is what you pay. Value is what you get.

They are NOT the same thing!''',
      bullets: [
        BulletPoint(
          icon: '🏷️',
          title: 'Price',
          description: 'The number on the tag. What leaves your wallet.',
        ),
        BulletPoint(
          icon: '💎',
          title: 'Value',
          description: 'The real worth. What you actually receive.',
        ),
        BulletPoint(
          icon: '⚠️',
          title: 'The Trap',
          description: 'High price does not always mean high value.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'The Goal',
          description: 'Find things where value exceeds price.',
        ),
      ],
    ),

    // Screen 3: Content - Seeing Value
    const LessonScreen(
      type: ScreenType.content,
      title: 'How Investors See Value',
      imagePath: 'assets/images/lessons/day2/lesson2/content2.png',
      imagePrompt:
          'cartoon investor with special glasses seeing beyond surface to true value of items, x-ray vision style, educational',
      content: '''Investors ask different questions than consumers.

They look beyond the surface:''',
      bullets: [
        BulletPoint(
          icon: '🔍',
          title: 'Look Deeper',
          description: 'What is this really worth, not what does it cost?',
        ),
        BulletPoint(
          icon: '⏰',
          title: 'Think Long-Term',
          description: 'Will this be valuable in 5 years?',
        ),
        BulletPoint(
          icon: '📊',
          title: 'Compare Fairly',
          description: 'Is there better value elsewhere?',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Focus on Returns',
          description: 'What will I get back from this?',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Value Hunt',
      imagePath: 'assets/images/lessons/day2/lesson2/game1.png',
      imagePrompt:
          'cartoon comparison of expensive toy vs affordable book that teaches skills, value decision game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which has MORE value for building wealth?',
        options: [
          GameOption(
            label: 'Expensive designer item (\$500)',
            emoji: '👜',
          ),
          GameOption(
            label: 'Book that teaches investing (\$20)',
            emoji: '📚',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find Real Value!',
      imagePath: 'assets/images/lessons/day2/lesson2/game2.png',
      imagePrompt:
          'cartoon three treasure chests: one fancy but empty, one hyped but fake, one simple but glowing with real gold, adventure style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which chest contains REAL value?',
        options: [
          GameOption(
            label: 'Highest Price Tag',
            emoji: '💰',
          ),
          GameOption(
            label: 'Most Advertised',
            emoji: '📺',
          ),
          GameOption(
            label: 'Best Long-Term Worth',
            emoji: '🏆',
          ),
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson2/question.png',
      imagePrompt:
          'cartoon investor examining items with magnifying glass, value assessment scene, educational style',
      questionData: QuestionData(
        question: 'What should an investor focus on when buying?',
        options: [
          'The brand name',
          'What friends think',
          'The real value received',
          'The biggest discount',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Value Mission',
      imagePath: 'assets/images/lessons/day2/lesson2/mission.png',
      imagePrompt:
          'cartoon character choosing between flashy options and valuable options, decision moment, bright educational style',
      missionData: MissionData(
        mission: 'Before buying anything, what question should you ask?',
        options: [
          'Is it on sale?',
          'Will future me thank me for this?',
          'Does it look expensive?',
          'Is it popular right now?',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 8,
        badgeName: 'Value Hunter',
        badgeIcon: '💎',
      ),
    ),
  ],
);
