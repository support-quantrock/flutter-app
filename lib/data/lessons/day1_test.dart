import '../../models/lesson_models.dart';

final day1Test = LessonData(
  day: 1,
  title: "Day 1 Final Test",
  emoji: '📝',
  screens: [
    // Question 1
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 1',
      imagePath: 'assets/images/lessons/day1/test/q1.png',
      imagePrompt:
          'cartoon quiz show stage with question mark spotlight, exciting test atmosphere, colorful educational style',
      questionData: QuestionData(
        question: 'What is the main purpose of Quantrook?',
        options: [
          'Social media platform',
          'Learning to invest through gamified lessons',
          'Online shopping',
          'Video streaming',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 2
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 2',
      imagePath: 'assets/images/lessons/day1/test/q2.png',
      imagePrompt:
          'cartoon three investor types: turtle, owl, lion representing different risk levels, educational quiz style',
      questionData: QuestionData(
        question: 'What does a CONSERVATIVE investor prefer?',
        options: [
          'High risk, high reward',
          'Safety over high returns',
          'Only cryptocurrency',
          'Day trading',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 3
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 3',
      imagePath: 'assets/images/lessons/day1/test/q3.png',
      imagePrompt:
          'cartoon 28-day calendar with progress checkmarks, challenge journey visualization, motivational style',
      missionData: MissionData(
        mission: 'How many lessons are there per day in the 28-Day Challenge?',
        options: [
          '3 lessons',
          '5 lessons',
          '7 lessons',
          '10 lessons',
        ],
        correctIndex: 1,
      ),
    ),

    // Question 4
    const LessonScreen(
      type: ScreenType.question,
      title: 'Test Question 4',
      imagePath: 'assets/images/lessons/day1/test/q4.png',
      imagePrompt:
          'cartoon app interface showing Challenge section highlighted, navigation tutorial style',
      questionData: QuestionData(
        question: 'Where do you complete your daily lessons in Quantrook?',
        options: [
          'AI Picks section',
          'Forecast section',
          'Challenge section',
          'Settings',
        ],
        correctIndex: 2,
      ),
    ),

    // Question 5
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Test Question 5',
      imagePath: 'assets/images/lessons/day1/test/q5.png',
      imagePrompt:
          'cartoon brain with growth arrows, learning mindset visualization, inspiring educational style',
      missionData: MissionData(
        mission: 'Which mindset helps you succeed in learning to invest?',
        options: [
          'Fixed mindset - talent is everything',
          'Growth mindset - I can improve with practice',
          'Giving up when things get hard',
          'Skipping difficult topics',
        ],
        correctIndex: 1,
      ),
    ),

    // Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 15,
        badgeName: 'Day 1 Complete',
        badgeIcon: '✅',
      ),
    ),
  ],
);
