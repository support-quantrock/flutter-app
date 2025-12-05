import '../../models/lesson_models.dart';

final day3Lesson5 = LessonData(
  day: 3,
  title: "The Wealth Building Formula",
  emoji: '🏆',
  screens: [
    // Screen 1: Story
    const LessonScreen(
      type: ScreenType.story,
      title: 'The Secret Formula',
      imagePath: 'assets/images/lessons/day3/lesson5/story.png',
      imagePrompt:
          'cartoon magical formula book opening to reveal wealth building equation: Time + Consistency = Wealth, glowing revelation style',
      content:
          '''Building wealth is not about luck or getting rich quick.

It is a simple formula that anyone can follow.

Time + Consistency = Wealth

Let me show you how it works!''',
    ),

    // Screen 2: Content - The Formula
    const LessonScreen(
      type: ScreenType.content,
      title: 'The Wealth Formula',
      imagePath: 'assets/images/lessons/day3/lesson5/content1.png',
      imagePrompt:
          'cartoon mathematical equation coming to life: small regular deposits plus time equals mountain of wealth, visual math educational style',
      content: '''Wealth building has three key ingredients:''',
      bullets: [
        BulletPoint(
          icon: '💵',
          title: 'Regular Contributions',
          description: 'Save and invest the same amount consistently.',
        ),
        BulletPoint(
          icon: '⏰',
          title: 'Time',
          description: 'Start early and let years work for you.',
        ),
        BulletPoint(
          icon: '📈',
          title: 'Compound Growth',
          description: 'Returns earning more returns.',
        ),
        BulletPoint(
          icon: '🎯',
          title: 'Patience',
          description: 'Stay the course through ups and downs.',
        ),
      ],
    ),

    // Screen 3: Content - Real Example
    const LessonScreen(
      type: ScreenType.content,
      title: 'See It In Action',
      imagePath: 'assets/images/lessons/day3/lesson5/content2.png',
      imagePrompt:
          'cartoon timeline showing small weekly savings growing over 30 years into large sum, visual growth journey, inspiring style',
      content: '''Example: Save just \$50 per week at 8% returns:''',
      bullets: [
        BulletPoint(
          icon: '📅',
          title: 'After 5 Years',
          description: '\$15,000 invested → Worth \$17,000',
        ),
        BulletPoint(
          icon: '📅',
          title: 'After 10 Years',
          description: '\$30,000 invested → Worth \$40,000',
        ),
        BulletPoint(
          icon: '📅',
          title: 'After 20 Years',
          description: '\$60,000 invested → Worth \$130,000',
        ),
        BulletPoint(
          icon: '🎉',
          title: 'After 30 Years',
          description: '\$90,000 invested → Worth \$340,000!',
        ),
      ],
    ),

    // Screen 4: Game - Choice
    const LessonScreen(
      type: ScreenType.game,
      title: 'Formula Check',
      imagePath: 'assets/images/lessons/day3/lesson5/game1.png',
      imagePrompt:
          'cartoon two investors: one consistent small investor vs one occasional big investor, comparison of results, educational style',
      gameData: GameData(
        type: 'choice',
        instruction: 'Which approach builds MORE wealth?',
        options: [
          GameOption(
            label: 'Invest \$100 every month for 20 years',
            emoji: '🐢',
          ),
          GameOption(
            label: 'Wait and invest \$24,000 at once in year 20',
            emoji: '🐇',
          ),
        ],
        correctIndex: 0,
      ),
    ),

    // Screen 5: Game - Treasure
    const LessonScreen(
      type: ScreenType.game,
      title: 'Find the Key!',
      imagePath: 'assets/images/lessons/day3/lesson5/game2.png',
      imagePrompt:
          'cartoon three keys to wealth vault: get rich quick, consistent investing, lottery ticket, one glowing gold, adventure style',
      gameData: GameData(
        type: 'treasure',
        instruction: 'Which is the REAL key to building wealth?',
        options: [
          GameOption(
            label: 'Get rich quick schemes',
            emoji: '⚡',
          ),
          GameOption(
            label: 'Consistency over time',
            emoji: '🔑',
          ),
          GameOption(
            label: 'Winning the lottery',
            emoji: '🎰',
          ),
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 6: Question
    const LessonScreen(
      type: ScreenType.question,
      title: 'Quick Check',
      imagePath: 'assets/images/lessons/day3/lesson5/question.png',
      imagePrompt:
          'cartoon wealth formula on blackboard, student thinking, quiz atmosphere',
      questionData: QuestionData(
        question: 'What matters MOST in building wealth?',
        options: [
          'Starting with a large sum',
          'Finding secret investments',
          'Time and consistency',
          'Taking big risks',
        ],
        correctIndex: 2,
      ),
    ),

    // Screen 7: Mission
    const LessonScreen(
      type: ScreenType.mission,
      title: 'Wealth Mission',
      imagePath: 'assets/images/lessons/day3/lesson5/mission.png',
      imagePrompt:
          'cartoon character at starting line of wealth marathon, long road ahead but clear path, motivational style',
      missionData: MissionData(
        mission: 'You want to build wealth. What should you do TODAY?',
        options: [
          'Wait until you earn more',
          'Start small but start NOW',
          'Look for shortcuts',
          'Do nothing until perfect conditions',
        ],
        correctIndex: 1,
      ),
    ),

    // Screen 8: Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 10,
        badgeName: 'Formula Master',
        badgeIcon: '🏆',
      ),
    ),
  ],
);
