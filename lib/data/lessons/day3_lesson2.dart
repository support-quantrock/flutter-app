import '../../models/lesson_models.dart';

final day3Lesson2 = LessonData(
  day: 3,
  title: "Pay Yourself First",
  emoji: '🥇',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Golden Rule',
      imagePath: 'assets/images/lessons/day3/lesson2/story.png',
      imagePrompt:
          'cartoon wealthy character putting gold coins into personal vault BEFORE paying bills, reversed priority visualization, golden glow educational style',
      content:
          '''The richest people in the world follow one simple rule: Pay Yourself First.

This means saving and investing BEFORE spending on anything else.

It sounds backwards, but it is the secret to wealth!''',
    ),

    // Screen 2: Content - The Wrong Way
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Wrong Way',
      imagePath: 'assets/images/lessons/day3/lesson2/content1.png',
      imagePrompt:
          'cartoon frustrated person with empty wallet after paying all bills, nothing left to save, sad educational style',
      content: '''Most people do it backwards:

Income → Pay Bills → Buy Stuff → Save Whatever is Left

The problem? There is usually nothing left!''',
      bullets: [
        BulletPoint(
          icon: '❌',
          title: 'Step 1',
          description: 'Get paid.',
        ),
        BulletPoint(
          icon: '❌',
          title: 'Step 2',
          description: 'Pay all the bills first.',
        ),
        BulletPoint(
          icon: '❌',
          title: 'Step 3',
          description: 'Buy things you want.',
        ),
        BulletPoint(
          icon: '😢',
          title: 'Result',
          description: 'Nothing left to save or invest.',
        ),
      ],
    ),

    // Screen 3: Content - The Right Way
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Right Way',
      imagePath: 'assets/images/lessons/day3/lesson2/content2.png',
      imagePrompt:
          'cartoon happy person putting coins in savings jar FIRST, then paying bills with remaining money, smart priority visualization',
      content: '''Wealthy people flip the order:

Income → Pay Yourself First → Then Pay Everything Else

This guarantees you always save!''',
      bullets: [
        BulletPoint(
          icon: '✅',
          title: 'Step 1',
          description: 'Get paid.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'Step 2',
          description: 'IMMEDIATELY save/invest 10-20%.',
        ),
        BulletPoint(
          icon: '✅',
          title: 'Step 3',
          description: 'Pay bills and spend with the rest.',
        ),
        BulletPoint(
          icon: '🎉',
          title: 'Result',
          description: 'You ALWAYS build wealth, no matter what.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Priority Check',
      imagePath: 'assets/images/lessons/day3/lesson2/game1.png',
      imagePrompt:
          'cartoon two scenarios: person saving first vs person saving last, comparison of outcomes, educational game style',
      gameData: GameData(
        type: 'choice',
        instruction: 'You just got paid. What should you do FIRST?',
        options: [
          GameOption(
            label: 'Go shopping for new things',
            emoji: '🛍️',
          ),
          GameOption(
            label: 'Transfer money to savings/investments',
            emoji: '💰',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Balloon
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Right Order!',
      imagePath: 'assets/images/lessons/day3/lesson2/game2.png',
      imagePrompt:
          'cartoon balloons showing different payment priorities, one correct order glowing, colorful game atmosphere',
      gameData: GameData(
        type: 'balloon',
        instruction: 'What is the CORRECT first step after getting paid?',
        options: [
          GameOption(
            label: 'Pay all bills',
            emoji: '📄',
          ),
          GameOption(
            label: 'Save/invest a portion',
            emoji: '🏦',
          ),
          GameOption(
            label: 'Buy something nice',
            emoji: '🎁',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day3/lesson2/question.png',
      imagePrompt:
          'cartoon golden rule banner with pay yourself first written, quiz atmosphere',
      questionData: QuestionData(
        question: 'Why does "Pay Yourself First" work so well?',
        options: [
          'It makes you feel rich',
          'It guarantees savings before spending',
          'It is just a nice saying',
          'It helps you spend more',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Golden Rule Mission',
      imagePath: 'assets/images/lessons/day3/lesson2/mission.png',
      imagePrompt:
          'cartoon character setting up automatic transfer to savings account, smart automation visualization',
      missionData: MissionData(
        mission: 'How can you make "Pay Yourself First" automatic?',
        options: [
          'Remember to do it manually each month',
          'Set up automatic transfers on payday',
          'Wait until you feel like saving',
          'Only save when you have extra money',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Self-Payer',
        badgeIcon: '🥇',
      ),
    ),
  ],
);
