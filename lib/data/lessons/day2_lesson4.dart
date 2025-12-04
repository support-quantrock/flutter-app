import '../../models/lesson_models.dart';

final day2Lesson4 = LessonData(
  day: 2,
  title: "Emotional Control (Mastering Investor Emotions)",
  emoji: '🎭',
  screens: [
    // Screen 1: Story - "The Emotional Rollercoaster"
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Emotional Rollercoaster',
      imagePath: 'assets/images/lessons/day2/lesson4/story.png',
      videoPath: 'assets/videos/lessons/day2/lesson4/story_animation.mp4',
      imagePrompt:
          'cartoon rollercoaster shaped like a volatile stock market chart, cute character holding fear and greed glowing orbs, educational colorful style',
      content: '''You find yourself in front of a giant cartoon rollercoaster shaped like a stock market chart.
The tracks go up…
then down…
then sideways…
just like market prices.

A cartoon mentor appears, holding two glowing orbs:
🔥 Fear (blue orb trembling)
💰 Greed (red orb pulsing)

He says:

"Most people let emotions control their decisions.
Investors learn to ride the rollercoaster without falling."

He hands you a glowing seatbelt labeled:
"Discipline."''',
    ),

    // Screen 2: Game - Fear in Investing
    const LessonScreen(
      type: ScreenType.game,
      title: 'Fear in Investing',
      imagePath: 'assets/images/lessons/day2/lesson4/game1_fear.png',
      imagePrompt:
          'cartoon investor scared by a tiny red candle on a chart, exaggerated fearful expression, cute educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What does FEAR cause beginners to do?',
        options: [
          GameOption(
            label: 'Wait patiently for recovery',
            emoji: '⏳',
          ),
          GameOption(
            label: 'Sell too quickly when price drops',
            emoji: '😱',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 3: Game - Greed in Investing
    const LessonScreen(
      type: ScreenType.game,
      title: 'Greed in Investing',
      imagePath: 'assets/images/lessons/day2/lesson4/game2_greed.png',
      imagePrompt:
          'cartoon greedy investor chasing flying gold coins with excited expression, playful educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What does GREED cause investors to do?',
        options: [
          GameOption(
            label: 'Follow logic and stick to the plan',
            emoji: '📋',
          ),
          GameOption(
            label: 'Chase trends and hold too long',
            emoji: '🤑',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 4: Game - Discipline Shield
    const LessonScreen(
      type: ScreenType.game,
      title: 'The Discipline Shield',
      imagePath: 'assets/images/lessons/day2/lesson4/game3_discipline.png',
      imagePrompt:
          'cartoon investor holding a glowing shield labeled Discipline blocking fear and greed monsters, cute educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'What protects investors from emotional mistakes?',
        options: [
          GameOption(
            label: 'Following the crowd',
            emoji: '👥',
          ),
          GameOption(
            label: 'Discipline and sticking to a plan',
            emoji: '🛡️',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 5: Game - Pop the Correct Emotion (Balloon)
    const LessonScreen(
      type: ScreenType.game,
      title: 'Pop the Correct Emotion',
      imagePath: 'assets/images/lessons/day2/lesson4/game4_balloon.png',
      imagePrompt:
          'cartoon game with floating balloons labeled fear, greed, and discipline; the discipline balloon glowing gold; fun colorful style',
      gameData: GameData(
        type: 'balloon',
        instruction: 'Tap the emotion that leads to investor SUCCESS!',
        options: [
          GameOption(
            label: 'Discipline',
            emoji: '🎯',
          ),
          GameOption(
            label: 'Fear',
            emoji: '😨',
          ),
          GameOption(
            label: 'Greed',
            emoji: '🤑',
          ),
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 6: Question - Multiple Choice
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day2/lesson4/question.png',
      imagePrompt:
          'cartoon investor hurriedly pressing sell button due to fear of small price drop, cute educational style',
      questionData: QuestionData(
        question: 'Which emotion causes investors to sell too EARLY?',
        options: [
          'Greed',
          'Fear',
          'Discipline',
          'Excitement',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 7: Mission - Emotional Strength Test
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Your Mission',
      imagePath: 'assets/images/lessons/day2/lesson4/mission.png',
      imagePrompt:
          'cartoon character following a glowing financial plan scroll while ignoring fear and greed creatures behind, cute educational style',
      missionData: MissionData(
        mission: 'Which habit will help you become more emotionally stable when investing?',
        options: [
          'Check the price every 5 minutes',
          'Follow the crowd',
          'React emotionally to news',
          'Stick to a plan even when emotions rise',
        ],
        correctIndex: 3,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 9,
        badgeName: 'Emotion Controller',
        badgeIcon: '🎭',
      ),
    ),
  ],
);
