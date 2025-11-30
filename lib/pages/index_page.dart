import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool _isFirstCardExpanded = false;
  bool _isSecondCardExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Learn Challenge Card (Green)
                  _buildChallengeCard(
                    isExpanded: _isFirstCardExpanded,
                    onToggleExpand: () => setState(() => _isFirstCardExpanded = !_isFirstCardExpanded),
                    badgeText: 'Beginners',
                    badgeColor: const Color(0xFF22C55E),
                    gradientColors: [const Color(0xFF065F46), const Color(0xFF064E3B)],
                    icon: Icons.timer_outlined,
                    iconColor: const Color(0xFF22C55E),
                    title: 'Learn Challenge',
                    subtitle: 'Free Simulator Training (Optional)',
                    description: 'Designed for beginners who want to build a solid foundation in trading and gradually develop essential investment skills. It\'s ideal for newcomers, university students, and even high-school learners who wish to practice trading safely through a free, risk-free virtual portfolio simulator.',
                    rewards: [
                      {'icon': Icons.workspace_premium, 'text': 'Premium upgrade'},
                      {'icon': Icons.emoji_events, 'text': 'Name on Leaderboard'},
                      {'icon': Icons.calendar_today, 'text': '28 days of skill challenges'},
                      {'icon': Icons.psychology, 'text': 'Investor Personality Assessment'},
                    ],
                    expandedContent: _buildLearnChallengeDetails(),
                    buttonText: 'Start Learning Challenge',
                    onButtonPress: () => Navigator.pushNamed(context, '/skill-challenge'),
                  ),

                  const SizedBox(height: 24),

                  // Invest Challenge Card (Purple)
                  _buildChallengeCard(
                    isExpanded: _isSecondCardExpanded,
                    onToggleExpand: () => setState(() => _isSecondCardExpanded = !_isSecondCardExpanded),
                    badgeText: 'Qualifiers',
                    badgeColor: const Color(0xFFA78BFA),
                    gradientColors: [const Color(0xFF7C3AED), const Color(0xFF4C1D95)],
                    icon: Icons.bolt,
                    iconColor: const Color(0xFFA78BFA),
                    title: 'Invest Challenge',
                    subtitle: 'Exclusively for Premium Pro Members',
                    description: 'Designed for qualified users, professionals, and Premium members, it offers real financial prizes within an advanced simulation environment that mimics the strategies of investors and hedge funds, without any actual risk. Participants manage a virtual portfolio of up to \$100,000 to trade in a 100% realistic market for 28 days.',
                    rewards: [
                      {'icon': Icons.attach_money, 'text': 'Cash prize up to \$1,000'},
                      {'icon': Icons.lock_open, 'text': 'Full access to all features'},
                      {'icon': Icons.emoji_events, 'text': 'Name on Leaderboard'},
                      {'icon': Icons.psychology, 'text': 'Investor Personality Assessment'},
                      {'icon': Icons.description, 'text': 'Quantrock Certificate'},
                      {'icon': Icons.star, 'text': 'Premium upgrade'},
                      {'icon': Icons.menu_book, 'text': '500+ lessons'},
                      {'icon': Icons.track_changes, 'text': '28 days of skill challenges'},
                    ],
                    expandedContent: _buildInvestChallengeDetails(),
                    buttonText: 'Start Investment Challenge',
                    onButtonPress: () => Navigator.pushNamed(context, '/questionnaire'),
                  ),

                  const SizedBox(height: 24),

                  // About Section
                  _buildAboutSection(),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0A),
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1E3A8A),
                border: Border.all(color: const Color(0xFF3B82F6), width: 2),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 24),
            ),
            // Right icons
            Row(
              children: [
                _buildHeaderIcon(Icons.search),
                const SizedBox(width: 16),
                _buildHeaderIcon(Icons.star_border),
                const SizedBox(width: 16),
                _buildHeaderIcon(Icons.notifications_none),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Icon(icon, color: Colors.white, size: 24);
  }

  Widget _buildChallengeCard({
    required bool isExpanded,
    required VoidCallback onToggleExpand,
    required String badgeText,
    required Color badgeColor,
    required List<Color> gradientColors,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String description,
    required List<Map<String, dynamic>> rewards,
    required Widget expandedContent,
    required String buttonText,
    required VoidCallback onButtonPress,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: badgeColor.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: badgeColor.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Badge
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: badgeColor, width: 1.5),
                      color: badgeColor.withValues(alpha: 0.2),
                    ),
                    child: Text(
                      badgeText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Icon + Title Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: iconColor, width: 2),
                        color: const Color(0xFF1E293B),
                      ),
                      child: Icon(icon, color: iconColor, size: 32),
                    ),
                    const SizedBox(width: 12),
                    // Title & Subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Rewards Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: badgeColor.withValues(alpha: 0.4)),
                          color: badgeColor.withValues(alpha: 0.1),
                        ),
                        child: const Text(
                          'Rewards & Benefits:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Rewards Grid
                      _buildRewardsGrid(rewards, iconColor),
                    ],
                  ),
                ),

                // Expand Button
                GestureDetector(
                  onTap: onToggleExpand,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                    child: AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),

                // Expanded Content
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: expandedContent,
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),

                // Action Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GestureDetector(
                    onTap: onButtonPress,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: badgeColor, width: 2),
                        color: badgeColor.withValues(alpha: 0.2),
                      ),
                      child: Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRewardsGrid(List<Map<String, dynamic>> rewards, Color iconColor) {
    final half = (rewards.length / 2).ceil();
    final leftColumn = rewards.sublist(0, half);
    final rightColumn = rewards.sublist(half);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: leftColumn.map((r) => _buildRewardItem(r, iconColor)).toList(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: rightColumn.map((r) => _buildRewardItem(r, iconColor)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRewardItem(Map<String, dynamic> reward, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(reward['icon'] as IconData, color: iconColor, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              reward['text'] as String,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withValues(alpha: 0.8),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnChallengeDetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Prizes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'The winner is announced on the first day of every month and receives:',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.8),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildDetailBullet('Their name listed on the monthly Leaderboard', const Color(0xFF22C55E)),
          _buildDetailBullet('One month of free Premium subscription', const Color(0xFF22C55E)),
          _buildDetailBullet('Direct nomination to the next stage: the Investment Challenge', const Color(0xFF22C55E)),

          const SizedBox(height: 16),
          const Text(
            'Challenge Rules',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          _buildDetailBullet('Start anytime', const Color(0xFF22C55E)),
          _buildDetailBullet('28-day duration (can continue indefinitely)', const Color(0xFF22C55E)),
          _buildDetailBullet('Complete 28 days of daily skill lessons', const Color(0xFF22C55E)),
          _buildDetailBullet('70%+ success rate in daily exercises', const Color(0xFF22C55E)),
          _buildDetailBullet('Daily loss limit: 5%', const Color(0xFF22C55E)),
          _buildDetailBullet('Total loss limit: 10%', const Color(0xFF22C55E)),
          _buildDetailBullet('Target profit threshold: 6%', const Color(0xFF22C55E)),
          _buildDetailBullet('Maximum asset weight: 10%', const Color(0xFF22C55E)),
          _buildDetailBullet('Minimum trades: 30', const Color(0xFF22C55E)),
          _buildDetailBullet('Allowed assets: S&P 500 stocks / Gold / EUR/USD / Bitcoin', const Color(0xFF22C55E)),
          _buildDetailBullet('Account leverage: 1:1', const Color(0xFF22C55E)),
        ],
      ),
    );
  }

  Widget _buildInvestChallengeDetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Premium Pro Membership Benefits',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          _buildDetailBullet('Direct access to the Investment Challenge', const Color(0xFFA78BFA)),
          _buildDetailBullet('Real-time analysis of global banks\' recommendations', const Color(0xFFA78BFA)),
          _buildDetailBullet('Tracking of hedge funds\' and top politicians\' trades', const Color(0xFFA78BFA)),
          _buildDetailBullet('Smart Money Flow – Insight into institutional money movements', const Color(0xFFA78BFA)),
          _buildDetailBullet('Comprehensive performance analytics highlighting your strengths and weaknesses', const Color(0xFFA78BFA)),

          const SizedBox(height: 16),
          const Text(
            'Challenge Rules',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          _buildDetailBullet('Start anytime', const Color(0xFFA78BFA)),
          _buildDetailBullet('28-day duration (can continue indefinitely)', const Color(0xFFA78BFA)),
          _buildDetailBullet('Complete 28 days of daily skill lessons', const Color(0xFFA78BFA)),
          _buildDetailBullet('70%+ success rate in daily exercises', const Color(0xFFA78BFA)),
          _buildDetailBullet('Daily loss limit: 5%', const Color(0xFFA78BFA)),
          _buildDetailBullet('Total loss limit: 10%', const Color(0xFFA78BFA)),
          _buildDetailBullet('Target profit threshold: 6%+', const Color(0xFFA78BFA)),
          _buildDetailBullet('Maximum asset weight: 10%', const Color(0xFFA78BFA)),
          _buildDetailBullet('Minimum trades: 30', const Color(0xFFA78BFA)),
          _buildDetailBullet('Allowed assets: S&P 500 stocks / Gold / EUR/USD / Bitcoin', const Color(0xFFA78BFA)),
          _buildDetailBullet('Account leverage: 1:1', const Color(0xFFA78BFA)),
          _buildDetailBullet('Winner can rejoin after 90 days', const Color(0xFFA78BFA)),
        ],
      ),
    );
  }

  Widget _buildDetailBullet(String text, Color bulletColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bulletColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.8),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About the Challenge',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'The largest investment challenge that combines training, competition, and real rewards.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3B82F6),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Quantrock\'s Investment Simulation Challenge is designed to bridge the gap between academic knowledge and real-world trading practice. It takes you on a 28-day investment journey filled with practical learning, where participants receive daily interactive lessons and exercises aimed at enhancing their trading and investment skills step by step.\n\nThe challenge offers professionals, beginners, university students, and high-school students a realistic and risk-free experience. You will take on the role of a portfolio manager and executive trader inside a professional simulation environment that reflects the workflow of expert investors and replicates the markets with 100% accuracy.\n\nThis experience blends hands-on training, real competitive challenges, and tangible rewards—providing a realistic simulation that helps you develop your investment skills, strengthen your practical abilities, and progressively advance toward higher levels of professionalism.',
            style: TextStyle(
              fontSize: 11,
              color: const Color(0xFFCBD5E1),
              height: 1.6,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
