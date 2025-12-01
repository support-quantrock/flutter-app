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
  String _selectedLanguage = 'en';

  bool get isFreeTrial => widget.mode == 'free';
  bool get isAddFund => widget.mode == 'addfund';
  bool get _isArabic => _selectedLanguage == 'ar';

  String _t(String key) {
    final translations = {
      'start_your_challenge': {'en': 'Start Your Challenge', 'ar': 'ابدأ التحدي'},
      'start_trading_simulation': {'en': '🚀 Start Your Trading Simulation', 'ar': '🚀 ابدأ محاكاة التداول الخاصة بك'},
      'description_intro': {
        'en': 'We recommend choosing a trial amount close to what you plan to invest later — it\'s the safest way to learn how markets work and build confidence without risking real money.',
        'ar': 'نوصي باختيار مبلغ تجريبي قريب مما تخطط لاستثماره لاحقاً — إنها الطريقة الأكثر أماناً لتعلم كيفية عمل الأسواق وبناء الثقة دون المخاطرة بأموال حقيقية.'
      },
      'select_portfolio': {'en': '💼 Select your starting portfolio amount.', 'ar': '💼 اختر مبلغ محفظتك الأولية.'},
      'popular': {'en': 'POPULAR', 'ar': 'الأكثر شيوعاً'},
      'balance': {'en': 'Balance', 'ar': 'الرصيد'},
      'free': {'en': 'Free', 'ar': 'مجاني'},
      'without_risking': {'en': 'without risking', 'ar': 'بدون مخاطر'},
      'one_time_payment': {'en': 'one time payment', 'ar': 'دفعة واحدة'},
      'i_accept_the': {'en': 'I accept the ', 'ar': 'أوافق على '},
      'terms_and_conditions': {'en': 'general terms and conditions of use', 'ar': 'الشروط والأحكام العامة للاستخدام'},
      'create_portfolio': {'en': 'Create portfolio', 'ar': 'إنشاء المحفظة'},
      'portfolio_deposit': {'en': 'Portfolio deposit', 'ar': 'إيداع المحفظة'},
      'disclaimer_submit': {
        'en': 'By submitting, you agree to our Terms of Service and Privacy Policy. You will receive a confirmation email with next steps.',
        'ar': 'بإرسالك، فإنك توافق على شروط الخدمة وسياسة الخصوصية الخاصة بنا. ستتلقى بريداً إلكترونياً للتأكيد يحتوي على الخطوات التالية.'
      },
      'legal_disclaimer_title': {'en': '⚠️ Important Legal Disclaimer', 'ar': '⚠️ إخلاء مسؤولية قانوني مهم'},
      'legal_disclaimer_1': {
        'en': 'All challenges and activities offered through the Quantrock platform are based on an educational simulation environment and do not represent real trading or actual investment in any form. The information, results, or performance displayed within the challenges should not be considered investment advice or a guarantee of future returns.',
        'ar': 'جميع التحديات والأنشطة المقدمة من خلال منصة كوانتروك تعتمد على بيئة محاكاة تعليمية ولا تمثل تداولاً حقيقياً أو استثماراً فعلياً بأي شكل من الأشكال. لا ينبغي اعتبار المعلومات أو النتائج أو الأداء المعروض ضمن التحديات نصيحة استثمارية أو ضماناً للعوائد المستقبلية.'
      },
      'legal_disclaimer_2': {
        'en': 'Participation in the challenges is intended solely to enhance knowledge, develop investment skills, and evaluate educational performance. No content on the platform should be relied upon when making real trading or investment decisions.',
        'ar': 'المشاركة في التحديات تهدف فقط إلى تعزيز المعرفة وتطوير مهارات الاستثمار وتقييم الأداء التعليمي. لا ينبغي الاعتماد على أي محتوى على المنصة عند اتخاذ قرارات تداول أو استثمار حقيقية.'
      },
      'legal_disclaimer_3': {
        'en': 'Quantrock provides education, training, and trading simulation services only. It does not operate as a financial broker, does not manage real portfolios, does not accept financial deposits, and does not offer any actual investment products. Price data and simulation technology are sourced from licensed market-data providers.',
        'ar': 'توفر كوانتروك خدمات التعليم والتدريب ومحاكاة التداول فقط. لا تعمل كوسيط مالي، ولا تدير محافظ حقيقية، ولا تقبل ودائع مالية، ولا تقدم أي منتجات استثمارية فعلية. يتم الحصول على بيانات الأسعار وتقنية المحاكاة من مزودي بيانات السوق المرخصين.'
      },
      'legal_disclaimer_4': {
        'en': 'Furthermore, the content and services provided through Quantrock are not directed to users residing in any country or jurisdiction where such use would violate local laws or regulations.',
        'ar': 'علاوة على ذلك، المحتوى والخدمات المقدمة من خلال كوانتروك غير موجهة للمستخدمين المقيمين في أي بلد أو ولاية قضائية حيث يشكل هذا الاستخدام انتهاكاً للقوانين أو اللوائح المحلية.'
      },
      'terms_snackbar': {'en': 'Visit: www.quantrock.com for terms and conditions', 'ar': 'قم بزيارة: www.quantrock.com للاطلاع على الشروط والأحكام'},
    };
    return translations[key]?[_selectedLanguage] ?? translations[key]?['en'] ?? key;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null && args['language'] != null) {
      setState(() {
        _selectedLanguage = args['language'];
      });
    }
  }

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
      SnackBar(
        content: Text(_t('terms_snackbar')),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleSubmit() {
    if (_acceptedTerms) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
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
          Expanded(
            child: Text(
              _t('start_your_challenge'),
              textAlign: TextAlign.center,
              style: const TextStyle(
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
          Text(
            _t('start_trading_simulation'),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${_t('description_intro')}\n\n${_t('select_portfolio')}',
            style: const TextStyle(
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
            _t('disclaimer_submit'),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
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
                  child: Text(
                    _t('popular'),
                    style: const TextStyle(
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
                      Text(
                        _t('balance'),
                        style: const TextStyle(
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
                      option.priceMain == 'Free' ? _t('free') : option.priceMain,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      option.priceSub == 'without risking' ? _t('without_risking') :
                      option.priceSub == 'one time payment' ? _t('one_time_payment') : option.priceSub,
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
                  TextSpan(text: _t('i_accept_the')),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: _showTermsSnackbar,
                      child: Text(
                        _t('terms_and_conditions'),
                        style: const TextStyle(
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
            isAddFund ? _t('portfolio_deposit') : _t('create_portfolio'),
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
          Text(
            _t('legal_disclaimer_title'),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFFEF4444),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${_t('legal_disclaimer_1')}\n\n'
            '${_t('legal_disclaimer_2')}\n\n'
            '${_t('legal_disclaimer_3')}\n\n'
            '${_t('legal_disclaimer_4')}',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF94A3B8),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
