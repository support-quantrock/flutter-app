import 'package:flutter/material.dart';
import 'dart:math' as math;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  final String _selectedTab = 'Overview';
  String _selectedTimePeriod = 'All';
  String _selectedBottomTab = 'watchlist';
  String _selectedOrderTab = 'Open';
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;

  final List<Map<String, dynamic>> watchlistStocks = [
    {'symbol': 'MSFT', 'name': 'Microsoft Corporation', 'price': '378.91', 'change': '+1.24', 'isPositive': true, 'color': Color(0xFF00A4EF)},
    {'symbol': 'AAPL', 'name': 'Apple Inc.', 'price': '178.72', 'change': '+2.34', 'isPositive': true, 'color': Color(0xFF555555)},
    {'symbol': 'NVDA', 'name': 'NVIDIA Corporation', 'price': '875.28', 'change': '+12.45', 'isPositive': true, 'color': Color(0xFF76B900)},
    {'symbol': 'AMZN', 'name': 'Amazon.com Inc.', 'price': '178.25', 'change': '-0.89', 'isPositive': false, 'color': Color(0xFFFF9900)},
    {'symbol': 'META', 'name': 'Meta Platforms Inc.', 'price': '505.95', 'change': '+3.21', 'isPositive': true, 'color': Color(0xFF0081FB)},
    {'symbol': 'BTC', 'name': 'Bitcoin USD', 'price': '67,245.00', 'change': '+1,245.00', 'isPositive': true, 'color': Color(0xFFF7931A)},
    {'symbol': 'NFLX', 'name': 'Netflix Inc.', 'price': '628.45', 'change': '-5.32', 'isPositive': false, 'color': Color(0xFFE50914)},
    {'symbol': 'TSLA', 'name': 'Tesla Inc.', 'price': '238.45', 'change': '+5.67', 'isPositive': true, 'color': Color(0xFFCC0000)},
  ];

  @override
  void initState() {
    super.initState();
    _expandController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  // Info descriptions for dashboard items
  static const Map<String, String> _infoDescriptions = {
    'Net Assets': 'Beginner (0-10)\nIntermediate (11-20)\nExpert (21-30)',
    'Cash Available': 'The amount of liquid cash in your account that is available for new trades or withdrawals.',
    'Invest Value': 'The total cost basis of your current investments - the original amount you paid for your positions.',
    'Market Value': 'The current market value of all your open positions based on real-time prices.',
    'Portfolio Performance': 'Track how your portfolio has performed over different time periods. Select a period to view returns.',
    'Net Profit': 'Your total realized and unrealized profit/loss. The percentage shows your return on investment.',
    'Risk Level': 'A measure of your portfolio\'s volatility and risk exposure on a scale of 1-10. Lower is safer.',
    'Trades': 'The number of trades completed vs your target. Helps track trading activity and consistency.',
    'Days': 'Active trading days completed vs your goal. Measures your commitment to regular trading.',
    'Profit': 'Your profit target and current progress. Shows how close you are to reaching your profit goal.',
    'Daily Loss': 'Maximum allowed loss per day. Helps manage risk by limiting daily drawdowns.',
    'Max Loss': 'Maximum total loss allowed before trading restrictions. Protects your account from large losses.',
    'Asset Allocation': 'Shows how your investments are distributed across different sectors and asset classes.',
    'Win Rate': 'Percentage of profitable trades out of total trades. Higher win rate indicates better trade selection.',
    'Loss Rate': 'Percentage of losing trades out of total trades. Lower is better.',
    'Max DD': 'Maximum Drawdown - the largest peak-to-trough decline in your portfolio value.',
    'AVG Loss': 'Average loss per losing trade. Smaller average losses indicate better risk management.',
    'AVG Profit': 'Average profit per winning trade. Higher average profits indicate good profit-taking.',
    'AVG RRR': 'Average Risk-Reward Ratio - compares potential profit to potential loss per trade.',
    'Profit Factor': 'Gross profits divided by gross losses. Above 1.0 means profitable trading.',
    'Sharpe Ratio': 'Risk-adjusted return measure. Higher values indicate better returns relative to risk taken.',
    'Expectancy': 'Average expected profit per trade based on win rate and average win/loss amounts.',
    'Statistics': 'Key performance metrics that help analyze your trading strategy effectiveness.',
  };

  void _showInfoDialog(String title) {
    final description = _infoDescriptions[title] ?? 'Information about $title';
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF1A1A3E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: const Color(0xFF3B82F6).withValues(alpha: 0.3)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      color: Color(0xFF3B82F6),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF9CA3AF),
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Got it',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoIcon(String infoKey, {double size = 16, Color? color}) {
    return GestureDetector(
      onTap: () => _showInfoDialog(infoKey),
      child: Icon(
        Icons.info_outline,
        color: color ?? Colors.white.withValues(alpha: 0.5),
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildAccountCard(),
                    const SizedBox(height: 16),
                    _buildBottomTabs(),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
            ),
          ),
          const Spacer(),
          _buildHeaderIcon(Icons.search),
          const SizedBox(width: 8),
          _buildHeaderIcon(Icons.star_border),
          const SizedBox(width: 8),
          _buildHeaderIcon(Icons.notifications_none),
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildAccountCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A3E), Color(0xFF0F0F23)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          // Always visible content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildAccountHeader(),
                const SizedBox(height: 20),
                _buildNetAssets(),
                const SizedBox(height: 16),
                _buildMetricsRow(),
                const SizedBox(height: 16),
                _buildProgressBar(),
                const SizedBox(height: 16),
                _buildOverviewTab(),
              ],
            ),
          ),
          // Expandable content
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: _buildExpandedContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.flag, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              const Text(
                'QR-78459321',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Demo',
                  style: TextStyle(
                    color: Color(0xFF22C55E),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white54, size: 20),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/skill-challenge');
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFA855F7), Color(0xFF3B82F6)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.bar_chart, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildNetAssets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Net Assets',
              style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            _buildInfoIcon('Net Assets'),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '\$10,500.00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(
                'USD',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              'Unrealized P/L: ',
              style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 14,
              ),
            ),
            const Text(
              '+\$500.00',
              style: TextStyle(
                color: Color(0xFF22C55E),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              ' (+5.00%)',
              style: TextStyle(
                color: Color(0xFF22C55E),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricsRow() {
    return Row(
      children: [
        _buildMetric('Cash Available', '\$7,500'),
        const SizedBox(width: 16),
        _buildMetric('Invest Value', '\$2,800'),
        const SizedBox(width: 16),
        _buildMetric('Market Value', '\$3,000'),
      ],
    );
  }

  Widget _buildMetric(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 4),
                _buildInfoIcon(label, size: 12),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF86EFAC), // Light green
                    Color(0xFF22C55E), // Dark green
                    Color(0xFFFDE047), // Light yellow
                    Color(0xFFEAB308), // Dark yellow
                    Color(0xFFFCA5A5), // Light red
                    Color(0xFFEF4444), // Dark red
                  ],
                ),
              ),
            ),
            Positioned(
              left: 12, // 3% position
              top: -4,
              child: CustomPaint(
                size: const Size(12, 16),
                painter: TrianglePointerPainter(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '3% invested',
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedContent() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Color(0xFF374151), height: 1),
          const SizedBox(height: 20),

          // Stage Slider
          _buildStageSlider(),
          const SizedBox(height: 24),

          // Portfolio Performance
          _buildPortfolioPerformance(),
          const SizedBox(height: 24),

          // Net Profit
          Center(child: _buildReturnCircle()),
          const SizedBox(height: 16),

          // Risk Level
          Center(child: _buildRiskLevel()),
          const SizedBox(height: 24),

          // Objectives
          _buildObjectives(),

          const SizedBox(height: 24),

          // Asset Allocation
          _buildAssetAllocation(),

          const SizedBox(height: 24),

          // Statistics Grid
          _buildStatisticsGrid(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                color: Color(0xFF3B82F6),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedRotation(
              turns: _isExpanded ? 1.0 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Icon(
                _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: const Color(0xFF3B82F6),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStageSlider() {
    // Current stage: 0 = Learn, 1 = Skills, 2 = Invest
    const int currentStage = 1; // Skills stage

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stage labels
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Learn',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Skills',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Invest',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Gradient progress bar
        Container(
          height: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            children: [
              // Learn section (light to dark green)
              Expanded(
                child: _buildGradientSection(
                  [const Color(0xFF86EFAC), const Color(0xFF22C55E)],
                  isFirst: true,
                ),
              ),
              // Skills section (light to dark orange)
              Expanded(
                child: _buildGradientSection(
                  [const Color(0xFFFED7AA), const Color(0xFFEA580C)],
                ),
              ),
              // Invest section (light to dark blue)
              Expanded(
                child: _buildGradientSection(
                  [const Color(0xFFBFDBFE), const Color(0xFF3B82F6)],
                  isLast: true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Stage indicator
        Row(
          children: [
            // Position the indicator based on current stage
            Expanded(
              flex: currentStage == 0 ? 1 : (currentStage == 1 ? 3 : 5),
              child: const SizedBox(),
            ),
            Column(
              children: [
                CustomPaint(
                  size: const Size(12, 8),
                  painter: _TrianglePainter(color: const Color(0xFF3B82F6)),
                ),
                const SizedBox(height: 4),
                const Text(
                  'STAGE',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: currentStage == 0 ? 5 : (currentStage == 1 ? 3 : 1),
              child: const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGradientSection(List<Color> colors, {bool isFirst = false, bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.horizontal(
          left: isFirst ? const Radius.circular(2) : Radius.zero,
          right: isLast ? const Radius.circular(2) : Radius.zero,
        ),
      ),
    );
  }

  Widget _buildPortfolioPerformance() {
    final timePeriods = ['All', 'D', 'W', 'M', 'Y'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  'Portfolio Performance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                _buildInfoIcon('Portfolio Performance'),
              ],
            ),
            const Icon(Icons.calendar_today, color: Color(0xFF9CA3AF), size: 20),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: timePeriods.map((period) {
            final isSelected = _selectedTimePeriod == period;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedTimePeriod = period),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF3B82F6)
                        : Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      period,
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildReturnCircle() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Net Profit',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 6),
              _buildInfoIcon('Net Profit', size: 14),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 140,
            height: 140,
            child: CustomPaint(
              painter: CircularProgressPainter(
                progress: 0.65,
                progressColor: const Color(0xFF22C55E),
                backgroundColor: const Color(0xFF374151),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+\$500',
                      style: TextStyle(
                        color: Color(0xFF22C55E),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+5.0%',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Not Qualified',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskLevel() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Risk Level',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 6),
              _buildInfoIcon('Risk Level', size: 14),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(10, (index) {
              Color boxColor;
              if (index < 3) {
                boxColor = const Color(0xFF22C55E);
              } else if (index < 6) {
                boxColor = const Color(0xFFEAB308);
              } else {
                boxColor = const Color(0xFFEF4444);
              }

              final isActive = index < 3; // Risk level 3

              return Expanded(
                child: Container(
                  height: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: isActive ? boxColor : boxColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
              Text('10', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
            ],
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              'Low Risk',
              style: TextStyle(
                color: Color(0xFF22C55E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObjectives() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Objectives',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            _buildInfoIcon('Trades'),
          ],
        ),
        // First row: Trades and Days
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildObjectiveCircleLarge(
              label: 'Number of trades',
              value: '10',
              progress: 1.0,
              color: const Color(0xFF22C55E),
              target: '10',
            ),
            _buildObjectiveCircleLarge(
              label: 'Challenge Days',
              value: '15',
              progress: 1.0,
              color: const Color(0xFF3B82F6),
              target: '15',
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Second row: Profit, Daily Loss, Max Loss
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildObjectiveCircleMedium(
              label: 'Profit Target',
              value: '\$1200',
              percentage: '6%',
              progress: 0.75,
              color: const Color(0xFF22C55E),
              targetPercentage: '8%',
              targetValue: '\$1600',
            ),
            _buildObjectiveCircleMedium(
              label: 'Max Daily Loss',
              value: '\$500',
              percentage: '2.5%',
              progress: 0.5,
              color: const Color(0xFFEF4444),
              targetPercentage: '5%',
              targetValue: '\$1000',
            ),
            _buildObjectiveCircleMedium(
              label: 'Max Loss Limit',
              value: '\$1500',
              percentage: '9.4%',
              progress: 0.94,
              color: const Color(0xFFEF4444),
              targetPercentage: '10%',
              targetValue: '\$1600',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildObjectiveCircleLarge({
    required String label,
    required String value,
    required double progress,
    required Color color,
    required String target,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CustomPaint(
            painter: CircularProgressPainter(
              progress: progress,
              progressColor: color,
              backgroundColor: const Color(0xFF374151),
              strokeWidth: 6,
            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 4),
            _buildInfoIcon(label == 'Number of trades' ? 'Trades' : 'Days', size: 12),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          target,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildObjectiveCircleMedium({
    required String label,
    required String value,
    required String percentage,
    required double progress,
    required Color color,
    required String targetPercentage,
    required String targetValue,
  }) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CustomPaint(
              painter: CircularProgressPainter(
                progress: progress,
                progressColor: color,
                backgroundColor: const Color(0xFF374151),
                strokeWidth: 5,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      percentage,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 4),
              _buildInfoIcon(
                label.contains('Profit') ? 'Profit' : (label.contains('Daily') ? 'Daily Loss' : 'Max Loss'),
                size: 10,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '($targetPercentage) $targetValue',
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetAllocation() {
    final allocations = [
      {'label': 'Tech', 'value': 45.0, 'color': const Color(0xFF3B82F6)},
      {'label': 'Finance', 'value': 25.0, 'color': const Color(0xFF22C55E)},
      {'label': 'Healthcare', 'value': 15.0, 'color': const Color(0xFFA855F7)},
      {'label': 'Energy', 'value': 10.0, 'color': const Color(0xFFF97316)},
      {'label': 'Other', 'value': 5.0, 'color': const Color(0xFF9CA3AF)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Asset Allocation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            _buildInfoIcon('Asset Allocation'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: CustomPaint(
                painter: DonutChartPainter(
                  segments: allocations.map((a) =>
                    DonutSegment(a['value'] as double, a['color'] as Color)
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: allocations.map((a) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: a['color'] as Color,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        a['label'] as String,
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${(a['value'] as double).toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatisticsGrid() {
    final stats = [
      {'label': 'Win Rate', 'value': '65%', 'color': const Color(0xFF22C55E)},
      {'label': 'Loss Rate', 'value': '35%', 'color': const Color(0xFFEF4444)},
      {'label': 'Max DD', 'value': '-8.5%', 'color': const Color(0xFFEF4444)},
      {'label': 'AVG Loss', 'value': '-\$45', 'color': const Color(0xFFEF4444)},
      {'label': 'AVG Profit', 'value': '+\$89', 'color': const Color(0xFF22C55E)},
      {'label': 'AVG RRR', 'value': '1:2', 'color': const Color(0xFF3B82F6)},
      {'label': 'Profit Factor', 'value': '1.98', 'color': const Color(0xFF22C55E)},
      {'label': 'Sharpe Ratio', 'value': '1.45', 'color': const Color(0xFF3B82F6)},
      {'label': 'Expectancy', 'value': '\$32', 'color': const Color(0xFF22C55E)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Statistics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            _buildInfoIcon('Statistics'),
          ],
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1.2,
          children: stats.map((stat) => _buildStatBox(
            stat['label'] as String,
            stat['value'] as String,
            stat['color'] as Color,
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildStatBox(String label, String value, Color valueColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 4),
              _buildInfoIcon(label, size: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Tab Headers
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildBottomTabButton('watchlist', 'Watch List'),
                _buildBottomTabButton('holding', 'Holding'),
                _buildBottomTabButton('orders', 'Orders'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Tab Content
          if (_selectedBottomTab == 'watchlist') _buildWatchList(),
          if (_selectedBottomTab == 'holding') _buildHoldingList(),
          if (_selectedBottomTab == 'orders') _buildOrdersList(),
        ],
      ),
    );
  }

  Widget _buildBottomTabButton(String tab, String label) {
    final isSelected = _selectedBottomTab == tab;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedBottomTab = tab),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWatchList() {
    return Column(
      children: watchlistStocks.map((stock) => _buildAssetRow(
        stock['symbol'] as String,
        stock['name'] as String,
        stock['price'] as String,
        stock['change'] as String,
        stock['isPositive'] as bool,
        stock['color'] as Color,
      )).toList(),
    );
  }

  Widget _buildHoldingList() {
    return Column(
      children: [
        // AAPL Holding
        _buildHoldingCard(
          symbol: 'AAPL',
          name: 'Apple Inc',
          logoUrl: 'https://logo.clearbit.com/apple.com',
          portfolioPercent: 12,
          quantity: 250,
          invested: 60500,
          currentValue: 60700,
          avgPrice: 245.50,
          currentPrice: 250.00,
          profitAmount: 360.00,
          profitPercent: 1.49,
          isPositive: true,
        ),
        const SizedBox(height: 12),
        // NFLX Holding
        _buildHoldingCard(
          symbol: 'NFLX',
          name: 'Netflix Inc',
          logoUrl: 'https://logo.clearbit.com/netflix.com',
          portfolioPercent: 8,
          quantity: 150,
          invested: 95000,
          currentValue: 96792,
          avgPrice: 633.33,
          currentPrice: 645.28,
          profitAmount: -1792.00,
          profitPercent: -1.89,
          isPositive: false,
        ),
        const SizedBox(height: 12),
        // TSLA Holding
        _buildHoldingCard(
          symbol: 'TSLA',
          name: 'Tesla Inc',
          logoUrl: 'https://logo.clearbit.com/tesla.com',
          portfolioPercent: 6,
          quantity: 200,
          invested: 45000,
          currentValue: 47744,
          avgPrice: 225.00,
          currentPrice: 238.72,
          profitAmount: 2744.00,
          profitPercent: 6.10,
          isPositive: true,
        ),
      ],
    );
  }

  Widget _buildHoldingCard({
    required String symbol,
    required String name,
    required String logoUrl,
    required int portfolioPercent,
    required int quantity,
    required double invested,
    required double currentValue,
    required double avgPrice,
    required double currentPrice,
    required double profitAmount,
    required double profitPercent,
    required bool isPositive,
  }) {
    final profitColor = isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444);

    return GestureDetector(
      onTap: () {
        // Handle tap - can navigate to stock detail
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          children: [
            // Header row with logo, name, and portfolio badge
            Row(
              children: [
                // Logo and name
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        logoUrl,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              symbol[0],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          symbol,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                // Portfolio badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3B82F6),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Portfolio $portfolioPercent%',
                        style: const TextStyle(
                          color: Color(0xFF3B82F6),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Details section
            Column(
              children: [
                // Quantity row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quantity',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Invested row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Invested',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ ${_formatNumber(invested)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          ' → ',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '\$ ${_formatNumber(currentValue)}',
                          style: TextStyle(
                            color: isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Avg Price row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Avg Price',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ ${avgPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          ' → ',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '\$ ${currentPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Profit section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: profitColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${isPositive ? '+' : ''}\$${profitAmount.abs().toStringAsFixed(2)}',
                    style: TextStyle(
                      color: profitColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '(${isPositive ? '+' : ''}${profitPercent.toStringAsFixed(2)}%)',
                    style: TextStyle(
                      color: profitColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(double number) {
    if (number >= 1000) {
      return number.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
    }
    return number.toStringAsFixed(2);
  }

  Widget _buildOrdersList() {
    return Column(
      children: [
        // Order Status Tabs
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildOrderTabButton('Open', 2),
              _buildOrderTabButton('Pending', 4),
              _buildOrderTabButton('Closed', 4),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Order Content based on selected tab
        if (_selectedOrderTab == 'Open') ..._buildOpenOrders(),
        if (_selectedOrderTab == 'Pending') ..._buildPendingOrders(),
        if (_selectedOrderTab == 'Closed') ..._buildClosedOrders(),
      ],
    );
  }

  Widget _buildOrderTabButton(String tab, int count) {
    final isSelected = _selectedOrderTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedOrderTab = tab),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: tab,
                    style: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' ($count)',
                    style: TextStyle(
                      color: isSelected ? Colors.white.withValues(alpha: 0.7) : const Color(0xFF6B7280),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOpenOrders() {
    return [
      _buildOrderCard(
        date: '08-10-2025 14:23',
        symbol: 'AAPL',
        name: 'Apple Inc',
        logoUrl: 'https://logo.clearbit.com/apple.com',
        portfolioPercent: 12,
        orderType: 'New Buy',
        orderPercent: '20%',
        units: 250,
        invested: 60500,
        currentValue: 60700,
        entryPrice: 245.50,
        currentPrice: 250.00,
        stopLoss: 240.00,
        takeProfit: 260.00,
        profitAmount: 360.00,
        profitPercent: 1.49,
        isPositive: true,
        showButtons: false,
      ),
      const SizedBox(height: 12),
      _buildOrderCard(
        date: '05-10-2025 09:45',
        symbol: 'AAPL',
        name: 'Apple Inc',
        logoUrl: 'https://logo.clearbit.com/apple.com',
        portfolioPercent: 8,
        orderType: 'Add',
        orderPercent: '10%',
        units: 150,
        invested: 45200,
        currentValue: 44280,
        entryPrice: 301.33,
        currentPrice: 295.20,
        stopLoss: 290.00,
        takeProfit: 315.00,
        profitAmount: -920.00,
        profitPercent: -2.04,
        isPositive: false,
        showButtons: false,
      ),
    ];
  }

  List<Widget> _buildPendingOrders() {
    return [
      _buildOrderCard(
        date: '15-03-2025 11:30',
        symbol: 'TSLA',
        name: 'Tesla Inc',
        logoUrl: 'https://logo.clearbit.com/tesla.com',
        portfolioPercent: 5,
        orderType: 'New Buy',
        orderPercent: '10%',
        units: 100,
        invested: 24000,
        currentValue: 24500,
        entryPrice: 240.00,
        currentPrice: 245.00,
        stopLoss: 235.00,
        takeProfit: 255.00,
        isPositive: true,
        showButtons: true,
      ),
      const SizedBox(height: 12),
      _buildOrderCard(
        date: '14-03-2025 16:10',
        symbol: 'MSFT',
        name: 'Microsoft Corp',
        logoUrl: 'https://logo.clearbit.com/microsoft.com',
        portfolioPercent: 10,
        orderType: 'Add',
        orderPercent: '10%',
        units: 200,
        invested: 68000,
        currentValue: 68400,
        entryPrice: 340.00,
        currentPrice: 342.00,
        stopLoss: 330.00,
        takeProfit: 355.00,
        isPositive: true,
        showButtons: true,
      ),
      const SizedBox(height: 12),
      _buildOrderCard(
        date: '13-03-2025 10:05',
        symbol: 'AAPL',
        name: 'Apple Inc',
        logoUrl: 'https://logo.clearbit.com/apple.com',
        portfolioPercent: 8,
        orderType: 'Reduce',
        orderPercent: '10%',
        units: 50,
        invested: 17500,
        currentValue: 15750,
        entryPrice: 175.00,
        currentPrice: 175.00,
        stopLoss: 165.00,
        takeProfit: 185.00,
        isPositive: false,
        isReduce: true,
        showButtons: true,
      ),
      const SizedBox(height: 12),
      _buildOrderCard(
        date: '12-03-2025 13:52',
        symbol: 'NVDA',
        name: 'NVIDIA Corp',
        logoUrl: 'https://logo.clearbit.com/nvidia.com',
        portfolioPercent: 12,
        orderType: 'Sold Out',
        orderPercent: '100%',
        units: 0,
        invested: 51200,
        currentValue: 0,
        entryPrice: 512.00,
        currentPrice: 512.00,
        stopLoss: 490.00,
        takeProfit: 530.00,
        isPositive: false,
        isReduce: true,
        showButtons: true,
      ),
    ];
  }

  List<Widget> _buildClosedOrders() {
    return [
      _buildOrderCard(
        date: '20-09-2025 15:30',
        symbol: 'AMZN',
        name: 'Amazon Inc',
        logoUrl: 'https://logo.clearbit.com/amazon.com',
        portfolioPercent: 7,
        orderType: 'Reduce',
        orderPercent: '10%',
        units: 80,
        invested: 12000,
        currentValue: 12800,
        entryPrice: 150.00,
        currentPrice: 160.00,
        stopLoss: 145.00,
        takeProfit: 170.00,
        profitAmount: 800.00,
        profitPercent: 6.67,
        isPositive: true,
        isReduce: true,
        showButtons: false,
      ),
      const SizedBox(height: 12),
      _buildOrderCard(
        date: '15-09-2025 12:18',
        symbol: 'NFLX',
        name: 'Netflix Inc',
        logoUrl: 'https://logo.clearbit.com/netflix.com',
        portfolioPercent: 4,
        orderType: 'Soldout',
        orderPercent: '10%',
        units: 50,
        invested: 20000,
        currentValue: 21000,
        entryPrice: 400.00,
        currentPrice: 420.00,
        stopLoss: 390.00,
        takeProfit: 440.00,
        profitAmount: 1000.00,
        profitPercent: 5.00,
        isPositive: true,
        isReduce: true,
        showButtons: false,
      ),
      const SizedBox(height: 12),
      _buildClosedOrderCard(
        date: '10-09-2025 09:42',
        symbol: 'META',
        name: 'Meta Platforms',
        logoUrl: 'https://logo.clearbit.com/meta.com',
        portfolioPercent: 6,
        status: 'Cancelled',
        units: 120,
        invested: 35400,
        avgPrice: 295.00,
        stopLoss: 285.00,
        takeProfit: 330.00,
        statusMessage: 'Cancelled by User',
      ),
      const SizedBox(height: 12),
      _buildClosedOrderCard(
        date: '05-09-2025 16:55',
        symbol: 'GOOGL',
        name: 'Alphabet Inc',
        logoUrl: 'https://logo.clearbit.com/google.com',
        portfolioPercent: 9,
        status: 'Rejected',
        units: 200,
        invested: 28500,
        avgPrice: 142.50,
        stopLoss: 135.00,
        takeProfit: 155.00,
        statusMessage: 'Not enough money',
      ),
    ];
  }

  Widget _buildOrderCard({
    required String date,
    required String symbol,
    required String name,
    required String logoUrl,
    required int portfolioPercent,
    required String orderType,
    required String orderPercent,
    required int units,
    required double invested,
    required double currentValue,
    required double entryPrice,
    required double currentPrice,
    required double stopLoss,
    required double takeProfit,
    double? profitAmount,
    double? profitPercent,
    required bool isPositive,
    bool isReduce = false,
    required bool showButtons,
  }) {
    final orderTypeColor = isReduce ? const Color(0xFFEF4444) : const Color(0xFF22C55E);
    final valueColor = isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date
          Text(
            date,
            style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
          ),
          const SizedBox(height: 8),
          // Header
          Row(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      logoUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(symbol[0], style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(symbol, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(name, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF3B82F6), shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text('Portfolio $portfolioPercent%', style: const TextStyle(color: Color(0xFF3B82F6), fontSize: 11, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Order Details
          _buildOrderDetailRow(
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: orderType, style: TextStyle(color: orderTypeColor, fontSize: 13, fontWeight: FontWeight.w500)),
                  TextSpan(text: ' $orderPercent', style: TextStyle(color: orderTypeColor, fontSize: 13)),
                  const TextSpan(text: ' → ', style: TextStyle(color: Colors.white, fontSize: 13)),
                  const TextSpan(text: 'Units', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                ],
              ),
            ),
            Text(units.toString(), style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('Invested', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
            Row(
              children: [
                Text('\$ ${_formatNumber(invested)}', style: const TextStyle(color: Colors.white, fontSize: 13)),
                const Text(' → ', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                Text('\$ ${_formatNumber(currentValue)}', style: TextStyle(color: valueColor, fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('Entry Price', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
            Row(
              children: [
                Text('\$ ${entryPrice.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 13)),
                const Text(' → ', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                Text('\$ ${currentPrice.toStringAsFixed(2)}', style: TextStyle(color: valueColor, fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('SL', style: TextStyle(color: Color(0xFFEF4444), fontSize: 13, fontWeight: FontWeight.w500)),
            Text('\$ ${stopLoss.toStringAsFixed(2)}', style: const TextStyle(color: Color(0xFFEF4444), fontSize: 13)),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('TP', style: TextStyle(color: Color(0xFF22C55E), fontSize: 13, fontWeight: FontWeight.w500)),
            Text('\$ ${takeProfit.toStringAsFixed(2)}', style: const TextStyle(color: Color(0xFF22C55E), fontSize: 13)),
          ),
          const SizedBox(height: 16),
          // Profit/Loss or Buttons
          if (showButtons)
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('Modify Order', style: TextStyle(color: Color(0xFF3B82F6), fontSize: 13, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('Cancel Order', style: TextStyle(color: Color(0xFFEF4444), fontSize: 13, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          else if (profitAmount != null && profitPercent != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: (isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444)).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${isPositive ? '+' : ''}\$${profitAmount.abs().toStringAsFixed(2)}',
                    style: TextStyle(color: isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444), fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '(${isPositive ? '+' : ''}${profitPercent.toStringAsFixed(2)}%)',
                    style: TextStyle(color: isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444), fontSize: 14),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildClosedOrderCard({
    required String date,
    required String symbol,
    required String name,
    required String logoUrl,
    required int portfolioPercent,
    required String status,
    required int units,
    required double invested,
    required double avgPrice,
    required double stopLoss,
    required double takeProfit,
    required String statusMessage,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11)),
          const SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      logoUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color: const Color(0xFF3B82F6), borderRadius: BorderRadius.circular(8)),
                        child: Center(child: Text(symbol[0], style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(symbol, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(name, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF3B82F6).withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF3B82F6), shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text('Portfolio $portfolioPercent%', style: const TextStyle(color: Color(0xFF3B82F6), fontSize: 11, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildOrderDetailRow(
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: status, style: const TextStyle(color: Color(0xFFF59E0B), fontSize: 13, fontWeight: FontWeight.w500)),
                  const TextSpan(text: ' → ', style: TextStyle(color: Colors.white, fontSize: 13)),
                  const TextSpan(text: 'Units', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                ],
              ),
            ),
            Text(units.toString(), style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('Invested', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
            Text('\$ ${_formatNumber(invested)}', style: const TextStyle(color: Colors.white, fontSize: 13)),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('Avg Price', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
            Text('\$ ${avgPrice.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 13)),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('SL', style: TextStyle(color: Color(0xFFEF4444), fontSize: 13, fontWeight: FontWeight.w500)),
            Text('\$ ${stopLoss.toStringAsFixed(2)}', style: const TextStyle(color: Color(0xFFEF4444), fontSize: 13)),
          ),
          const SizedBox(height: 8),
          _buildOrderDetailRow(
            const Text('TP', style: TextStyle(color: Color(0xFF22C55E), fontSize: 13, fontWeight: FontWeight.w500)),
            Text('\$ ${takeProfit.toStringAsFixed(2)}', style: const TextStyle(color: Color(0xFF22C55E), fontSize: 13)),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(statusMessage, style: const TextStyle(color: Color(0xFFF59E0B), fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailRow(Widget label, Widget value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [label, value],
    );
  }

  Widget _buildAssetRow(String symbol, String name, String price, String change, bool isPositive, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                symbol[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  symbol,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: (isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444)).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  change,
                  style: TextStyle(
                    color: isPositive ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Painters

class TrianglePointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    this.strokeWidth = 8,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle
    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.progressColor != progressColor;
  }
}

class DonutSegment {
  final double value;
  final Color color;

  DonutSegment(this.value, this.color);
}

class DonutChartPainter extends CustomPainter {
  final List<DonutSegment> segments;

  DonutChartPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 24.0;

    double startAngle = -math.pi / 2;
    final total = segments.fold<double>(0, (sum, s) => sum + s.value);

    for (final segment in segments) {
      final sweepAngle = (segment.value / total) * 2 * math.pi;

      final paint = Paint()
        ..color = segment.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle - 0.02, // Small gap between segments
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) {
    return oldDelegate.segments != segments;
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TrianglePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
