import '../../models/lesson_models.dart';

final day2Test = LessonData(
  day: 2,
  title: "The Investor Mindset Exam",
  emoji: '📝',
  screens: [
    // Screen 1: Story - "The Hall of Mastery"
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Hall of Mastery',
      imagePath: 'assets/images/lessons/day2/test/story.png',
      videoPath: 'assets/videos/lessons/day2/test/story_animation.mp4',
      imagePrompt:
          'cartoon glowing exam hall with floating crystal platforms showing investing symbols, cute robot examiner holding a shiny scroll, bright educational style',
      content: '''You enter a giant glowing hall with floating crystal platforms.
Each platform displays symbols from today's lessons:

🧠 Mindset
💰 Value
📈 Long-term
🛡 Discipline
🌱 Compounding

A golden robot examiner floats toward you holding a shining test scroll.

He says:

"To graduate from Day 2…
You must prove you think like an investor."''',
    ),

    // Question 1: Consumer vs Investor Mindset
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 1 of 5',
      imagePath: 'assets/images/lessons/day2/test/q1.png',
      imagePrompt:
          'cartoon character choosing between spending vs investing options, investor choice glowing, cute educational style',
      questionData: QuestionData(
        question: 'Which action represents an INVESTOR mindset?',
        options: [
          'Spend all salary first',
          'Buy something after payday',
          'Invest before spending',
          'Follow every trend',
        ],
        correctIndex: 2,
      ),
    ),

    // Question 2: Value Over Price
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 2 of 5',
      imagePath: 'assets/images/lessons/day2/test/q2.png',
      imagePrompt:
          'cartoon comparison of glowing valuable asset vs flashy overpriced toy, cute educational art',
      questionData: QuestionData(
        question: 'What has REAL value, not just a high price?',
        options: [
          'A shiny hype product',
          'A skill or asset that grows',
          'A famous logo',
          'A trending toy',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 3: Long-Term Vision
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 3 of 5',
      imagePath: 'assets/images/lessons/day2/test/q3.png',
      imagePrompt:
          'cartoon chart comparing short-term chaotic volatility vs long-term smooth upward growth, educational cute style',
      questionData: QuestionData(
        question: 'Which chart shows the TRUE path of wealth growth?',
        options: [
          'Daily noisy ups and downs',
          'Weekly chaotic spikes',
          'Monthly corrections',
          'Long-term smooth upward trend',
        ],
        correctIndex: 3,
      ),
    ),

    // Question 4: Emotional Control
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 4 of 5',
      imagePath: 'assets/images/lessons/day2/test/q4.png',
      imagePrompt:
          'cartoon investor panicking and pressing sell because of small chart drop, cute educational style',
      questionData: QuestionData(
        question: 'Which emotion causes beginners to sell too EARLY?',
        options: [
          'Greed',
          'Fear',
          'Discipline',
          'Excitement',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 5: Compounding
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 5 of 5',
      imagePath: 'assets/images/lessons/day2/test/q5.png',
      imagePrompt:
          'cartoon compounding growth chart showing early start advantage, cute character celebrating, educational style',
      questionData: QuestionData(
        question: 'What makes compounding the MOST powerful?',
        options: [
          'Starting late',
          'One-time investing',
          'Starting early and investing regularly',
          'Checking prices daily',
        ],
        correctIndex: 2,
      ),
    ),

    // Reward Screen
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 15,
        badgeName: 'Investor Mindset Pro',
        badgeIcon: '🎓',
      ),
    ),
  ],
);
