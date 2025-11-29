import 'package:flutter/material.dart';

class SkillChallengePage extends StatefulWidget {
  const SkillChallengePage({super.key});

  @override
  State<SkillChallengePage> createState() => _SkillChallengePageState();
}

class _SkillChallengePageState extends State<SkillChallengePage> {
  String _activeTab = 'training';
  String _trainingViewMode = 'global';
  String _challengeViewMode = 'global';
  bool _expandedTraining = true;
  bool _expandedChallenge = false;
  int _activeCardIndex = 0;
  int _activeSponsorIndex = 0;
  String _activeSponsorTab = 'banking';
  final PageController _cardController = PageController();
  final PageController _sponsorController = PageController();

  final List<Map<String, dynamic>> _globalLeaderboard = [
    {'rank': 1, 'name': 'Emma Davis', 'profit': '+22.3%', 'trades': 45, 'country': 'US', 'profitAmount': '\$66,900', 'equity': '\$366,900'},
    {'rank': 2, 'name': 'Mike Johnson', 'profit': '+16.8%', 'trades': 38, 'country': 'GB', 'profitAmount': '\$50,400', 'equity': '\$350,400'},
    {'rank': 3, 'name': 'Chris Lee', 'profit': '+14.2%', 'trades': 32, 'country': 'CN', 'profitAmount': '\$42,600', 'equity': '\$342,600'},
    {'rank': 4, 'name': 'LIAOYI_WANG', 'profit': '+13.4%', 'trades': 36, 'country': 'CN', 'profitAmount': '\$40,200', 'equity': '\$340,200'},
    {'rank': 5, 'name': 'NM.swing', 'profit': '+12.9%', 'trades': 34, 'country': 'GB', 'profitAmount': '\$38,700', 'equity': '\$338,700'},
    {'rank': 6, 'name': 'Lisa Brown', 'profit': '+12.1%', 'trades': 30, 'country': 'CA', 'profitAmount': '\$36,300', 'equity': '\$336,300'},
    {'rank': 7, 'name': 'Tom Harris', 'profit': '+11.6%', 'trades': 28, 'country': 'AU', 'profitAmount': '\$34,800', 'equity': '\$334,800'},
    {'rank': 8, 'name': 'Nina Green', 'profit': '+10.9%', 'trades': 26, 'country': 'JP', 'profitAmount': '\$32,700', 'equity': '\$332,700'},
    {'rank': 9, 'name': 'Jack Miller', 'profit': '+10.4%', 'trades': 24, 'country': 'IT', 'profitAmount': '\$31,200', 'equity': '\$331,200'},
    {'rank': 10, 'name': 'Kate Wilson', 'profit': '+9.8%', 'trades': 22, 'country': 'ES', 'profitAmount': '\$29,400', 'equity': '\$329,400'},
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
  void dispose() {
    _cardController.dispose();
    _sponsorController.dispose();
    super.dispose();
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
                    _buildSectionTitle('Quantrock Investment Championship'),
                    _buildTabs(),
                    const SizedBox(height: 16),
                    if (_activeTab == 'training') ...[
                      _buildLeaderboardCard(
                        title: 'Learning Leaderboard',
                        gradientColors: [const Color(0xFF065F46), const Color(0xFF064E3B)],
                        leaderboard: _trainingViewMode == 'global' ? _globalLeaderboard : _groupLeaderboard,
                        viewMode: _trainingViewMode,
                        onViewModeChanged: (mode) => setState(() => _trainingViewMode = mode),
                        expanded: _expandedTraining,
                        onExpandToggle: () => setState(() => _expandedTraining = !_expandedTraining),
                      ),
                      const SizedBox(height: 24),
                      _buildSectionTitle('Quantrock Championship Stages'),
                      _buildChallengeCarousel(),
                      const SizedBox(height: 24),
                      _buildSectionTitle('Sponsors'),
                      _buildSponsorTabs(),
                      _buildSponsorCarousel(),
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
            _buildTab('Learn Challenge', 'training'),
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

  Widget _buildChallengeCarousel() {
    final cards = [
      {
        'title': 'Investment Stage',
        'subtitle': 'Practice and refine your trading strategies in a simulated environment.',
        'badge': 'Optional',
        'badgeColor': const Color(0xFFFBBF24),
        'gradientColors': [const Color(0xFF065F46), const Color(0xFF064E3B)],
        'icon': Icons.track_changes,
        'info': [
          {'icon': Icons.track_changes, 'label': 'Portfolio:', 'value': '\$10K - \$100K'},
          {'icon': Icons.trending_up, 'label': 'Profit Target:', 'value': '6%'},
          {'icon': Icons.military_tech, 'label': 'Min Trades:', 'value': '30'},
          {'icon': Icons.calendar_today, 'label': 'Daily Loss:', 'value': '5% Max'},
        ],
      },
      {
        'title': 'Skill Challenge',
        'subtitle': 'Test your trading expertise through progressive challenges.',
        'badge': 'Expert',
        'badgeColor': const Color(0xFF8B5CF6),
        'gradientColors': [const Color(0xFF4C1D95), const Color(0xFF5B21B6)],
        'icon': Icons.workspace_premium,
        'info': [
          {'icon': Icons.emoji_events, 'label': 'Levels:', 'value': '5 Stages'},
          {'icon': Icons.military_tech, 'label': 'Win Rate:', 'value': '65%+'},
          {'icon': Icons.track_changes, 'label': 'Challenges:', 'value': '50+'},
          {'icon': Icons.trending_up, 'label': 'Rewards:', 'value': 'Exclusive'},
        ],
      },
    ];

    return Column(
      children: [
        SizedBox(
          height: 280,
          child: PageView.builder(
            controller: _cardController,
            onPageChanged: (index) => setState(() => _activeCardIndex = index),
            itemCount: cards.length,
            itemBuilder: (context, index) => _buildChallengeCard(cards[index]),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(cards.length, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _activeCardIndex == index
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.3),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildChallengeCard(Map<String, dynamic> card) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: card['gradientColors'] as List<Color>,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: (card['badgeColor'] as Color).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: card['badgeColor'] as Color),
              ),
              child: Text(
                card['badge'] as String,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: card['badgeColor'] as Color,
                ),
              ),
            ),
            const SizedBox(height: 16),
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
                    card['icon'] as IconData,
                    color: const Color(0xFFFBBF24),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card['title'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        card['subtitle'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: (card['info'] as List).map<Widget>((info) {
                return SizedBox(
                  width: (MediaQuery.of(context).size.width - 80) / 2 - 16,
                  child: Row(
                    children: [
                      Icon(
                        info['icon'] as IconData,
                        size: 16,
                        color: const Color(0xFF3B82F6),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        info['label'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        info['value'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSponsorTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
    );
  }

  Widget _buildSponsorTab(String label, String value) {
    final isActive = _activeSponsorTab == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          _activeSponsorTab = value;
          _activeSponsorIndex = 0;
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isActive ? const Color(0xFF0F172A) : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSponsorCarousel() {
    final sponsors = {
      'banking': [
        {'title': 'Global Trade Bank', 'subtitle': 'Leading international banking solutions', 'badge': 'Elite', 'location': 'New York', 'clients': '50,000+'},
        {'title': 'Quantum Finance', 'subtitle': 'Premium financial services', 'badge': 'Pro', 'location': 'London', 'clients': '35,000+'},
      ],
      'educational': [
        {'title': 'Capital Academy', 'subtitle': 'World-class trading education', 'badge': 'Elite', 'location': 'Dubai', 'clients': '10,000+'},
        {'title': 'Investing Academy', 'subtitle': 'Investment excellence', 'badge': 'Pro', 'location': 'Saudi Arabia', 'clients': '5,000+'},
      ],
      'media': [
        {'title': 'Crypto Masters Cup', 'subtitle': 'Cryptocurrency trading competition', 'badge': 'Premium', 'location': 'Digital', 'clients': '8,000+'},
        {'title': 'Trade Media Network', 'subtitle': 'Financial news platform', 'badge': 'Premium', 'location': 'Singapore', 'clients': '2M+'},
      ],
    };

    final currentSponsors = sponsors[_activeSponsorTab]!;

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _sponsorController,
            onPageChanged: (index) => setState(() => _activeSponsorIndex = index),
            itemCount: currentSponsors.length,
            itemBuilder: (context, index) => _buildSponsorCard(currentSponsors[index]),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(currentSponsors.length, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _activeSponsorIndex == index
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.3),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSponsorCard(Map<String, dynamic> sponsor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color(0xFF1E3A8A), const Color(0xFF7C3AED)],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBBF24).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFFBBF24)),
                  ),
                  child: Text(
                    sponsor['badge'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFBBF24),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Visit',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              sponsor['title'] as String,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              sponsor['subtitle'] as String,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: const Color(0xFF3B82F6)),
                const SizedBox(width: 4),
                Text(
                  sponsor['location'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.people, size: 14, color: const Color(0xFF3B82F6)),
                const SizedBox(width: 4),
                Text(
                  sponsor['clients'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
