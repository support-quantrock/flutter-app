import '../../models/lesson_models.dart';

final day2Lesson = LessonData(
  day: 2,
  title: "Entering the Investor's Gate",
  emoji: '🚪',
  screens: [
    // Screen 1: Story - "The Gate Awakens"
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Gate Awakens',
      imagePath: 'assets/images/lessons/day2/day2_screen1_story.png',
      videoPath: 'https://drive.google.com/uc?export=download&id=1qFjsb6o4cUEZ9BEzlrWud96lhnGq6ZjP',
      imagePrompt:
          'cartoon ancient stone gate glowing with blue runes in a magical forest, cute small guardian holding glowing lantern, fantasy adventure style, bright colors',
      content: '',
    ),

    // Screen 2: Content A - Consumer Mindset
    const LessonScreen(
      type: ScreenType.content,
      title: 'Consumer Mindset',
      imagePath: 'assets/images/lessons/day2/day2_screen2_consumer.png',
      imagePrompt:
          'cartoon character excitedly buying shiny objects impulsively, emotional spending behavior, bright playful style',
      content: '''The consumer mindset focuses on the now.
It follows emotions, not logic.

Here's how it behaves:''',
      bullets: [
        BulletPoint(
          icon: '🔴',
          title: 'Instant Gratification',
          description: 'Buys things immediately for temporary happiness.',
        ),
        BulletPoint(
          icon: '🔴',
          title: 'Emotional Spending',
          description:
              'Feels excited → buys. Feels stressed → buys. Feels bored → buys.',
        ),
        BulletPoint(
          icon: '🔴',
          title: 'Short-Term Thinking',
          description:
              '"What can I enjoy today?" not "What will this become tomorrow?"',
        ),
        BulletPoint(
          icon: '🔴',
          title: 'Money Outflow Pattern',
          description: 'Money comes in → gets spent → disappears → repeat cycle.',
        ),
      ],
    ),

    // Screen 3: Content B - Investor Mindset
    const LessonScreen(
      type: ScreenType.content,
      title: 'Investor Mindset',
      imagePath: 'assets/images/lessons/day2/day2_screen3_investor.png',
      imagePrompt:
          'cartoon investor calmly analyzing a simple chart on a glowing tablet, soft educational colors, cute logical style',
      content: '''The investor mindset is the opposite.
It focuses on growth, not pleasure.''',
      bullets: [
        BulletPoint(
          icon: '🟢',
          title: 'Long-Term Thinking',
          description: 'Plans for months or years ahead.',
        ),
        BulletPoint(
          icon: '🟢',
          title: 'Value Hunting',
          description: 'Asks: "What is this worth?" Not: "How shiny is it?"',
        ),
        BulletPoint(
          icon: '🟢',
          title: 'Logic Over Emotion',
          description: 'Decisions come from analysis, not moods.',
        ),
        BulletPoint(
          icon: '🟢',
          title: 'Wealth Creation Pattern',
          description:
              'Money comes in → saved → invested → grows → multiplies.',
        ),
      ],
    ),

    // Screen 4: Content C - The Shift Moment
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Shift Moment',
      imagePath: 'assets/images/lessons/day2/day2_screen4_shift.png',
      imagePrompt:
          'cartoon brain split-screen transforming from consumer mindset to investor mindset, glowing blue evolution effect, simple educational style',
      content:
          '''The shift from consumer to investor happens with one mindset upgrade:

❌ Consumer Question
"What can I buy right now?"

✅ Investor Question
"What can this become over time?"

This shift changes your life because:''',
      bullets: [
        BulletPoint(
          icon: '💡',
          title: 'You stop chasing pleasure',
          description: 'And start building wealth.',
        ),
        BulletPoint(
          icon: '💡',
          title: 'You stop reacting',
          description: 'And start planning.',
        ),
        BulletPoint(
          icon: '💡',
          title: 'You stop wasting',
          description: 'And start investing.',
        ),
      ],
    ),

    // Screen 5: Game - Choose the Right Mindset
    const LessonScreen(
      type: ScreenType.game,
      title: 'Choose the Right Mindset',
      imagePath: 'assets/images/lessons/day2/day2_screen5_game.png',
      imagePrompt:
          'cartoon shooting gallery with colorful balloons labeled spend first, save later, invest first — cute educational game style',
      gameData: GameData(
        type: 'balloon',
        instruction:
            'Three floating balloons appear! Tap the one that shows the investor mindset.',
        options: [
          GameOption(
            label: 'Buy something right after payday!',
            emoji: '🛍️',
          ),
          GameOption(
            label: 'Spend everything and save later!',
            emoji: '💸',
          ),
          GameOption(
            label: 'Invest before spending!',
            emoji: '📈',
          ),
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 6: Question - Yes or No
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/day2_screen6_question.png',
      imagePrompt:
          'cartoon characters comparing a short-term impulse icon vs a long-term growth chart, cute educational style',
      questionData: QuestionData(
        question:
            'Is long-term thinking more powerful than short-term spending?',
        options: ['Yes', 'No'],
        correctIndex: 0,
      ),
    ),

    // Screen 7: Mission - Multiple Choice
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Your Mission',
      imagePath: 'assets/images/lessons/day2/day2_screen7_mission.png',
      imagePrompt:
          'cartoon character selecting multiple-choice financial options on a glowing tablet, bright cute style',
      missionData: MissionData(
        mission:
            'Which action will help you MOST to start thinking like an investor?',
        options: [
          'Set aside money BEFORE spending',
          'Buy something every payday',
          'Decide emotionally when shopping',
          'Focus only on today\'s satisfaction',
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Gate Opener',
        badgeIcon: '🏅',
      ),
    ),
  ],
);
