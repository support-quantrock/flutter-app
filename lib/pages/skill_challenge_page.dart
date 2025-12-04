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

  // 28-day challenge state
  int _currentDay = 2;
  final int _totalDays = 28;
  final Set<int> _expandedLessons = {};

  final List<Map<String, dynamic>> _lessons = [
    // Week 1: Lessons 1-5 + Test
    {'day': 1, 'emoji': '🏪', 'title': 'How to Start the Challenge in the Quantrook Portfolio', 'completed': true, 'type': 'lesson'},
    {'day': 2, 'emoji': '🚪', 'title': 'Entering the Investor\'s Gate', 'completed': false, 'current': true, 'type': 'lesson'},
    {'day': 3, 'emoji': '🕯️', 'title': 'Money Rules: Saving, Investing, and Building Wealth', 'completed': false, 'type': 'lesson'},
    {'day': 4, 'emoji': '🎯', 'title': 'Financial Markets: Stocks, Bonds, Options, and More', 'completed': false, 'type': 'lesson'},
    {'day': 5, 'emoji': '🏰', 'title': 'Commodity & Metal Markets (Gold, Silver, Oil)', 'completed': false, 'type': 'lesson'},
    {'day': 6, 'emoji': '📝', 'title': 'Week 1 Assessment: Foundation Basics', 'completed': false, 'type': 'test'},
    // Week 2: Lessons 7-11 + Test
    {'day': 7, 'emoji': '📐', 'title': 'Global Currency Markets (Forex)', 'completed': false, 'type': 'lesson'},
    {'day': 8, 'emoji': '🏆', 'title': 'Financial Derivatives', 'completed': false, 'type': 'lesson'},
    {'day': 9, 'emoji': '📊', 'title': 'Cryptocurrencies & Blockchain Technology', 'completed': false, 'type': 'lesson'},
    {'day': 10, 'emoji': '📈', 'title': 'Understanding Web3, DeFi, and NFTs', 'completed': false, 'type': 'lesson'},
    {'day': 11, 'emoji': '📉', 'title': 'Risk Management & Financial Discipline', 'completed': false, 'type': 'lesson'},
    {'day': 12, 'emoji': '📝', 'title': 'Week 2 Assessment: Markets & Assets', 'completed': false, 'type': 'test'},
    // Week 3: Lessons 13-17 + Test
    {'day': 13, 'emoji': '💹', 'title': 'Technical Analysis Fundamentals', 'completed': false, 'type': 'lesson'},
    {'day': 14, 'emoji': '📋', 'title': 'Fundamental Analysis Deep Dive', 'completed': false, 'type': 'lesson'},
    {'day': 15, 'emoji': '🔮', 'title': 'Market Psychology & Behavioral Finance', 'completed': false, 'type': 'lesson'},
    {'day': 16, 'emoji': '⚖️', 'title': 'Portfolio Diversification Strategies', 'completed': false, 'type': 'lesson'},
    {'day': 17, 'emoji': '🎪', 'title': 'Trading Strategies for Beginners', 'completed': false, 'type': 'lesson'},
    {'day': 18, 'emoji': '📝', 'title': 'Week 3 Assessment: Analysis & Strategy', 'completed': false, 'type': 'test'},
    // Week 4: Lessons 19-23 + Test
    {'day': 19, 'emoji': '🛡️', 'title': 'Hedging & Risk Mitigation', 'completed': false, 'type': 'lesson'},
    {'day': 20, 'emoji': '📱', 'title': 'Trading Platforms & Tools', 'completed': false, 'type': 'lesson'},
    {'day': 21, 'emoji': '🌐', 'title': 'Global Economic Indicators', 'completed': false, 'type': 'lesson'},
    {'day': 22, 'emoji': '📰', 'title': 'News Trading & Market Events', 'completed': false, 'type': 'lesson'},
    {'day': 23, 'emoji': '🔄', 'title': 'Swing Trading Techniques', 'completed': false, 'type': 'lesson'},
    {'day': 24, 'emoji': '📝', 'title': 'Week 4 Assessment: Advanced Trading', 'completed': false, 'type': 'test'},
    // Final Days: Lessons 25-27 + Final Test
    {'day': 25, 'emoji': '⚡', 'title': 'Day Trading Essentials', 'completed': false, 'type': 'lesson'},
    {'day': 26, 'emoji': '🏦', 'title': 'Building Your First Portfolio', 'completed': false, 'type': 'lesson'},
    {'day': 27, 'emoji': '🚀', 'title': 'Setting Investment Goals & Trading Plan', 'completed': false, 'type': 'lesson'},
    {'day': 28, 'emoji': '🏅', 'title': 'Final Challenge Assessment', 'completed': false, 'type': 'test'},
  ];

  final List<Map<String, dynamic>> _groupLeaderboard = [
    {'rank': 1, 'name': 'Jake Thompson', 'profit': '+20.1%', 'trades': 40, 'country': 'US', 'profitAmount': '\$60,300', 'equity': '\$360,300'},
    {'rank': 2, 'name': 'Aiko Yamamoto', 'profit': '+18.4%', 'trades': 36, 'country': 'JP', 'profitAmount': '\$55,200', 'equity': '\$355,200'},
    {'rank': 3, 'name': 'Felix Schmidt', 'profit': '+16.7%', 'trades': 32, 'country': 'DE', 'profitAmount': '\$50,100', 'equity': '\$350,100'},
    {'rank': 4, 'name': 'Isabella Rossi', 'profit': '+15.2%', 'trades': 30, 'country': 'IT', 'profitAmount': '\$45,600', 'equity': '\$345,600'},
    {'rank': 5, 'name': 'Noah Williams', 'profit': '+14.5%', 'trades': 28, 'country': 'GB', 'profitAmount': '\$43,500', 'equity': '\$343,500'},
    {'rank': 6, 'name': 'Sophie Laurent', 'profit': '+13.7%', 'trades': 26, 'country': 'FR', 'profitAmount': '\$41,100', 'equity': '\$341,100'},
    {'rank': 7, 'name': 'Lucas Silva', 'profit': '+12.8%', 'trades': 24, 'country': 'ES', 'profitAmount': '\$38,400', 'equity': '\$338,400'},
    {'rank': 8, 'name': 'Emma Nguyen', 'profit': '+11.9%', 'trades': 22, 'country': 'AU', 'profitAmount': '\$35,700', 'equity': '\$335,700'},
    {'rank': 9, 'name': 'Oliver Park', 'profit': '+11.2%', 'trades': 20, 'country': 'CA', 'profitAmount': '\$33,600', 'equity': '\$333,600'},
    {'rank': 10, 'name': 'Chloe Kim', 'profit': '+10.5%', 'trades': 18, 'country': 'US', 'profitAmount': '\$31,500', 'equity': '\$331,500'},
  ];

  final List<Map<String, dynamic>> _challengeLeaderboard = [
    {'rank': 1, 'name': 'Sarah Chen', 'profit': '+24.5%', 'trades': 47, 'country': 'US', 'profitAmount': '\$73,500', 'equity': '\$373,500'},
    {'rank': 2, 'name': 'Alex Morgan', 'profit': '+18.2%', 'trades': 52, 'country': 'GB', 'profitAmount': '\$54,600', 'equity': '\$354,600'},
    {'rank': 3, 'name': 'Jordan Smith', 'profit': '+15.8%', 'trades': 41, 'country': 'US', 'profitAmount': '\$47,400', 'equity': '\$347,400'},
    {'rank': 4, 'name': 'Michael Brown', 'profit': '+14.1%', 'trades': 39, 'country': 'CA', 'profitAmount': '\$42,300', 'equity': '\$342,300'},
    {'rank': 5, 'name': 'Emma Wilson', 'profit': '+13.5%', 'trades': 35, 'country': 'AU', 'profitAmount': '\$40,500', 'equity': '\$340,500'},
    {'rank': 6, 'name': 'David Martinez', 'profit': '+12.8%', 'trades': 42, 'country': 'ES', 'profitAmount': '\$38,400', 'equity': '\$338,400'},
    {'rank': 7, 'name': 'Sophia Garcia', 'profit': '+11.9%', 'trades': 31, 'country': 'IT', 'profitAmount': '\$35,700', 'equity': '\$335,700'},
    {'rank': 8, 'name': 'James Anderson', 'profit': '+11.2%', 'trades': 37, 'country': 'GB', 'profitAmount': '\$33,600', 'equity': '\$333,600'},
    {'rank': 9, 'name': 'Olivia Taylor', 'profit': '+10.7%', 'trades': 33, 'country': 'US', 'profitAmount': '\$32,100', 'equity': '\$332,100'},
    {'rank': 10, 'name': 'Daniel Thomas', 'profit': '+10.3%', 'trades': 29, 'country': 'DE', 'profitAmount': '\$30,900', 'equity': '\$330,900'},
  ];

  String _getCountryFlag(String countryCode) {
    final flags = {
      'US': '🇺🇸', 'GB': '🇬🇧', 'CN': '🇨🇳', 'DE': '🇩🇪', 'FR': '🇫🇷',
      'CA': '🇨🇦', 'AU': '🇦🇺', 'JP': '🇯🇵', 'IT': '🇮🇹', 'ES': '🇪🇸',
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
                        gradientColors: [const Color(0xFF7C3AED), const Color(0xFF4C1D95)],
                        leaderboard: _challengeViewMode == 'global' ? _challengeLeaderboard : _groupLeaderboard,
                        viewMode: _challengeViewMode,
                        onViewModeChanged: (mode) => setState(() => _challengeViewMode = mode),
                        expanded: _expandedChallenge,
                        onExpandToggle: () => setState(() => _expandedChallenge = !_expandedChallenge),
                      ),
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
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _buildTab('Skill Challenge', 'training'),
            _buildTab('Invest Challenge', 'challenge'),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, String value) {
    final isActive = _activeTab == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _activeTab = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isActive ? const Color(0xFF0F172A) : Colors.white70,
            ),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF10B981), Color(0xFF059669)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.trending_up, color: Colors.white, size: 16),
                SizedBox(width: 6),
                Text(
                  'QIPA',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
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
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: isCurrent
                              ? const LinearGradient(
                                  colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                                )
                              : isCompleted
                                  ? const LinearGradient(
                                      colors: [Color(0xFF10B981), Color(0xFF059669)],
                                    )
                                  : null,
                          color: !isCurrent && !isCompleted
                              ? Colors.white.withValues(alpha: 0.1)
                              : null,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isCurrent
                                ? const Color(0xFF8B5CF6)
                                : isCompleted
                                    ? const Color(0xFF10B981)
                                    : Colors.white.withValues(alpha: 0.3),
                            width: 2,
                          ),
                          boxShadow: isCurrent
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.4),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Center(
                          child: isCompleted
                              ? const Icon(Icons.check, color: Colors.white, size: 20)
                              : Text(
                                  'D$day',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: isCurrent
                                        ? Colors.white
                                        : Colors.white.withValues(alpha: 0.6),
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
            child: const Icon(Icons.emoji_events, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              '28 day Skill challenge',
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
              child: const Icon(Icons.info_outline, color: Colors.white70, size: 20),
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

  Widget _buildInteractiveLessonIcon({
    required int day,
    required int lessonNumber,
    required bool isCompleted,
  }) {
    final lesson = LessonRegistry.getLessonByNumber(day, lessonNumber);
    final emoji = lesson?.emoji ?? '📚';
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
                    : [const Color(0xFF6366F1), const Color(0xFF6366F1).withValues(alpha: 0.8)],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (isCurrent && hasLesson ? const Color(0xFF8B5CF6) : const Color(0xFF6366F1)).withValues(alpha: 0.5),
              blurRadius: 16,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          border: isCurrent && hasLesson ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Center(
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  void _showLessonPopup(int day, int lessonNumber) {
    final lesson = LessonRegistry.getLessonByNumber(day, lessonNumber);
    final emoji = lesson?.emoji ?? '📚';
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
                child: Text(emoji, style: const TextStyle(fontSize: 32)),
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
                      content: Text('Day $day Lesson $lessonNumber coming soon!'),
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
            color: (isMilestone ? const Color(0xFF8B5CF6) : color).withValues(alpha: 0.5),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
    );
  }

  Widget _buildLessonCard(Map<String, dynamic> lesson) {
    final day = lesson['day'] as int;
    final emoji = lesson['emoji'] as String;
    final title = lesson['title'] as String;
    final isCompleted = lesson['completed'] as bool;
    final isCurrent = lesson['current'] == true;
    final isLocked = day > _currentDay;
    final isExpanded = _expandedLessons.contains(day);
    final isTest = lesson['type'] == 'test';
    final isDay2 = day == 2; // Day 2 is a header only - lesson is in floating icon

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: isLocked
              ? null
              : isCompleted
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF10B981), Color(0xFF059669)],
                    )
                  : isTest
                      ? const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFFEF3C7), Color(0xFFFDE68A)],
                        )
                      : null,
          color: isLocked
              ? Colors.white.withValues(alpha: 0.05)
              : isCompleted
                  ? null
                  : isTest
                      ? null
                      : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isCompleted
              ? Border.all(color: const Color(0xFF10B981), width: 2)
              : isTest && !isLocked
                  ? Border.all(color: const Color(0xFFF59E0B), width: 2)
                  : null,
          boxShadow: !isLocked
              ? [
                  BoxShadow(
                    color: isCompleted
                        ? const Color(0xFF10B981).withValues(alpha: 0.3)
                        : isTest
                            ? const Color(0xFFF59E0B).withValues(alpha: 0.3)
                            : Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
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
                      color: isLocked
                          ? Colors.grey.withValues(alpha: 0.2)
                          : isCompleted
                              ? Colors.white.withValues(alpha: 0.2)
                              : isTest
                                  ? const Color(0xFFF59E0B).withValues(alpha: 0.2)
                                  : const Color(0xFFF0F4FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: isCompleted
                          ? const Icon(Icons.check, color: Colors.white, size: 24)
                          : isTest && !isLocked
                              ? const Icon(Icons.quiz, color: Color(0xFFF59E0B), size: 24)
                              : Text(
                                  emoji,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: isLocked ? Colors.grey : null,
                                  ),
                                ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Day badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isLocked
                          ? Colors.grey.withValues(alpha: 0.2)
                          : isCompleted
                              ? Colors.white.withValues(alpha: 0.2)
                              : isTest
                                  ? const Color(0xFFF59E0B).withValues(alpha: 0.3)
                                  : isCurrent
                                      ? const Color(0xFFFEF3C7)
                                      : const Color(0xFFE0E7FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isTest ? 'TEST' : 'Day ${day.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isLocked
                            ? Colors.grey
                            : isCompleted
                                ? Colors.white
                                : isTest
                                    ? const Color(0xFFB45309)
                                    : isCurrent
                                        ? const Color(0xFFD97706)
                                        : const Color(0xFF4338CA),
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
                        fontWeight: isTest ? FontWeight.w600 : FontWeight.w500,
                        color: isLocked
                            ? Colors.grey
                            : isCompleted
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
                        color: isTest ? const Color(0xFFB45309) : Colors.grey.shade600,
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.grey.shade200),
                    const SizedBox(height: 12),
                    Text(
                      'Lesson Overview',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getLessonDescription(day),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to lesson if available
                              if (LessonRegistry.hasLesson(day)) {
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
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: isTest
                                      ? [const Color(0xFFF59E0B), const Color(0xFFD97706)]
                                      : [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isCompleted
                                        ? Icons.replay
                                        : isTest
                                            ? Icons.quiz
                                            : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    isCompleted
                                        ? (isTest ? 'Review Test' : 'Review Lesson')
                                        : (isTest ? 'Start Test' : 'Start Lesson'),
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
    return descriptions[day] ?? 'Explore advanced investment concepts and strategies to enhance your trading skills.';
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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.emoji_events, color: Color(0xFFFBBF24), size: 28),
                              const SizedBox(height: 4),
                              Text(
                                'Rank: 15',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      _buildViewModeToggle(viewMode, onViewModeChanged),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildPodium(leaderboard),
                ],
              ),
            ),
            GestureDetector(
              onTap: onExpandToggle,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 28),
                ),
              ),
            ),
            if (expanded) _buildExpandedList(leaderboard.skip(3).toList()),
          ],
        ),
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
        children: [
          _buildToggleOption('Group', viewMode == 'group', () => onChanged('group')),
          _buildToggleOption('Global', viewMode == 'global', () => onChanged('global')),
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

  Widget _buildPodiumPosition(Map<String, dynamic> data, int rank, double height) {
    final colors = {
      1: const Color(0xFFFBBF24),
      2: const Color(0xFFC0C0C0),
      3: const Color(0xFFCD7F32),
    };

    return Column(
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
            const Text(' → ', style: TextStyle(fontSize: 10, color: Colors.white70)),
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
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF4ADE80),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
        color: Colors.white.withValues(alpha: 0.1),
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
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item['country'],
                        style: const TextStyle(fontSize: 10, color: Colors.white70),
                      ),
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
                      const Text(' ⟶ ', style: TextStyle(fontSize: 12, color: Colors.white70)),
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

}
