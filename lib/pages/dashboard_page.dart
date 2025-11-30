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
    'Net Assets': 'Your total account value including all cash and investments. This represents your overall portfolio worth.',
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
                const SizedBox(height: 8),
                _buildExpandButton(),
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 11,
                    ),
                  ),
                ),
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
                    Color(0xFF22C55E),
                    Color(0xFFEAB308),
                    Color(0xFFEF4444),
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

  Widget _buildExpandButton() {
    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AnimatedRotation(
          turns: _isExpanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white54,
            size: 28,
          ),
        ),
      ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Overview',
        style: TextStyle(
          color: Color(0xFF3B82F6),
          fontSize: 14,
          fontWeight: FontWeight.w600,
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
              // Learn section (teal/green gradient)
              Expanded(
                child: _buildGradientSection(
                  [const Color(0xFF0D9488), const Color(0xFF22C55E)],
                  isFirst: true,
                ),
              ),
              // Skills section (orange gradient)
              Expanded(
                child: _buildGradientSection(
                  [const Color(0xFFF97316), const Color(0xFFEA580C)],
                ),
              ),
              // Invest section (blue gradient)
              Expanded(
                child: _buildGradientSection(
                  [const Color(0xFF60A5FA), const Color(0xFF3B82F6)],
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
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
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
              'Level 3 - Low Risk',
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
        const SizedBox(height: 16),
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
        const SizedBox(height: 20),
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
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
      ),
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
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
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
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
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
      padding: const EdgeInsets.all(12),
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
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Text(
          'No holdings yet',
          style: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Text(
          'No orders yet',
          style: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 14,
          ),
        ),
      ),
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
