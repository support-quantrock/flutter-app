import 'package:flutter/material.dart';

class PortfolioOption {
  final String value;
  final String label;
  final bool popular;
  final String priceMain;
  final String priceSub;

  PortfolioOption({
    required this.value,
    required this.label,
    required this.popular,
    required this.priceMain,
    required this.priceSub,
  });
}

class ChallengeSignupPage extends StatefulWidget {
  final String mode; // 'free', 'premium', 'addfund'

  const ChallengeSignupPage({
    super.key,
    required this.mode,
  });

  @override
  State<ChallengeSignupPage> createState() => _ChallengeSignupPageState();
}

class _ChallengeSignupPageState extends State<ChallengeSignupPage> {
  late String _selectedPortfolioSize;
  bool _acceptedTerms = false;

  bool get isFreeTrial => widget.mode == 'free';
  bool get isAddFund => widget.mode == 'addfund';

  List<PortfolioOption> get freeTrialSizes => [
    PortfolioOption(value: '50000', label: '\$50,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '25000', label: '\$25,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '10000', label: '\$10,000', popular: true, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '5000', label: '\$5,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '1000', label: '\$1,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
  ];

  List<PortfolioOption> get premiumSizes => [
    PortfolioOption(value: '100000', label: '\$100,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '75000', label: '\$75,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '50000', label: '\$50,000', popular: true, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '25000', label: '\$25,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
    PortfolioOption(value: '10000', label: '\$10,000', popular: false, priceMain: 'Free', priceSub: 'without risking'),
  ];

  List<PortfolioOption> get addFundSizes => [
    PortfolioOption(value: '100000', label: '\$100,000', popular: true, priceMain: '97\$', priceSub: 'one time payment'),
    PortfolioOption(value: '75000', label: '\$75,000', popular: false, priceMain: '79\$', priceSub: 'one time payment'),
    PortfolioOption(value: '50000', label: '\$50,000', popular: false, priceMain: '69\$', priceSub: 'one time payment'),
  ];

  List<PortfolioOption> get portfolioSizes {
    if (isFreeTrial) return freeTrialSizes;
    if (isAddFund) return addFundSizes;
    return premiumSizes;
  }

  @override
  void initState() {
    super.initState();
    _selectedPortfolioSize = portfolioSizes.first.value;
  }

  void _showTermsSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Visit: www.quantrock.com for terms and conditions'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleSubmit() {
    if (_acceptedTerms) {
      Navigator.pushReplacementNamed(context, '/skill-challenge');
    }
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
                padding: const EdgeInsets.all(20),
                child: _buildFormCard(),
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
          const Expanded(
            child: Text(
              'Start Your Challenge',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 40), // Placeholder for symmetry
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E3A8A), Color(0xFF1E293B)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🚀 Start Your Trading Simulation',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'We recommend choosing a trial amount close to what you plan to invest later — it\'s the safest way to learn how markets work and build confidence without risking real money.\n\n💼 Select your starting portfolio amount.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF94A3B8),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Portfolio Options
          ...portfolioSizes.map((option) => _buildPortfolioOption(option)),

          const SizedBox(height: 24),

          // Terms Checkbox
          _buildTermsCheckbox(),

          const SizedBox(height: 8),

          // Submit Button
          _buildSubmitButton(),

          const SizedBox(height: 16),

          // Disclaimer
          Text(
            'By submitting, you agree to our Terms of Service and Privacy Policy. You will receive a confirmation email with next steps.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xFF64748B),
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          // Legal Disclaimer
          _buildLegalDisclaimer(),
        ],
      ),
    );
  }

  Widget _buildPortfolioOption(PortfolioOption option) {
    final isSelected = _selectedPortfolioSize == option.value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPortfolioSize = option.value;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7C3AED).withValues(alpha: 0.15)
              : const Color(0xFF1E293B).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFA855F7) : const Color(0xFF7C3AED),
            width: 2,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Popular Badge
            if (option.popular)
              Positioned(
                top: -21,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF7C3AED),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  child: const Text(
                    'POPULAR',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

            // Content Row
            Row(
              children: [
                // Left side - Balance info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Balance',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        option.label,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right side - Price and radio
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      option.priceMain,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      option.priceSub,
                      style: TextStyle(
                        fontSize: isFreeTrial ? 11 : 16,
                        fontWeight: isFreeTrial ? FontWeight.w500 : FontWeight.w600,
                        color: const Color(0xFF10B981),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Radio Circle
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: option.popular ? const Color(0xFFA855F7) : const Color(0xFFEF4444),
                          width: 3,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: option.popular ? const Color(0xFFA855F7) : const Color(0xFFEF4444),
                                ),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _acceptedTerms = !_acceptedTerms;
            });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: _acceptedTerms
                  ? const Color(0xFF3B82F6)
                  : const Color(0xFF1E293B).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color(0xFF3B82F6),
                width: 2,
              ),
            ),
            child: _acceptedTerms
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _acceptedTerms = !_acceptedTerms;
              });
            },
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFCBD5E1),
                  height: 1.4,
                ),
                children: [
                  const TextSpan(text: 'I accept the '),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: _showTermsSnackbar,
                      child: const Text(
                        'general terms and conditions of use',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF3B82F6),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: _handleSubmit,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: _acceptedTerms
              ? const Color(0xFF3B82F6)
              : const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Opacity(
          opacity: _acceptedTerms ? 1.0 : 0.5,
          child: Text(
            isAddFund ? 'Portfolio deposit' : 'Create portfolio',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegalDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEF4444).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFEF4444).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '⚠️ Important Legal Disclaimer',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFFEF4444),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'All challenges and activities offered through the Quantrock platform are based on an educational simulation environment and do not represent real trading or actual investment in any form. The information, results, or performance displayed within the challenges should not be considered investment advice or a guarantee of future returns.\n\n'
            'Participation in the challenges is intended solely to enhance knowledge, develop investment skills, and evaluate educational performance. No content on the platform should be relied upon when making real trading or investment decisions.\n\n'
            'Quantrock provides education, training, and trading simulation services only. It does not operate as a financial broker, does not manage real portfolios, does not accept financial deposits, and does not offer any actual investment products. Price data and simulation technology are sourced from licensed market-data providers.\n\n'
            'Furthermore, the content and services provided through Quantrock are not directed to users residing in any country or jurisdiction where such use would violate local laws or regulations.',
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xFF94A3B8),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
