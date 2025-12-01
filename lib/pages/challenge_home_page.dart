import 'package:flutter/material.dart';

class ChallengeHomePage extends StatefulWidget {
  const ChallengeHomePage({super.key});

  @override
  State<ChallengeHomePage> createState() => _ChallengeHomePageState();
}

class _ChallengeHomePageState extends State<ChallengeHomePage>
    with TickerProviderStateMixin {
  bool _isFirstCardExpanded = false;
  bool _isSecondCardExpanded = false;
  String _selectedLanguage = 'en';

  late AnimationController _firstCardController;
  late AnimationController _secondCardController;
  late Animation<double> _firstCardAnimation;
  late Animation<double> _secondCardAnimation;

  String _t(String key) {
    final translations = {
      'beginners': {'en': 'Beginners', 'ar': 'المبتدئين'},
      'qualifiers': {'en': 'Qualifiers', 'ar': 'المؤهلين'},
      'learn_challenge': {'en': 'Learn Challenge', 'ar': 'تحدي التعلم'},
      'invest_challenge': {'en': 'Invest Challenge', 'ar': 'تحدي الاستثمار'},
      'free_simulator': {'en': 'Free Simulator Training (Optional)', 'ar': 'تدريب محاكي مجاني (اختياري)'},
      'premium_exclusive': {'en': 'Exclusively for Premium Pro Members', 'ar': 'حصرياً لأعضاء بريميوم برو'},
      'learn_description': {'en': 'Designed for beginners who want to build a solid foundation in trading and gradually develop essential investment skills. It\'s ideal for newcomers, university students, and even high-school learners who wish to practice trading safely through a free, risk-free virtual portfolio simulator.', 'ar': 'مصمم للمبتدئين الذين يرغبون في بناء أساس متين في التداول وتطوير مهارات الاستثمار الأساسية تدريجياً. إنه مثالي للوافدين الجدد وطلاب الجامعات وحتى طلاب المدارس الثانوية الذين يرغبون في ممارسة التداول بأمان من خلال محاكي محفظة افتراضية مجاني وخالي من المخاطر.'},
      'invest_description': {'en': 'Designed for qualified users, professionals, and Premium members, it offers real financial prizes within an advanced simulation environment that mimics the strategies of investors and hedge funds, without any actual risk. Participants manage a virtual portfolio of up to \$100,000 to trade in a 100% realistic market for 28 days.', 'ar': 'مصمم للمستخدمين المؤهلين والمحترفين وأعضاء بريميوم، يقدم جوائز مالية حقيقية ضمن بيئة محاكاة متقدمة تحاكي استراتيجيات المستثمرين وصناديق التحوط، دون أي مخاطر فعلية. يدير المشاركون محفظة افتراضية تصل إلى 100,000 دولار للتداول في سوق واقعي 100% لمدة 28 يوماً.'},
      'rewards_benefits': {'en': 'Rewards & Benefits:', 'ar': 'المكافآت والمزايا:'},
      'premium_upgrade': {'en': 'Premium upgrade', 'ar': 'ترقية بريميوم'},
      'name_leaderboard': {'en': 'Name on Leaderboard', 'ar': 'الاسم في لوحة المتصدرين'},
      '28_days_skills': {'en': '28 days of skill challenges', 'ar': '28 يوماً من تحديات المهارات'},
      'investor_assessment': {'en': 'Investor Personality Assessment', 'ar': 'تقييم شخصية المستثمر'},
      'cash_prize': {'en': 'Cash prize up to \$1,000', 'ar': 'جائزة نقدية تصل إلى 1,000 دولار'},
      'full_access': {'en': 'Full access to all features', 'ar': 'وصول كامل لجميع الميزات'},
      'certificate': {'en': 'Quantrock Certificate', 'ar': 'شهادة كوانتروك'},
      '500_lessons': {'en': '500+ lessons', 'ar': '500+ درس'},
      'start_learning': {'en': 'Start Learning Challenge', 'ar': 'ابدأ تحدي التعلم'},
      'start_investment': {'en': 'Start Investment Challenge', 'ar': 'ابدأ تحدي الاستثمار'},
      'about_challenge': {'en': 'About the Challenge', 'ar': 'عن التحدي'},
      'challenge_subtitle': {'en': 'The largest investment challenge that combines training, competition, and real rewards.', 'ar': 'أكبر تحدي استثماري يجمع بين التدريب والمنافسة والمكافآت الحقيقية.'},
      'monthly_prizes': {'en': 'Monthly Prizes', 'ar': 'الجوائز الشهرية'},
      'premium_benefits': {'en': 'Premium Pro Membership Benefits', 'ar': 'مزايا عضوية بريميوم برو'},
      'winner_announced': {'en': 'The winner is announced on the first day of every month and receives:', 'ar': 'يتم الإعلان عن الفائز في اليوم الأول من كل شهر ويحصل على:'},
      'challenge_rules': {'en': 'Challenge Rules', 'ar': 'قواعد التحدي'},
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

  @override
  void initState() {
    super.initState();
    _firstCardController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _secondCardController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _firstCardAnimation = CurvedAnimation(
      parent: _firstCardController,
      curve: Curves.easeInOut,
    );
    _secondCardAnimation = CurvedAnimation(
      parent: _secondCardController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _firstCardController.dispose();
    _secondCardController.dispose();
    super.dispose();
  }

  void _toggleFirstCard() {
    setState(() {
      _isFirstCardExpanded = !_isFirstCardExpanded;
      if (_isFirstCardExpanded) {
        _firstCardController.forward();
      } else {
        _firstCardController.reverse();
      }
    });
  }

  void _toggleSecondCard() {
    setState(() {
      _isSecondCardExpanded = !_isSecondCardExpanded;
      if (_isSecondCardExpanded) {
        _secondCardController.forward();
      } else {
        _secondCardController.reverse();
      }
    });
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
                child: Column(
                  children: [
                    _buildLearnChallengeCard(),
                    const SizedBox(height: 24),
                    _buildInvestChallengeCard(),
                    const SizedBox(height: 24),
                    _buildAboutSection(),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A8A),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF3B82F6), width: 2),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 24),
          ),
          const Spacer(),
          _buildHeaderIcon(Icons.search),
          const SizedBox(width: 16),
          _buildHeaderIcon(Icons.star_outline),
          const SizedBox(width: 16),
          _buildHeaderIcon(Icons.notifications_outlined),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Icon(icon, color: Colors.white, size: 24);
  }

  Widget _buildLearnChallengeCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF22C55E).withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF065F46), Color(0xFF064E3B)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFF22C55E).withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF22C55E), width: 1.5),
                ),
                child: Text(
                  _t('beginners'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Top Row with Avatar and Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF22C55E), width: 2),
                      color: const Color(0xFF1E293B),
                    ),
                    child: const Icon(Icons.timer, color: Color(0xFF22C55E), size: 32),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _t('learn_challenge'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _t('free_simulator'),
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
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
                  _t('learn_description'),
                  style: const TextStyle(
                    color: Color(0xFFCBD5E1),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Rewards Section
              _buildRewardsSection(
                isGreen: true,
                rewards: [
                  {'icon': Icons.workspace_premium, 'text': 'Premium upgrade'},
                  {'icon': Icons.emoji_events, 'text': 'Name on Leaderboard'},
                  {'icon': Icons.calendar_month, 'text': '28 days of skill challenges'},
                  {'icon': Icons.psychology, 'text': 'Investor Personality Assessment'},
                ],
              ),

              // Expand Button
              GestureDetector(
                onTap: _toggleFirstCard,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                  ),
                  child: AnimatedRotation(
                    turns: _isFirstCardExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24),
                  ),
                ),
              ),

              // Expanded Content
              SizeTransition(
                sizeFactor: _firstCardAnimation,
                child: _buildExpandedDetails(isGreen: true),
              ),

              // Join Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/challenge-signup',
                      arguments: {'mode': 'free', 'language': _selectedLanguage},
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF22C55E), width: 2),
                    ),
                    child: Text(
                      _t('start_learning'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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

  Widget _buildInvestChallengeCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA78BFA).withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF7C3AED), Color(0xFF4C1D95)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFA78BFA).withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFA78BFA).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFA78BFA), width: 1.5),
                ),
                child: Text(
                  _t('qualifiers'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Top Row with Avatar and Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFA78BFA), width: 2),
                      color: const Color(0xFF1E293B),
                    ),
                    child: const Icon(Icons.flash_on, color: Color(0xFFA78BFA), size: 32),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _t('invest_challenge'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _t('premium_exclusive'),
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
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
                  _t('invest_description'),
                  style: const TextStyle(
                    color: Color(0xFFCBD5E1),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Rewards Section
              _buildRewardsSection(
                isGreen: false,
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
              ),

              // Expand Button
              GestureDetector(
                onTap: _toggleSecondCard,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                  ),
                  child: AnimatedRotation(
                    turns: _isSecondCardExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24),
                  ),
                ),
              ),

              // Expanded Content
              SizeTransition(
                sizeFactor: _secondCardAnimation,
                child: _buildExpandedDetails(isGreen: false),
              ),

              // Join Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/challenge-signup',
                      arguments: {'mode': 'premium', 'language': _selectedLanguage},
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA78BFA).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFA78BFA), width: 2),
                    ),
                    child: Text(
                      _t('start_investment'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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

  Widget _buildRewardsSection({required bool isGreen, required List<Map<String, dynamic>> rewards}) {
    final color = isGreen ? const Color(0xFF22C55E) : const Color(0xFFA78BFA);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withValues(alpha: 0.4)),
            ),
            child: const Text(
              'Rewards & Benefits:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: rewards
                      .take((rewards.length / 2).ceil())
                      .map((r) => _buildRewardItem(r['icon'], r['text'], color))
                      .toList(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: rewards
                      .skip((rewards.length / 2).ceil())
                      .map((r) => _buildRewardItem(r['icon'], r['text'], color))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRewardItem(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFFCBD5E1),
                fontSize: 10,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedDetails({required bool isGreen}) {
    final color = isGreen ? const Color(0xFF22C55E) : const Color(0xFFA78BFA);

    final List<String> monthlyPrizes = isGreen
        ? [
            'Their name listed on the monthly Leaderboard',
            'One month of free Premium subscription',
            'Direct nomination to the next stage: the Investment Challenge',
          ]
        : [
            'Direct access to the Investment Challenge',
            'Real-time analysis of global banks\' recommendations',
            'Tracking of hedge funds\' and top politicians\' trades',
            'Smart Money Flow – Insight into institutional money movements',
            'Comprehensive performance analytics highlighting your strengths and weaknesses',
          ];

    final List<String> rules = [
      'Start anytime',
      '28-day duration (can continue indefinitely)',
      'Complete 28 days of daily skill lessons',
      '70%+ success rate in daily exercises',
      'Daily loss limit: 5%',
      'Total loss limit: 10%',
      'Target profit threshold: 6%${isGreen ? '' : '+'}',
      'Maximum asset weight: 10%',
      'Minimum trades: 30',
      'Allowed assets: S&P 500 stocks / Gold / EUR/USD / Bitcoin',
      'Account leverage: 1:1',
      if (!isGreen) 'Winner can rejoin after 90 days',
    ];

    return Container(
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isGreen ? 'Monthly Prizes' : 'Premium Pro Membership Benefits',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (isGreen) ...[
            const SizedBox(height: 8),
            const Text(
              'The winner is announced on the first day of every month and receives:',
              style: TextStyle(
                color: Color(0xFFCBD5E1),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ],
          const SizedBox(height: 12),
          ...monthlyPrizes.map((prize) => _buildBulletPoint(prize, color)),
          const SizedBox(height: 16),
          const Text(
            'Challenge Rules',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ...rules.map((rule) => _buildBulletPoint(rule, color)),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text, Color color) {
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
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFFCBD5E1),
                fontSize: 13,
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
          Text(
            _t('about_challenge'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _t('challenge_subtitle'),
            style: const TextStyle(
              color: Color(0xFF3B82F6),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Quantrock\'s Investment Simulation Challenge is designed to bridge the gap between academic knowledge and real-world trading practice. It takes you on a 28-day investment journey filled with practical learning, where participants receive daily interactive lessons and exercises aimed at enhancing their trading and investment skills step by step.\n\n'
            'The challenge offers professionals, beginners, university students, and high-school students a realistic and risk-free experience. You will take on the role of a portfolio manager and executive trader inside a professional simulation environment that reflects the workflow of expert investors and replicates the markets with 100% accuracy.\n\n'
            'This experience blends hands-on training, real competitive challenges, and tangible rewards—providing a realistic simulation that helps you develop your investment skills, strengthen your practical abilities, and progressively advance toward higher levels of professionalism.',
            style: TextStyle(
              color: const Color(0xFFCBD5E1),
              fontSize: 11,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
