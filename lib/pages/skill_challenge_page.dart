import 'package:flutter/material.dart';
import '../data/lessons/lesson_registry.dart';

class SkillChallengePage extends StatefulWidget {
  const SkillChallengePage({super.key});

  @override
  State<SkillChallengePage> createState() => _SkillChallengePageState();
}

class _SkillChallengePageState extends State<SkillChallengePage> {
  String _activeTab = 'training';
  String _challengeViewMode = 'global';
  bool _expandedChallenge = false;

  // Sponsors state
  String _activeSponsorTab = 'banking';
  int _activeSponsorIndex = 0;
  final PageController _sponsorPageController = PageController();

  // Championship state
  int _activeChampionshipIndex = 0;
  final PageController _championshipPageController = PageController();
  bool _expandedCard1 = false;
  bool _expandedCard4 = false;

  // 28-day challenge state - all days unlocked for testing
  int _currentDay = 28;
  final int _totalDays = 28;
  final Set<int> _expandedLessons = {};

  // Get day color based on slider gradient (green -> blue -> purple)
  Color _getDayColor(int day) {
    // Days 1-9: Green shades
    // Days 10-19: Blue shades
    // Days 20-28: Purple shades
    if (day <= 9) {
      return const Color(0xFF22C55E); // Green
    } else if (day <= 19) {
      return const Color(0xFF3B82F6); // Blue
    } else {
      return const Color(0xFFA855F7); // Purple
    }
  }

  Color _getDayColorLight(int day) {
    if (day <= 9) {
      return const Color(0xFFDCFCE7); // Light green
    } else if (day <= 19) {
      return const Color(0xFFDBEAFE); // Light blue
    } else {
      return const Color(0xFFF3E8FF); // Light purple
    }
  }

  // Sponsors Data
  final List<Map<String, dynamic>> _bankingSponsors = [
    {
      'id': 1,
      'title': 'Global Trade Bank',
      'subtitle':
          'Leading international banking solutions for traders and investors worldwide.',
      'badge': 'Elite',
      'badgeColor': const Color(0xFFFBBF24),
      'gradientColors': [const Color(0xFF1E3A8A), const Color(0xFF7C3AED)],
      'info': [
        {'icon': Icons.location_on, 'label': 'Location:', 'value': 'New York'},
        {'icon': Icons.people, 'label': 'Clients:', 'value': '50,000+'},
        {
          'icon': Icons.trending_up,
          'label': 'Services:',
          'value': 'Trading, Banking',
        },
        {
          'icon': Icons.calendar_today,
          'label': 'Established:',
          'value': '2005',
        },
      ],
    },
    {
      'id': 2,
      'title': 'Quantum Finance',
      'subtitle':
          'Premium financial services with advanced trading infrastructure and support.',
      'badge': 'Pro',
      'badgeColor': const Color(0xFF10B981),
      'gradientColors': [const Color(0xFF064E3B), const Color(0xFF0891B2)],
      'info': [
        {'icon': Icons.location_on, 'label': 'Location:', 'value': 'London'},
        {'icon': Icons.people, 'label': 'Clients:', 'value': '35,000+'},
        {
          'icon': Icons.trending_up,
          'label': 'Services:',
          'value': 'Investment, Wealth',
        },
        {
          'icon': Icons.calendar_today,
          'label': 'Established:',
          'value': '2010',
        },
      ],
    },
  ];

  final List<Map<String, dynamic>> _educationalSponsors = [
    {
      'id': 3,
      'title': 'Capital Academy',
      'subtitle':
          'The leading online company in e-learning, providing world-class education.',
      'badge': 'Elite',
      'badgeColor': const Color(0xFFFBBF24),
      'gradientColors': [const Color(0xFF1E3A8A), const Color(0xFF7C3AED)],
      'info': [
        {'icon': Icons.location_on, 'label': 'Location:', 'value': 'Dubai'},
        {'icon': Icons.people, 'label': 'Students:', 'value': '10,000+'},
        {
          'icon': Icons.trending_up,
          'label': 'Courses:',
          'value': 'Trading, Finance',
        },
        {
          'icon': Icons.calendar_today,
          'label': 'Established:',
          'value': '2018',
        },
      ],
    },
    {
      'id': 4,
      'title': 'Investing Academy',
      'subtitle':
          'The leading education institute in Saudi Arabia for investment excellence.',
      'badge': 'Pro',
      'badgeColor': const Color(0xFF10B981),
      'gradientColors': [const Color(0xFF064E3B), const Color(0xFF0891B2)],
      'info': [
        {
          'icon': Icons.location_on,
          'label': 'Location:',
          'value': 'Saudi Arabia',
        },
        {'icon': Icons.people, 'label': 'Students:', 'value': '5,000+'},
        {
          'icon': Icons.trending_up,
          'label': 'Courses:',
          'value': 'Investment, Markets',
        },
        {
          'icon': Icons.calendar_today,
          'label': 'Established:',
          'value': '2019',
        },
      ],
    },
  ];

