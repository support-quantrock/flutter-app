import '../../models/lesson_models.dart';

/// Comprehensive Final Test covering all 28 days of the investment challenge
/// This test includes one question from each day's topic
final finalTest = LessonData(
  day: 0, // Special day for final test
  title: "Ultimate Investment Mastery Test",
  emoji: '🏆',
  screens: [
    // Day 1: How to Start
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 1 of 28',
      questionData: QuestionData(
        question: 'What mindset is essential for learning to invest successfully?',
        options: [
          'Fixed mindset - talent is everything',
          'Growth mindset - improve with practice',
          'Get-rich-quick mindset',
          'Gambling mindset',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 2: What is Investing
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 2 of 28',
      questionData: QuestionData(
        question: 'What is the primary goal of investing?',
        options: [
          'Spending money quickly',
          'Growing wealth over time',
          'Avoiding all financial decisions',
          'Keeping cash under the mattress',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 3: Understanding Stocks
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 3 of 28',
      questionData: QuestionData(
        question: 'What does owning a stock represent?',
        options: [
          'A loan to a company',
          'Ownership in a company',
          'A government bond',
          'A savings account',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 4: Bonds Basics
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 4 of 28',
      questionData: QuestionData(
        question: 'What is a bond?',
        options: [
          'Company ownership',
          'A loan you give to an organization',
          'A type of cryptocurrency',
          'Real estate investment',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 5: Mutual Funds & ETFs
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 5 of 28',
      questionData: QuestionData(
        question: 'What is the main advantage of ETFs over mutual funds?',
        options: [
          'Higher fees',
          'Trade like stocks throughout the day',
          'Less diversification',
          'Only available to institutions',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 6: Index Funds
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 6 of 28',
      questionData: QuestionData(
        question: 'What does an index fund track?',
        options: [
          'A single company stock',
          'A market index like S&P 500',
          'Real estate prices',
          'Cryptocurrency values',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 7: Financial Derivatives
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 7 of 28',
      questionData: QuestionData(
        question: 'What is a derivative?',
        options: [
          'A type of savings account',
          'A contract whose value is derived from an underlying asset',
          'A government bond',
          'A company stock',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 8: Cryptocurrencies
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 8 of 28',
      questionData: QuestionData(
        question: 'What technology powers cryptocurrencies?',
        options: [
          'Traditional banking',
          'Blockchain technology',
          'Paper currency',
          'Stock exchanges',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 9: Web3 & DeFi
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 9 of 28',
      questionData: QuestionData(
        question: 'What does DeFi stand for?',
        options: [
          'Defined Finance',
          'Decentralized Finance',
          'Digital Fiat',
          'Derivative Funds',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 10: Risk Management
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 10 of 28',
      questionData: QuestionData(
        question: 'What is diversification?',
        options: [
          'Putting all money in one stock',
          'Spreading investments across different assets',
          'Only investing in bonds',
          'Avoiding the stock market',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 11: Technical Analysis Intro
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 11 of 28',
      questionData: QuestionData(
        question: 'What does technical analysis study?',
        options: [
          'Company financial statements',
          'Price charts and trading patterns',
          'Economic policies',
          'News headlines only',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 12: Advanced Technical Analysis
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 12 of 28',
      questionData: QuestionData(
        question: 'What is a moving average?',
        options: [
          'A fixed price target',
          'An average of prices over a specific period',
          'The maximum price ever reached',
          'A type of bond',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 13: Fundamental Analysis
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 13 of 28',
      questionData: QuestionData(
        question: 'What does fundamental analysis evaluate?',
        options: [
          'Chart patterns only',
          'Company financials and intrinsic value',
          'Social media trends',
          'Daily price movements',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 14: Economic Indicators
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 14 of 28',
      questionData: QuestionData(
        question: 'What does GDP measure?',
        options: [
          'Stock prices',
          'Total economic output of a country',
          'Individual company profits',
          'Interest rates',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 15: Portfolio Theory
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 15 of 28',
      questionData: QuestionData(
        question: 'What is asset allocation?',
        options: [
          'Buying only one type of asset',
          'Distributing investments among asset categories',
          'Selling all investments',
          'Ignoring portfolio balance',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 16: Investment Strategies
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 16 of 28',
      questionData: QuestionData(
        question: 'What is dollar-cost averaging?',
        options: [
          'Investing a lump sum at once',
          'Investing fixed amounts at regular intervals',
          'Only buying at market lows',
          'Selling at any price',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 17: Investor Psychology
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 17 of 28',
      questionData: QuestionData(
        question: 'What is FOMO in investing?',
        options: [
          'A trading strategy',
          'Fear Of Missing Out on gains',
          'A type of stock',
          'A market indicator',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 18: Global Markets
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 18 of 28',
      questionData: QuestionData(
        question: 'Why invest in international markets?',
        options: [
          'Higher taxes',
          'Greater diversification opportunities',
          'Avoid all regulations',
          'Less transparency',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 19: Passive vs Active
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 19 of 28',
      questionData: QuestionData(
        question: 'What characterizes passive investing?',
        options: [
          'Frequent trading',
          'Tracking a market index with low fees',
          'Trying to beat the market',
          'High management costs',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 20: ESG Investing
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 20 of 28',
      questionData: QuestionData(
        question: 'What does ESG stand for?',
        options: [
          'Extra Stock Gains',
          'Environmental, Social, Governance',
          'Essential Stock Guide',
          'Economic Stock Growth',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 21: Taxes
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 21 of 28',
      questionData: QuestionData(
        question: 'What is a capital gains tax?',
        options: [
          'Tax on salary income',
          'Tax on profit from selling investments',
          'Tax on groceries',
          'Tax on property',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 22: Retirement Planning
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 22 of 28',
      questionData: QuestionData(
        question: 'What is compound interest?',
        options: [
          'Simple interest only',
          'Earning interest on interest',
          'Fixed rate forever',
          'No growth over time',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 23: Real Estate
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 23 of 28',
      questionData: QuestionData(
        question: 'What is a REIT?',
        options: [
          'A cryptocurrency',
          'Real Estate Investment Trust',
          'A type of bond',
          'Retirement account',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 24: Alternative Investments
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 24 of 28',
      questionData: QuestionData(
        question: 'Which is an example of alternative investment?',
        options: [
          'Government bonds',
          'Commodities and collectibles',
          'Savings account',
          'CDs',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 25: Market Cycles
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 25 of 28',
      questionData: QuestionData(
        question: 'What is a bear market?',
        options: [
          'Market rising 20%+',
          'Market declining 20%+',
          'Stable market',
          'New market opening',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 26: Tools & Resources
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 26 of 28',
      questionData: QuestionData(
        question: 'What should you look for in a brokerage?',
        options: [
          'Highest fees',
          'Low fees and good tools',
          'No customer support',
          'Limited investment options',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 27: Investment Plan
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 27 of 28',
      questionData: QuestionData(
        question: 'What should your investment plan include?',
        options: [
          'Only short-term goals',
          'Goals, timeline, and risk tolerance',
          'Random stock picks',
          'No strategy at all',
        ],
        correctIndex: 1,
      ),
    ),

    // Day 28: Practical Application
    const LessonScreen(
      type: ScreenType.question,
      title: 'Question 28 of 28',
      questionData: QuestionData(
        question: 'What is the best time to start investing?',
        options: [
          'Wait until you are rich',
          'Start now with what you can',
          'Never invest',
          'Only during bull markets',
        ],
        correctIndex: 1,
      ),
    ),

    // Final Reward
    const LessonScreen(
      type: ScreenType.reward,
      rewardData: RewardData(
        coins: 100,
        badgeName: 'Investment Master',
        badgeIcon: '👑',
      ),
    ),
  ],
);
