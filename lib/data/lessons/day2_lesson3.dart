import '../../models/lesson_models.dart';

final day2Lesson3 = LessonData(
  day: 2,
  title: "Long-Term Vision (Seeing the Big Picture)",
  emoji: '🔭',
  screens: [
    // Screen 1: Story - "The Sky View"
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Sky View',
      imagePath: 'assets/images/lessons/day2/lesson3/story.png',
      videoPath: 'https://drive.usercontent.google.com/download?id=1Rc7QpVr_B53FZdU0QHh5HPN4NsPuvJWA&export=download',
      imagePrompt:
          'cartoon futuristic elevator rising above clouds, showing glowing multi-year financial timeline in the sky, cute robot guide floating next to character, colorful educational style',
      content: '',
    ),

    // Screen 2: Game - Short-Term Noise
    const LessonScreen(
      type: ScreenType.game,
      title: 'Short-Term Noise',
      imagePath: 'assets/images/lessons/day2/lesson3/game1_short_term.png',
      imagePrompt:
          'cartoon chaotic short-term stock chart with exaggerated ups and downs, cute emotional icons reacting around it, simple educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What does short-term trading feel like for most beginners?',
        options: [
          GameOption(
            label: 'Calm and strategic',
            emoji: '😌',
          ),
          GameOption(
            label: 'Emotional rollercoaster',
            emoji: '🎢',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 3: Game - Medium-Term Direction
    const LessonScreen(
      type: ScreenType.game,
      title: 'Medium-Term Direction',
      imagePath: 'assets/images/lessons/day2/lesson3/game2_medium_term.png',
      imagePrompt:
          'cartoon medium-term financial chart showing smoother upward trend, cute character observing calmly, educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What do investors see in medium-term charts (months)?',
        options: [
          GameOption(
            label: 'Random chaos and panic',
            emoji: '😱',
          ),
          GameOption(
            label: 'Trends and patterns',
            emoji: '📊',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 4: Game - Long-Term Growth
    const LessonScreen(
      type: ScreenType.game,
      title: 'Long-Term Growth',
      imagePath: 'assets/images/lessons/day2/lesson3/game3_long_term.png',
      imagePrompt:
          'cartoon long-term financial chart with smooth upward trend turning into a growing money tree, sky background, cute educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What happens in long-term investing (years)?',
        options: [
          GameOption(
            label: 'Emotions get stronger',
            emoji: '😤',
          ),
          GameOption(
            label: 'Compounding multiplies results',
            emoji: '⏳',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Assemble the Timeline
    const LessonScreen(
      type: ScreenType.game,
      title: 'Assemble the Timeline',
      imagePath: 'assets/images/lessons/day2/lesson3/game4_timeline.png',
      imagePrompt:
          'cartoon puzzle pieces labeled short-term noise, medium-term trend, and long-term growth, user dragging them into a timeline, bright colorful game style',
      gameData: GameData(
        type: 'sequence',
        instruction: 'Put these in the correct order from chaos to clarity:',
        options: [
          GameOption(
            label: 'Long-term Growth',
            emoji: '🌳',
          ),
          GameOption(
            label: 'Short-term Noise',
            emoji: '📉',
          ),
          GameOption(
            label: 'Medium-term Direction',
            emoji: '📊',
          ),
        ],
        correctIndex: 1, // Correct order: Short(1) → Medium(2) → Long(0)
      ),
    ),

    // Screen 6: Question - Multiple Choice
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson3/question.png',
      imagePrompt:
          'cartoon character pointing to a long-term upward trend chart, with short-term volatility blurred in the background, cute educational style',
      questionData: QuestionData(
        question: 'Which time period shows the REAL growth of wealth?',
        options: [
          'Daily price moves',
          'Weekly spikes',
          'Monthly swings',
          'Long-term multi-year trend',
        ],
        correctIndex: 3,
      ),
    ),

    // Screen 7: Mission - Long-Term Challenge
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Your Mission',
      imagePath: 'assets/images/lessons/day2/lesson3/mission.png',
      imagePrompt:
          'cartoon character calmly reviewing a monthly chart while ignoring chaotic short-term charts floating behind, cute educational style',
      missionData: MissionData(
        mission: 'Which behavior will help you stay focused on long-term vision?',
        options: [
          'Checking charts every 5 minutes',
          'Reacting emotionally to news',
          'Ignoring daily noise and reviewing monthly',
          'Selling whenever price drops',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 7,
        badgeName: 'Big Picture Thinker',
        badgeIcon: '🔭',
      ),
    ),
  ],
);
