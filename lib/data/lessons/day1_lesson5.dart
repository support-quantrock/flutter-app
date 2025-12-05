import '../../models/lesson_models.dart';

final day1Lesson5 = LessonData(
  day: 1,
  title: "Your First Mission",
  emoji: '🎯',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'Ready for Success',
      imagePath: 'assets/images/lessons/day1/lesson5/story.png',
      imagePrompt:
          'cartoon character putting on adventure gear, backpack with financial tools, determined expression, sunrise background symbolizing new beginning, inspiring style',
      content:
          '''You have learned what Quantrook is and how the challenge works.

Now it is time to set yourself up for success!

Your first mission: develop the right mindset and habits for this journey.''',
    ),

    // Screen 2: Content - Success Habits
    const LessonScreen(
      type: ScreenType.content,
      title: 'Habits for Success',
      imagePath: 'assets/images/lessons/day1/lesson5/content1.png',
      imagePrompt:
          'cartoon daily routine icons: morning sun, clock, notebook, checkmark, forming a circle of good habits, bright motivational style',
      content: '''Successful investors share certain habits.

Start building these habits from Day 1:''',
      bullets: [
        BulletPoint(
          icon: '⏰',
          title: 'Consistency',
          description: 'Do your lessons at the same time each day.',
        ),
        BulletPoint(
          icon: '📝',
          title: 'Take Notes',
          description: 'Write down key points and questions.',
        ),
        BulletPoint(
          icon: '🧠',
          title: 'Stay Curious',
          description: 'Ask why and dig deeper into topics.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Focus',
          description: 'Give your full attention during lessons.',
        ),
      ],
    ),

    // Screen 3: Content - Mindset
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Right Mindset',
      imagePath: 'assets/images/lessons/day1/lesson5/content2.png',
      imagePrompt:
          'cartoon brain glowing with positive thoughts, growth mindset words floating around, inspirational educational style',
      content: '''Your mindset determines your success.

Adopt these mental attitudes:''',
      bullets: [
        BulletPoint(
          icon: '🌱',
          title: 'Growth Mindset',
          description: 'Believe you can learn anything with practice.',
        ),
        BulletPoint(
          icon: '💪',
          title: 'Patience',
          description: 'Real learning takes time. Trust the process.',
        ),
        BulletPoint(
          icon: '🔄',
          title: 'Learn from Mistakes',
          description: 'Errors are lessons, not failures.',
        ),
        BulletPoint(
          icon: '🚀',
          title: 'Take Action',
          description: 'Knowledge without action is useless.',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Mindset Check',
      imagePath: 'assets/images/lessons/day1/lesson5/game1.png',
      imagePrompt:
          'cartoon two characters: one frustrated giving up, other smiling learning from mistake, comparison educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'You got a quiz question wrong. What should you do?',
        options: [
          GameOption(
            label: 'Give up, investing is too hard',
            emoji: '😞',
          ),
          GameOption(
            label: 'Learn why and try again',
            emoji: '💪',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find Success!',
      imagePath: 'assets/images/lessons/day1/lesson5/game2.png',
      imagePrompt:
          'cartoon three treasure chests labeled with different approaches to learning, one glowing with success, adventure game style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which habit leads to investment success?',
        options: [
          GameOption(
            label: 'Skip lessons when busy',
            emoji: '⏭️',
          ),
          GameOption(
            label: 'Consistent daily learning',
            emoji: '📚',
          ),
          GameOption(
            label: 'Rush through everything',
            emoji: '🏃',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day1/lesson5/question.png',
      imagePrompt:
          'cartoon character at crossroads choosing between instant results and patient learning paths, educational style',
      questionData: QuestionData(
        question: 'What kind of mindset helps you learn investing?',
        options: [
          'Fixed mindset - I am either good or not',
          'Growth mindset - I can improve with practice',
          'Lucky mindset - It is all about luck',
          'Fast mindset - I need results now',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Final Mission',
      imagePath: 'assets/images/lessons/day1/lesson5/mission.png',
      imagePrompt:
          'cartoon character making commitment, hand on heart, 28-day calendar behind, inspiring determination style',
      missionData: MissionData(
        mission: 'What is your commitment for this 28-day journey?',
        options: [
          'Complete lessons consistently every day',
          'Only do it when I feel like it',
          'Skip to the end',
          'Give up if it gets hard',
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Day 1 Champion',
        badgeIcon: '🎯',
      ),
    ),
  ],
);
