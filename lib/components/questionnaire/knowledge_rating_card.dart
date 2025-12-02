import 'package:flutter/material.dart';

class KnowledgeRatingCard extends StatefulWidget {
  final String title;
  final List<String> areas;
  final Map<String, int> ratings;
  final Function(String, int) onRatingChanged;
  final VoidCallback onContinue;
  final bool isArabic;
  final String helperText;
  final String continueText;
  final String rateAllText;
  final String gotItText;

  const KnowledgeRatingCard({
    super.key,
    required this.title,
    required this.areas,
    required this.ratings,
    required this.onRatingChanged,
    required this.onContinue,
    this.isArabic = false,
    this.helperText = '1 = No knowledge, 5 = Excellent',
    this.continueText = 'Continue',
    this.rateAllText = 'Rate all areas to continue',
    this.gotItText = 'Got it',
  });

  @override
  State<KnowledgeRatingCard> createState() => _KnowledgeRatingCardState();
}

class _KnowledgeRatingCardState extends State<KnowledgeRatingCard> {
  bool get allRated => widget.areas.every((area) => widget.ratings[area] != null);

  // Descriptions for each knowledge area
  static const Map<String, String> _areaDescriptions = {
    'Stock Markets': 'Understanding of how stock exchanges work, including buying and selling shares, market indices, and stock valuation methods.',
    'Bonds & Fixed Income': 'Knowledge of debt securities, including government and corporate bonds, yield calculations, and interest rate impacts.',
    'Mutual Funds': 'Understanding of pooled investment vehicles, including fund types, expense ratios, NAV, and diversification benefits.',
    'ETFs': 'Exchange-Traded Funds knowledge, including how they trade, tracking indices, and differences from mutual funds.',
    'Options & Derivatives': 'Understanding of financial contracts deriving value from underlying assets, including calls, puts, and hedging strategies.',
    'Forex Trading': 'Foreign exchange market knowledge, including currency pairs, pip values, leverage, and macroeconomic factors.',
    'Cryptocurrency': 'Understanding of digital currencies, blockchain technology, wallets, exchanges, and crypto market dynamics.',
    'Real Estate Investing': 'Knowledge of property investment, including REITs, rental income, property valuation, and market cycles.',
    'Technical Analysis': 'Understanding of chart patterns, indicators, support/resistance levels, and price action trading.',
    'Fundamental Analysis': 'Knowledge of evaluating securities through financial statements, ratios, and economic factors.',
    'Risk Management': 'Understanding of portfolio risk, position sizing, stop-losses, and diversification strategies.',
    'Portfolio Management': 'Knowledge of asset allocation, rebalancing, and optimizing risk-adjusted returns.',
    'Tax Planning': 'Understanding of investment taxation, capital gains, tax-loss harvesting, and tax-advantaged accounts.',
    'Retirement Planning': 'Knowledge of retirement accounts, withdrawal strategies, and long-term investment planning.',
    'Economic Indicators': 'Understanding of GDP, inflation, employment data, and their impact on markets.',
  };

  void _showAreaInfoDialog(String area) {
    final description = _areaDescriptions[area] ?? 'Knowledge and understanding of $area concepts and practices.';
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF1A1A3E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: const Color(0xFF22C55E).withValues(alpha: 0.3)),
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
                      color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.school_outlined,
                      color: Color(0xFF22C55E),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      area,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
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
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.gotItText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.helperText,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                const SizedBox(height: 24),
                ...widget.areas.map((area) {
                  final rating = widget.ratings[area] ?? 0;
                  return _buildRatingRow(area, rating);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: allRated ? widget.onContinue : null,
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: allRated
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF22C55E),
                            Color(0xFF3B82F6),
                            Color(0xFFA855F7),
                          ],
                        )
                      : null,
                  color: allRated ? null : Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: allRated
                      ? [
                          BoxShadow(
                            color: const Color(0xFF3B82F6).withValues(alpha: 0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        allRated ? widget.continueText : widget.rateAllText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: allRated ? Colors.white : Colors.white60,
                        ),
                      ),
                      if (allRated) ...[
                        const SizedBox(width: 8),
                        Icon(
                          widget.isArabic ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(String area, int currentRating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: currentRating > 0
              ? const Color(0xFF22C55E).withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  area,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _showAreaInfoDialog(area),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white.withValues(alpha: 0.5),
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              final value = index + 1;
              final isSelected = currentRating == value;
              return GestureDetector(
                onTap: () => widget.onRatingChanged(area, value),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _getRatingColor(value)
                        : Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? _getRatingColor(value)
                          : Colors.white.withValues(alpha: 0.2),
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: _getRatingColor(value).withValues(alpha: 0.4),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      '$value',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.white70,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color _getRatingColor(int rating) {
    switch (rating) {
      case 1:
        return Colors.red.shade600;
      case 2:
        return Colors.orange.shade600;
      case 3:
        return Colors.amber.shade600;
      case 4:
        return Colors.lightGreen.shade600;
      case 5:
        return const Color(0xFF22C55E);
      default:
        return Colors.grey;
    }
  }
}