  final List<Map<String, dynamic>> _mediaSponsors = [
    {
      'id': 5,
      'title': 'Crypto Masters Cup',
      'subtitle':
          'Exclusive cryptocurrency trading competition with cutting-edge analytics.',
      'badge': 'Premium',
      'badgeColor': const Color(0xFFF59E0B),
      'gradientColors': [const Color(0xFF7C2D12), const Color(0xFFDC2626)],
      'info': [
        {'icon': Icons.location_on, 'label': 'Location:', 'value': 'Digital'},
        {'icon': Icons.people, 'label': 'Traders:', 'value': '8,000+'},
        {'icon': Icons.bar_chart, 'label': 'Assets:', 'value': 'BTC, ETH, ALT'},
        {'icon': Icons.calendar_today, 'label': 'Launched:', 'value': '2022'},
      ],
    },
    {
      'id': 6,
      'title': 'Trade Media Network',
      'subtitle':
          'Global financial news and analysis platform for professional traders.',
      'badge': 'Premium',
      'badgeColor': const Color(0xFFF59E0B),
      'gradientColors': [const Color(0xFF7C2D12), const Color(0xFFDC2626)],
      'info': [
        {'icon': Icons.location_on, 'label': 'Location:', 'value': 'Singapore'},
        {'icon': Icons.people, 'label': 'Readers:', 'value': '2M+'},
        {
          'icon': Icons.bar_chart,
          'label': 'Coverage:',
          'value': 'Stocks, Forex',
        },
        {'icon': Icons.calendar_today, 'label': 'Launched:', 'value': '2020'},
      ],
    },
  ];

  // Championship Cards Data
  final List<Map<String, dynamic>> _challengeCards = [
    {
      'id': 1,
      'title': 'Investment Stage',
      'subtitle':
          'This optional stage is designed for professionals, beginners, and students to practice trading strategies in a simulated environment.',
      'badge': 'Optional',
      'badgeColor': const Color(0xFFFBBF24),
      'avatarIcon': Icons.gps_fixed,
      'gradientColors': [const Color(0xFF065F46), const Color(0xFF064E3B)],
      'info': [
        {
          'icon': Icons.gps_fixed,
          'label': 'Portfolio:',
          'value': '\$10K - \$100K',
        },
        {'icon': Icons.trending_up, 'label': 'Profit Target:', 'value': '6%'},
        {'icon': Icons.emoji_events, 'label': 'Min Trades:', 'value': '30'},
        {
          'icon': Icons.calendar_today,
          'label': 'Daily Loss:',
          'value': '5% Max',
        },
      ],
      'details': [
        'Begin trading at any time (no fixed start date)',
        'Select portfolio size: \$10,000 – \$50,000 – \$100,000',
        'Daily loss limit: 5%',
        'Total loss limit: 10%',
        'Profit threshold: 6% → victory to the top performer',
        'Maximum position size: 10% of total portfolio',
        'Minimum of 30 executed trades',
        'Required instruments: S&P 500 / Gold / Major Currencies / Bitcoin',
        'Account leverage: 1:1',
      ],
    },
    {
      'id': 4,
      'title': 'Skill Challenge',
      'subtitle':
          'Test your trading expertise through progressive challenges. Develop advanced strategies and compete with traders worldwide.',
      'badge': 'Expert',
      'badgeColor': const Color(0xFF8B5CF6),
      'avatarIcon': Icons.military_tech,
      'gradientColors': [const Color(0xFF4C1D95), const Color(0xFF5B21B6)],
      'info': [
        {'icon': Icons.emoji_events, 'label': 'Levels:', 'value': '5 Stages'},
        {'icon': Icons.emoji_events, 'label': 'Win Rate:', 'value': '65%+'},
        {'icon': Icons.gps_fixed, 'label': 'Challenges:', 'value': '50+'},
        {'icon': Icons.trending_up, 'label': 'Rewards:', 'value': 'Exclusive'},
      ],
      'details': [
        'Progressive difficulty across 5 challenge levels',
        'Master technical analysis and chart patterns',
        'Achieve minimum 65% win rate to advance',
        'Complete 50+ specialized trading challenges',
        'Earn exclusive badges and recognition',
        'Access to advanced trading tools and indicators',
        'Compete on global skill leaderboard',
        'Unlock premium educational content',
        'Connect with expert traders and mentors',
      ],
    },
  ];

  List<Map<String, dynamic>> get _currentSponsors {
    switch (_activeSponsorTab) {
      case 'banking':
        return _bankingSponsors;
      case 'educational':
        return _educationalSponsors;
      case 'media':
        return _mediaSponsors;
      default:
        return _bankingSponsors;
    }
  }

  @override
  void dispose() {
    _sponsorPageController.dispose();
    _championshipPageController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _lessons = [
    // Week 1: Getting Started
    {
      'day': 1,
      'icon': Icons.rocket_launch,
      'title': 'How to Start the Challenge',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 2,
      'icon': Icons.monetization_on,
      'title': 'What is Investing?',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 3,
      'icon': Icons.trending_up,
      'title': 'Understanding Stocks',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 4,
      'icon': Icons.description,
      'title': 'Bonds Basics',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 5,
      'icon': Icons.gps_fixed,
      'title': 'Mutual Funds & ETFs',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 6,
      'icon': Icons.bar_chart,
      'title': 'Introduction to Index Funds',
      'completed': true,
      'type': 'lesson',
    },
    // Week 2: Advanced Assets
    {
      'day': 7,
      'icon': Icons.assignment,
      'title': 'Financial Derivatives',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 8,
      'icon': Icons.currency_bitcoin,
      'title': 'Cryptocurrencies & Blockchain',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 9,
      'icon': Icons.language,
      'title': 'Web3, DeFi & Digital Assets',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 10,
      'icon': Icons.warning,
      'title': 'Risk Management Basics',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 11,
      'icon': Icons.trending_down,
      'title': 'Introduction to Technical Analysis',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 12,
      'icon': Icons.show_chart,
      'title': 'Advanced Technical Analysis',
      'completed': true,
      'type': 'lesson',
    },
    // Week 3: Analysis & Strategy
    {
      'day': 13,
      'icon': Icons.search,
      'title': 'Fundamental Analysis',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 14,
      'icon': Icons.public,
      'title': 'Economic Indicators',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 15,
      'icon': Icons.track_changes,
      'title': 'Portfolio Theory & Allocation',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 16,
      'icon': Icons.list_alt,
      'title': 'Investment Strategies',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 17,
      'icon': Icons.psychology,
      'title': 'Investor Psychology',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 18,
      'icon': Icons.travel_explore,
      'title': 'Global Markets',
      'completed': true,
      'type': 'lesson',
    },
    // Week 4: Specialized Topics
    {
      'day': 19,
      'icon': Icons.balance,
      'title': 'Passive vs Active Investing',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 20,
      'icon': Icons.eco,
      'title': 'ESG & Sustainable Investing',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 21,
      'icon': Icons.payments,
      'title': 'Taxes and Investing',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 22,
      'icon': Icons.beach_access,
      'title': 'Retirement Planning',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 23,
      'icon': Icons.home,
      'title': 'Real Estate Investing',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 24,
      'icon': Icons.palette,
      'title': 'Alternative Investments',
      'completed': true,
      'type': 'lesson',
    },
    // Final Week: Application
    {
      'day': 25,
      'icon': Icons.autorenew,
      'title': 'Market Cycles & Timing',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 26,
      'icon': Icons.construction,
      'title': 'Investment Tools & Resources',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 27,
      'icon': Icons.article,
      'title': 'Building Your Investment Plan',
      'completed': true,
      'type': 'lesson',
    },
    {
      'day': 28,
      'icon': Icons.emoji_events,
      'title': 'Final Day: Practical Application',
      'completed': false,
      'current': true,
      'type': 'lesson',
    },
    // Ultimate Final Test - covers all 28 days
    {
      'day': 0,
      'icon': Icons.workspace_premium,
      'title': 'Ultimate Investment Mastery Test',
      'completed': false,
      'type': 'finalTest',
    },
  ];

  final List<Map<String, dynamic>> _groupLeaderboard = [
    {
      'rank': 1,
      'name': 'Jake Thompson',
      'profit': '+20.1%',
      'trades': 40,
      'country': 'US',
      'profitAmount': '\$60,300',
      'equity': '\$360,300',
      'premium': true,
    },
    {
      'rank': 2,
      'name': 'Aiko Yamamoto',
      'profit': '+18.4%',
      'trades': 36,
      'country': 'JP',
      'profitAmount': '\$55,200',
      'equity': '\$355,200',
      'premium': true,
    },
    {
      'rank': 3,
      'name': 'Felix Schmidt',
      'profit': '+16.7%',
      'trades': 32,
      'country': 'DE',
      'profitAmount': '\$50,100',
      'equity': '\$350,100',
      'premium': false,
    },
    {
      'rank': 4,
      'name': 'Isabella Rossi',
      'profit': '+15.2%',
      'trades': 30,
      'country': 'IT',
      'profitAmount': '\$45,600',
      'equity': '\$345,600',
      'premium': true,
    },
    {
      'rank': 5,
      'name': 'Noah Williams',
      'profit': '+14.5%',
      'trades': 28,
      'country': 'GB',
      'profitAmount': '\$43,500',
      'equity': '\$343,500',
      'premium': false,
    },
    {
      'rank': 6,
      'name': 'Sophie Laurent',
      'profit': '+13.7%',
      'trades': 26,
      'country': 'FR',
      'profitAmount': '\$41,100',
      'equity': '\$341,100',
      'premium': true,
    },
    {
      'rank': 7,
      'name': 'Lucas Silva',
      'profit': '+12.8%',
      'trades': 24,
      'country': 'ES',
      'profitAmount': '\$38,400',
      'equity': '\$338,400',
      'premium': false,
    },
    {
      'rank': 8,
      'name': 'Emma Nguyen',
      'profit': '+11.9%',
      'trades': 22,
      'country': 'AU',
      'profitAmount': '\$35,700',
      'equity': '\$335,700',
      'premium': true,
    },
    {
      'rank': 9,
      'name': 'Oliver Park',
      'profit': '+11.2%',
      'trades': 20,
      'country': 'CA',
      'profitAmount': '\$33,600',
      'equity': '\$333,600',
      'premium': false,
    },
    {
      'rank': 10,
      'name': 'Chloe Kim',
      'profit': '+10.5%',
      'trades': 18,
      'country': 'US',
      'profitAmount': '\$31,500',
      'equity': '\$331,500',
      'premium': true,
    },
  ];

  final List<Map<String, dynamic>> _challengeLeaderboard = [
    {
      'rank': 1,
      'name': 'Sarah Chen',
      'profit': '+24.5%',
      'trades': 47,
      'country': 'US',
      'profitAmount': '\$73,500',
      'equity': '\$373,500',
      'premium': true,
    },
    {
      'rank': 2,
      'name': 'Alex Morgan',
      'profit': '+18.2%',
      'trades': 52,
      'country': 'GB',
      'profitAmount': '\$54,600',
      'equity': '\$354,600',
      'premium': false,
    },
    {
      'rank': 3,
      'name': 'Jordan Smith',
      'profit': '+15.8%',
      'trades': 41,
      'country': 'US',
      'profitAmount': '\$47,400',
      'equity': '\$347,400',
      'premium': true,
    },
    {
      'rank': 4,
      'name': 'Michael Brown',
      'profit': '+14.1%',
      'trades': 39,
      'country': 'CA',
      'profitAmount': '\$42,300',
      'equity': '\$342,300',
      'premium': true,
    },
    {
      'rank': 5,
      'name': 'Emma Wilson',
      'profit': '+13.5%',
      'trades': 35,
      'country': 'AU',
      'profitAmount': '\$40,500',
      'equity': '\$340,500',
      'premium': false,
    },
    {
      'rank': 6,
      'name': 'David Martinez',
      'profit': '+12.8%',
      'trades': 42,
      'country': 'ES',
      'profitAmount': '\$38,400',
      'equity': '\$338,400',
      'premium': true,
    },
    {
      'rank': 7,
      'name': 'Sophia Garcia',
      'profit': '+11.9%',
      'trades': 31,
      'country': 'IT',
      'profitAmount': '\$35,700',
      'equity': '\$335,700',
      'premium': false,
    },
    {
      'rank': 8,
      'name': 'James Anderson',
      'profit': '+11.2%',
      'trades': 37,
      'country': 'GB',
      'profitAmount': '\$33,600',
      'equity': '\$333,600',
      'premium': true,
    },
    {
      'rank': 9,
      'name': 'Olivia Taylor',
      'profit': '+10.7%',
      'trades': 33,
      'country': 'US',
      'profitAmount': '\$32,100',
      'equity': '\$332,100',
      'premium': false,
    },
    {
      'rank': 10,
      'name': 'Daniel Thomas',
      'profit': '+10.3%',
      'trades': 29,
      'country': 'DE',
      'profitAmount': '\$30,900',
      'equity': '\$330,900',
      'premium': true,
    },
  ];

  String _getCountryFlag(String countryCode) {
    final flags = {
      'US': '🇺🇸',
      'GB': '🇬🇧',
      'CN': '🇨🇳',
      'DE': '🇩🇪',
      'FR': '🇫🇷',
      'CA': '🇨🇦',
      'AU': '🇦🇺',
      'JP': '🇯🇵',
      'IT': '🇮🇹',
      'ES': '🇪🇸',
    };
    return flags[countryCode] ?? '🏳️';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Quantrock Challenges'),
                    _buildTabs(),
                    const SizedBox(height: 16),
                    if (_activeTab == 'training') ...[
                      _buildProgressHeader(),
                      _buildDayCalendar(),
                      _build28DayChallengeTitle(),
                      _buildLessonsList(),
                    ],
                    if (_activeTab == 'challenge') ...[
                      _buildLeaderboardCard(
                        title: 'Challenge Leaderboard',
                        gradientColors: [
                          const Color(0xFF7C3AED),
                          const Color(0xFF4C1D95),
                        ],
                        leaderboard: _challengeViewMode == 'global'
                            ? _challengeLeaderboard
                            : _groupLeaderboard,
                        viewMode: _challengeViewMode,
                        onViewModeChanged: (mode) =>
                            setState(() => _challengeViewMode = mode),
                        expanded: _expandedChallenge,
                        onExpandToggle: () => setState(
                          () => _expandedChallenge = !_expandedChallenge,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildChampionshipStagesSection(),
                      const SizedBox(height: 24),
                      _buildSponsorsSection(),
                    ],
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          Row(
            children: [
              _buildHeaderIcon(Icons.search),
              const SizedBox(width: 12),
              _buildHeaderIcon(Icons.star_border),
              const SizedBox(width: 12),
              _buildHeaderIcon(Icons.notifications_none),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF22C55E), // Green
              Color(0xFF3B82F6), // Blue
              Color(0xFFA855F7), // Purple
            ],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            // Outer glow
            BoxShadow(
              color: const Color.fromARGB(
                0,
                59,
                131,
                246,
              ).withValues(alpha: 0.3),
              blurRadius: 12,
              spreadRadius: 1,
            ),
            // Bottom shadow for depth
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              // Inner shadow (top-left highlight)
              BoxShadow(
                color: const Color.fromARGB(0, 255, 255, 255).withValues(alpha: 0.05),
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              _buildTab('Skill Challenge', 'training'),
              _buildTab('Leaderboard', 'challenge'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, String value) {
    final isActive = _activeTab == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _activeTab = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF22C55E), // Green
                      Color(0xFF3B82F6), // Blue
                      Color(0xFFA855F7), // Purple
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isActive
                ? [
                    // Raised shadow
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                    // Glow effect
                    BoxShadow(
                      color: const Color(0xFF3B82F6).withValues(alpha: 0.4),
                      blurRadius: 8,
                      spreadRadius: -2,
                    ),
                  ]
                : null,
          ),
          child: Stack(
            children: [
              // Highlight overlay for 3D effect
              if (isActive)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.25),
                          Colors.white.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : Colors.white54,
                    shadows: isActive
                        ? [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              offset: const Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 28-day Skill Challenge Methods
  Widget _buildProgressHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Color(0xFF8B5CF6),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Day $_currentDay out of $_totalDays',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // QIPA badge hidden
          const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildDayCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(28, (index) {
              final day = index + 1;
              final isCompleted = day < _currentDay;
              final isCurrent = day == _currentDay;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: GestureDetector(
                  onTap: () {
                    if (day <= _currentDay) {
                      setState(() => _currentDay = day);
                    }
                  },
                  child: Column(
                    children: [
                      // Day circle with gradient border for current day
                      isCurrent
                          ? Container(
                              width: 48,
                              height: 48,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF22C55E), // Green
                                    Color(0xFF3B82F6), // Blue
                                    Color(0xFFA855F7), // Purple
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF6B7280), // Gray
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'D$day',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: 44,
                              height: 44,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF818CF8), // Light indigo
                                    Color(0xFF6366F1), // Indigo
                                    Color(0xFF7C3AED), // Violet
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: isCompleted
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    : Text(
                                        'D$day',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _build28DayChallengeTitle() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              '28 days skills',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF1E293B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: const Text(
                    '28-Day Skill Challenge',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: const Text(
                    'Complete daily lessons to master investment skills. Each day unlocks new content and builds on previous knowledge.',
                    style: TextStyle(color: Colors.white70),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Got it'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.white70,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(_lessons.length, (index) {
          final lesson = _lessons[index];
          final isLast = index == _lessons.length - 1;
          final day = lesson['day'] as int;
          return Column(
            children: [
              _buildLessonCard(lesson),
              if (!isLast) _buildPathIcons(index, day),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPathIcons(int dayIndex, int currentDay) {
    // Create a single diagonal pattern - odd days L→R, even days R→L
    final isOdd = dayIndex % 2 == 1;
    final isCompleted = currentDay < _currentDay;
    final isTestDay = (dayIndex + 1) % 6 == 0; // Every 6th position is a test

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final centerX = width / 2;
        final offset = 70.0; // How far icons spread from center

        // Calculate start and end X positions for diagonal
        final startX = isOdd ? centerX - offset : centerX + offset;
        final endX = isOdd ? centerX + offset : centerX - offset;

        // Helper to calculate X position for each icon (0-5)
        double getX(int index) {
          return startX + (endX - startX) * (index / 5) - 25;
        }

        return SizedBox(
          height: 360,
          child: Stack(
            children: [
              // Lesson Icon 1 → Lesson 1
              Positioned(
                top: 20,
                left: getX(0),
                child: _buildInteractiveLessonIcon(
                  day: currentDay,
                  lessonNumber: 1,
                  isCompleted: isCompleted,
                ),
              ),
              // Lesson Icon 2 → Lesson 2
              Positioned(
                top: 75,
                left: getX(1),
                child: _buildInteractiveLessonIcon(
                  day: currentDay,
                  lessonNumber: 2,
                  isCompleted: isCompleted,
                ),
              ),
              // Lesson Icon 3 → Lesson 3
              Positioned(
                top: 130,
                left: getX(2),
                child: _buildInteractiveLessonIcon(
                  day: currentDay,
                  lessonNumber: 3,
                  isCompleted: isCompleted,
                ),
              ),
              // Lesson Icon 4 → Lesson 4
              Positioned(
                top: 185,
                left: getX(3),
                child: _buildInteractiveLessonIcon(
                  day: currentDay,
                  lessonNumber: 4,
                  isCompleted: isCompleted,
                ),
              ),
              // Lesson Icon 5 → Lesson 5
              Positioned(
                top: 240,
                left: getX(4),
                child: _buildInteractiveLessonIcon(
                  day: currentDay,
                  lessonNumber: 5,
                  isCompleted: isCompleted,
                ),
              ),
              // Test Icon (position 6) → Lesson 6 (Test)
              Positioned(
                top: 295,
                left: getX(5),
                child: _buildInteractiveLessonIcon(
                  day: currentDay,
                  lessonNumber: 6,
                  isCompleted: isCompleted,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _emojiToIcon(String emoji) {
    const emojiIconMap = {
      '🚀': Icons.rocket_launch,
      '💰': Icons.monetization_on,
      '📈': Icons.trending_up,
      '📄': Icons.description,
      '🎯': Icons.gps_fixed,
      '📊': Icons.bar_chart,
      '📋': Icons.assignment,
      '₿': Icons.currency_bitcoin,
      '🌐': Icons.language,
      '⚠️': Icons.warning,
      '📉': Icons.trending_down,
      '🔍': Icons.search,
      '🌍': Icons.public,
      '🧠': Icons.psychology,
      '🌎': Icons.travel_explore,
      '⚖️': Icons.balance,
      '🌱': Icons.eco,
      '💵': Icons.payments,
      '🏖️': Icons.beach_access,
      '🏠': Icons.home,
      '🎨': Icons.palette,
      '🔄': Icons.autorenew,
      '🧰': Icons.construction,
      '📜': Icons.article,
      '🏆': Icons.emoji_events,
      '👑': Icons.workspace_premium,
      '📚': Icons.menu_book,
      '✅': Icons.check_circle,
      '📝': Icons.edit_note,
    };
    return emojiIconMap[emoji] ?? Icons.school;
  }

  Widget _buildInteractiveLessonIcon({
    required int day,
    required int lessonNumber,
    required bool isCompleted,
  }) {
    final lesson = LessonRegistry.getLessonByNumber(day, lessonNumber);
    final icon = _emojiToIcon(lesson?.emoji ?? '📚');
    final isLocked = day > _currentDay;
    final isCurrent = day == _currentDay;
    final hasLesson = lesson != null;

    return GestureDetector(
      onTap: () {
        if (!isLocked) {
          _showLessonPopup(day, lessonNumber);
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isCompleted
                ? [const Color(0xFF10B981), const Color(0xFF059669)]
                : isCurrent && hasLesson
                ? [const Color(0xFF8B5CF6), const Color(0xFF6366F1)]
                : [
                    const Color(0xFF6366F1),
                    const Color(0xFF6366F1).withValues(alpha: 0.8),
                  ],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color:
                  (isCurrent && hasLesson
                          ? const Color(0xFF8B5CF6)
                          : const Color(0xFF6366F1))
                      .withValues(alpha: 0.5),
              blurRadius: 16,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          border: isCurrent && hasLesson
              ? Border.all(color: Colors.white, width: 2)
              : null,
        ),
        child: Center(child: Icon(icon, color: Colors.white, size: 20)),
      ),
    );
  }

  void _showLessonPopup(int day, int lessonNumber) {
    final lesson = LessonRegistry.getLessonByNumber(day, lessonNumber);
    final icon = _emojiToIcon(lesson?.emoji ?? '📚');
    final title = lesson?.title ?? 'Lesson $lessonNumber';
    final isCompleted = false; // TODO: Track completion status

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF1E293B),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(icon, color: Colors.white, size: 32),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Day ${day.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B5CF6),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _getLessonDescription(day),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.7),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                if (LessonRegistry.hasLessonNumber(day, lessonNumber)) {
                  Navigator.pushNamed(
                    context,
                    '/lesson',
                    arguments: {'day': day, 'lessonNumber': lessonNumber},
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Day $day Lesson $lessonNumber coming soon!',
                      ),
                      backgroundColor: const Color(0xFF6366F1),
                    ),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isCompleted ? Icons.replay : Icons.play_arrow,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isCompleted ? 'Review Lesson' : 'Start Lesson',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingIcon({
    required IconData icon,
    required bool isCompleted,
    bool isMilestone = false,
  }) {
    final color = isCompleted
        ? const Color(0xFF10B981)
        : const Color(0xFF6366F1);

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isMilestone
              ? [const Color(0xFF8B5CF6), const Color(0xFF6366F1)]
              : [color, color.withValues(alpha: 0.8)],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: (isMilestone ? const Color(0xFF8B5CF6) : color).withValues(
              alpha: 0.5,
            ),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }

  Widget _buildLessonCard(Map<String, dynamic> lesson) {
    final day = lesson['day'] as int;
    final icon = lesson['icon'] as IconData;
    final title = lesson['title'] as String;
    final isCompleted = lesson['completed'] as bool;
    final isCurrent = lesson['current'] == true;
    final isLocked =
        day > _currentDay && day != 0; // Final test (day 0) is never locked
    final isTest = lesson['type'] == 'test';
    final isFinalTest = lesson['type'] == 'finalTest';
    final isExpanded = isFinalTest || _expandedLessons.contains(day);
    final isDay2 =
        day == 2; // Day 2 is a header only - lesson is in floating icon

    return GestureDetector(
      onTap: () {
        if (!isLocked && !isDay2) {
          setState(() {
            if (isExpanded) {
              _expandedLessons.remove(day);
            } else {
              _expandedLessons.add(day);
            }
          });
        }
      },
      child: Container(
        decoration: isCompleted
            ? BoxDecoration(
                // Completed: gradient fill
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF22C55E), // Green
                    Color(0xFF3B82F6), // Blue
                    Color(0xFFA855F7), // Purple
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withValues(alpha: 0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : isLocked
            ? BoxDecoration(
                // Locked: solid gray
                color: const Color(0xFF2A2A3E),
                borderRadius: BorderRadius.circular(16),
              )
            : BoxDecoration(
                // Active: gradient border with gray inside
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF22C55E), // Green
                    Color(0xFF3B82F6), // Blue
                    Color(0xFFA855F7), // Purple
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
        padding: (!isCompleted && !isLocked) ? const EdgeInsets.all(2) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: (!isCompleted && !isLocked)
              ? BoxDecoration(
                  color: const Color(0xFF1E1E2E),
                  borderRadius: BorderRadius.circular(14),
                )
              : null,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    // Emoji icon or check for completed
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B7280), // Gray
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 24,
                              )
                            : isFinalTest
                            ? const Icon(
                                Icons.emoji_events,
                                color: Colors.white,
                                size: 24,
                              )
                            : isTest && !isLocked
                            ? const Icon(
                                Icons.quiz,
                                color: Colors.white,
                                size: 24,
                              )
                            : Icon(icon, color: Colors.white, size: 22),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Day badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isLocked
                            ? Colors.grey.withValues(alpha: 0.2)
                            : isCompleted
                            ? Colors.white.withValues(alpha: 0.2)
                            : isFinalTest
                            ? Colors.white.withValues(alpha: 0.3)
                            : isTest
                            ? const Color(0xFFF59E0B).withValues(alpha: 0.3)
                            : _getDayColorLight(day),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isFinalTest
                            ? 'FINAL'
                            : isTest
                            ? 'TEST'
                            : 'Day ${day.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isLocked
                              ? Colors.grey
                              : isCompleted
                              ? Colors.white
                              : isFinalTest
                              ? Colors.white
                              : isTest
                              ? const Color(0xFFB45309)
                              : _getDayColor(day),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Title
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: (isTest || isFinalTest)
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: isLocked
                              ? Colors.grey
                              : isCompleted
                              ? Colors.white
                              : isFinalTest
                              ? Colors.white
                              : isTest
                              ? const Color(0xFFB45309)
                              : const Color(0xFF1F2937),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Arrow or lock icon (not shown for Day 2)
                    if (isLocked)
                      Icon(
                        Icons.lock,
                        color: Colors.grey.withValues(alpha: 0.5),
                        size: 20,
                      )
                    else if (isCompleted)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 24,
                      )
                    else if (!isDay2)
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: isFinalTest
                              ? Colors.white
                              : isTest
                              ? const Color(0xFFB45309)
                              : Colors.grey.shade600,
                          size: 24,
                        ),
                      ),
                  ],
                ),
              ),
              // Expanded content (not shown for Day 2)
              if (isExpanded && !isLocked && !isDay2)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                  decoration: BoxDecoration(
                    color: isFinalTest ? const Color(0xFF1A1A2E) : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: isFinalTest
                            ? Colors.white24
                            : Colors.grey.shade200,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isFinalTest ? 'Ultimate Challenge' : 'Lesson Overview',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isFinalTest
                              ? Colors.white70
                              : Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isFinalTest
                            ? '28 questions covering all topics from the challenge. Prove your investment mastery and earn 100 QP!'
                            : _getLessonDescription(day),
                        style: TextStyle(
                          fontSize: 13,
                          color: isFinalTest
                              ? Colors.white70
                              : Colors.grey.shade700,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to lesson/test
                                if (isFinalTest) {
                                  Navigator.pushNamed(
                                    context,
                                    '/lesson',
                                    arguments: {'day': 0, 'lessonNumber': 1},
                                  );
                                } else if (LessonRegistry.hasLesson(day)) {
                                  Navigator.pushNamed(
                                    context,
                                    '/lesson',
                                    arguments: {'day': day},
                                  );
                                } else {
                                  // Show coming soon message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Lesson $day coming soon!'),
                                      backgroundColor: const Color(0xFF6366F1),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: isFinalTest
                                        ? [
                                            const Color(0xFF7C3AED),
                                            const Color(0xFFFBBF24),
                                          ]
                                        : isTest
                                        ? [
                                            const Color(0xFFF59E0B),
                                            const Color(0xFFD97706),
                                          ]
                                        : [
                                            const Color(0xFF6366F1),
                                            const Color(0xFF8B5CF6),
                                          ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      isCompleted
                                          ? Icons.replay
                                          : isFinalTest
                                          ? Icons.emoji_events
                                          : isTest
                                          ? Icons.quiz
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      isCompleted
                                          ? (isFinalTest
                                                ? 'Retake Final'
                                                : isTest
                                                ? 'Review Test'
                                                : 'Review Lesson')
                                          : (isFinalTest
                                                ? 'Take Final Test'
                                                : isTest
                                                ? 'Start Test'
                                                : 'Start Lesson'),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.bookmark_border,
                              color: Colors.grey.shade600,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getLessonDescription(int day) {
    final descriptions = {
      1: 'Learn how to set up your Quantrook account and navigate the portfolio dashboard. Understand the basic features and tools available to you.',
      2: 'Discover the fundamentals of investing and what it takes to become a successful investor. Set your investment goals and mindset.',
      3: 'Master the core principles of saving, investing, and building long-term wealth. Learn about compound interest and financial planning.',
      4: 'Explore different financial markets including stocks, bonds, options, and other securities. Understand how each market works.',
      5: 'Dive into commodity markets and learn about trading precious metals like gold and silver, as well as energy commodities like oil.',
      6: 'Understand the global foreign exchange market, currency pairs, and how forex trading works in the international economy.',
      7: 'Learn about financial derivatives including futures, options, swaps, and how they are used for hedging and speculation.',
      8: 'Explore the world of cryptocurrencies and blockchain technology. Understand Bitcoin, Ethereum, and other digital assets.',
      9: 'Discover Web3 technologies, decentralized finance (DeFi), NFTs, and the future of digital ownership and finance.',
      10: 'Master risk management strategies and develop financial discipline to protect your investments and maximize returns.',
    };
    return descriptions[day] ??
        'Explore advanced investment concepts and strategies to enhance your trading skills.';
  }

  Widget _buildLeaderboardCard({
    required String title,
    required List<Color> gradientColors,
    required List<Map<String, dynamic>> leaderboard,
    required String viewMode,
    required Function(String) onViewModeChanged,
    required bool expanded,
    required VoidCallback onExpandToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Main card with podium
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF818CF8), // Light indigo
                  Color(0xFF6366F1), // Indigo
                  Color(0xFF7C3AED), // Violet
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Avatar, rank and Group/Global toggle row
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Row(
                    children: [
                      // Avatar placeholder
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Your rank
                      Text(
                        'Your Rank: 15',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      const Spacer(),
                      _buildViewModeToggle(viewMode, onViewModeChanged),
                    ],
                  ),
                ),
                // Header section with podium
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [_buildPodium(leaderboard)]),
                ),
              ],
            ),
          ),
          // Expanded list - separate from main card
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: _buildExpandedList(leaderboard.skip(3).toList()),
          ),
        ],
      ),
    );
  }

  Widget _buildViewModeToggle(String viewMode, Function(String) onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleOption(
            'Group',
            viewMode == 'group',
            () => onChanged('group'),
          ),
          _buildToggleOption(
            'Global',
            viewMode == 'global',
            () => onChanged('global'),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.black : Colors.white70,
          ),
        ),
      ),
    );
  }

  Widget _buildPodium(List<Map<String, dynamic>> leaderboard) {
    if (leaderboard.length < 3) return const SizedBox.shrink();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: _buildPodiumPosition(leaderboard[1], 2, 100)),
        Expanded(child: _buildPodiumPosition(leaderboard[0], 1, 130)),
        Expanded(child: _buildPodiumPosition(leaderboard[2], 3, 80)),
      ],
    );
  }

  Widget _buildPodiumPosition(
    Map<String, dynamic> data,
    int rank,
    double height,
  ) {
    final colors = {
      1: const Color(0xFFFBBF24),
      2: const Color(0xFFC0C0C0),
      3: const Color(0xFFCD7F32),
    };

    final content = Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: rank == 1 ? 70 : 60,
              height: rank == 1 ? 70 : 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colors[rank]!, width: 3),
                color: Colors.grey.shade300,
              ),
              child: const Icon(Icons.person, size: 36, color: Colors.grey),
            ),
            Positioned(
              top: 0,
              right: rank == 1 ? 0 : 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colors[rank],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '#$rank',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          _getCountryFlag(data['country']),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          data['name'],
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          'Portfolio:',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$300K',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const Text(
              ' → ',
              style: TextStyle(fontSize: 10, color: Colors.white70),
            ),
            Text(
              data['equity'],
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF4ADE80),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                data['profitAmount'],
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4ADE80),
                ),
              ),
              Text(
                data['profit'],
                style: const TextStyle(fontSize: 10, color: Color(0xFF4ADE80)),
              ),
            ],
          ),
        ),
      ],
    );

    // Move 1st position up
    if (rank == 1) {
      return Transform.translate(offset: const Offset(0, -15), child: content);
    }
    return content;
  }

  Widget _buildExpandedList(List<Map<String, dynamic>> items) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: items.map((item) => _buildLeaderboardItem(item)).toList(),
      ),
    );
  }

  Widget _buildLeaderboardItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF1E3A8A), // Dark blue
            Color(0xFF7C3AED), // Violet
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${item['rank']}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.account_circle, color: Colors.white54, size: 36),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: item['rank'] % 2 == 0
                                ? const Color(0xFF10B981).withValues(alpha: 0.3)
                                : const Color(
                                    0xFF3B82F6,
                                  ).withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item['rank'] % 2 == 0
                                ? 'Learning Challenge'
                                : 'Investing Challenge',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: item['rank'] % 2 == 0
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFF60A5FA),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item['country'],
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: item['premium'] == true
                                ? const Color(0xFFFBBF24).withValues(alpha: 0.3)
                                : Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item['premium'] == true ? 'Premium' : 'Standard',
                            style: TextStyle(
                              fontSize: 10,
                              color: item['premium'] == true
                                  ? const Color(0xFFFBBF24)
                                  : Colors.white60,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Portfolio value:',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              Row(
                children: [
                  const Text(
                    '\$10,000',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  Column(
                    children: [
                      Text(
                        '90 days',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        ' ⟶ ',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white70,
                          height: 0.8,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '\$20,000',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4ADE80),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF4ADE80).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '+\$360.00 (+1.49%)',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4ADE80),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== SPONSORS SECTION ====================
  Widget _buildSponsorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBBF24).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.handshake,
                  color: Color(0xFFFBBF24),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Sponsors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Sponsor Tabs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildSponsorTab('Banking', 'banking'),
                _buildSponsorTab('Educational', 'educational'),
                _buildSponsorTab('Media', 'media'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Sponsor Cards Carousel
        SizedBox(
          height: 280,
          child: PageView.builder(
            controller: _sponsorPageController,
            itemCount: _currentSponsors.length,
            onPageChanged: (index) {
              setState(() => _activeSponsorIndex = index);
            },
            itemBuilder: (context, index) {
              return _buildSponsorCard(_currentSponsors[index]);
            },
          ),
        ),

        // Pagination Dots
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _currentSponsors.length,
            (index) => Container(
              width: index == _activeSponsorIndex ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: index == _activeSponsorIndex
                    ? const Color(0xFF8B5CF6)
                    : Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSponsorTab(String label, String value) {
    final isActive = _activeSponsorTab == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _activeSponsorTab = value;
            _activeSponsorIndex = 0;
            _sponsorPageController.jumpToPage(0);
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    colors: [
                      Color(0xFF22C55E),
                      Color(0xFF3B82F6),
                      Color(0xFFA855F7),
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSponsorCard(Map<String, dynamic> sponsor) {
    final List<Color> gradientColors = sponsor['gradientColors'] as List<Color>;
    final List<Map<String, dynamic>> info =
        sponsor['info'] as List<Map<String, dynamic>>;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: (sponsor['badgeColor'] as Color).withValues(
                    alpha: 0.2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: sponsor['badgeColor'] as Color),
                ),
                child: Text(
                  sponsor['badge'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: sponsor['badgeColor'] as Color,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Avatar and Title Row
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.emoji_events,
                      color: Color(0xFFFBBF24),
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sponsor['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          sponsor['subtitle'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Info Grid
              Row(
                children: [
                  Expanded(child: _buildInfoItem(info[0])),
                  Expanded(child: _buildInfoItem(info[1])),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildInfoItem(info[2])),
                  Expanded(child: _buildInfoItem(info[3])),
                ],
              ),
              const SizedBox(height: 16),

              // Visit Button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Visit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(Map<String, dynamic> info) {
    return Row(
      children: [
        Icon(
          info['icon'] as IconData,
          color: const Color(0xFF3B82F6),
          size: 16,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info['label'],
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
              Text(
                info['value'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ==================== CHAMPIONSHIP STAGES SECTION ====================
  Widget _buildChampionshipStagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.military_tech,
                  color: Color(0xFF8B5CF6),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Quantrock Championship Stages',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Challenge Cards Carousel
        SizedBox(
          height: 420,
          child: PageView.builder(
            controller: _championshipPageController,
            itemCount: _challengeCards.length,
            onPageChanged: (index) {
              setState(() => _activeChampionshipIndex = index);
            },
            itemBuilder: (context, index) {
              return _buildChallengeCard(_challengeCards[index]);
            },
          ),
        ),

        // Pagination Dots
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _challengeCards.length,
            (index) => Container(
              width: index == _activeChampionshipIndex ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: index == _activeChampionshipIndex
                    ? const Color(0xFF8B5CF6)
                    : Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChallengeCard(Map<String, dynamic> card) {
    final List<Color> gradientColors = card['gradientColors'] as List<Color>;
    final List<Map<String, dynamic>> info =
        card['info'] as List<Map<String, dynamic>>;
    final List<String> details = card['details'] as List<String>;
    final int cardId = card['id'] as int;
    final bool isExpanded = cardId == 1 ? _expandedCard1 : _expandedCard4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: (card['badgeColor'] as Color).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: card['badgeColor'] as Color),
                  ),
                  child: Text(
                    card['badge'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: card['badgeColor'] as Color,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Avatar and Title Row
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        card['avatarIcon'] as IconData,
                        color: const Color(0xFFFBBF24),
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            card['subtitle'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Info Grid
                Row(
                  children: [
                    Expanded(child: _buildInfoItem(info[0])),
                    Expanded(child: _buildInfoItem(info[1])),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildInfoItem(info[2])),
                    Expanded(child: _buildInfoItem(info[3])),
                  ],
                ),
                const SizedBox(height: 16),

                // Join Button
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF22C55E),
                        Color(0xFF3B82F6),
                        Color(0xFFA855F7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Join',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Expand Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (cardId == 1) {
                        _expandedCard1 = !_expandedCard1;
                      } else {
                        _expandedCard4 = !_expandedCard4;
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isExpanded ? 'Hide Details' : 'Show Details',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(width: 4),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white.withValues(alpha: 0.7),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Expanded Details
                if (isExpanded) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardId == 1
                              ? 'Stage Requirements'
                              : 'Skill Challenge Details',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...details.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  margin: const EdgeInsets.only(
                                    top: 6,
                                    right: 10,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF22C55E),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withValues(
                                        alpha: 0.8,
                                      ),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
