import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';
import '../components/questionnaire/single_choice_card.dart';
import '../components/questionnaire/single_choice_grid.dart';
import '../components/questionnaire/multi_select_chips.dart';
import '../components/questionnaire/knowledge_rating_card.dart';

const int totalQuestions = 20;

// Question categories for milestone rewards
enum QuestionCategory { profile, literacy, goals, readiness }

class QuestionData {
  final String title;
  final QuestionCategory category;
  final int xpReward;

  const QuestionData({
    required this.title,
    required this.category,
    this.xpReward = 40,
  });
}

final Map<int, QuestionData> questionMetadata = {
  // SECTION 1 — Personal Information & Investment Background
  1: const QuestionData(title: 'Gender', category: QuestionCategory.profile),
  2: const QuestionData(title: 'Age Group', category: QuestionCategory.profile),
  3: const QuestionData(title: 'Time Commitment', category: QuestionCategory.profile, xpReward: 50),
  4: const QuestionData(title: 'Active Portfolio', category: QuestionCategory.profile, xpReward: 50),
  5: const QuestionData(title: 'Portfolio Size', category: QuestionCategory.profile, xpReward: 50),
  6: const QuestionData(title: 'Knowledge Rating', category: QuestionCategory.profile, xpReward: 80),
  7: const QuestionData(title: 'Asset Classes', category: QuestionCategory.profile, xpReward: 60),
  8: const QuestionData(title: 'Chart Reading', category: QuestionCategory.profile, xpReward: 50),
  9: const QuestionData(title: 'Time Horizon', category: QuestionCategory.profile, xpReward: 50),
  // SECTION 2 — Financial Literacy & Personal Readiness
  10: const QuestionData(title: 'Market Risk', category: QuestionCategory.literacy, xpReward: 50),
  11: const QuestionData(title: 'Saving Discipline', category: QuestionCategory.literacy, xpReward: 50),
  12: const QuestionData(title: 'Emergency Savings', category: QuestionCategory.literacy, xpReward: 50),
  13: const QuestionData(title: 'Retirement', category: QuestionCategory.literacy, xpReward: 50),
  14: const QuestionData(title: 'Risk Tolerance', category: QuestionCategory.literacy, xpReward: 60),
  // SECTION 3 — Investment Objectives & User Motivation
  15: const QuestionData(title: 'Investment Goal', category: QuestionCategory.goals, xpReward: 50),
  16: const QuestionData(title: 'Quantrock Goal', category: QuestionCategory.goals, xpReward: 50),
  17: const QuestionData(title: 'Industries', category: QuestionCategory.goals, xpReward: 60),
  // SECTION 4 — Learning Readiness & Portfolio Preferences
  18: const QuestionData(title: 'Readiness', category: QuestionCategory.readiness, xpReward: 60),
  19: const QuestionData(title: 'Passive Income', category: QuestionCategory.readiness, xpReward: 60),
  20: const QuestionData(title: 'Demo Portfolio', category: QuestionCategory.readiness, xpReward: 80),
};

class InvestorProfilePage extends StatefulWidget {
  final String? symbol;
  final String? name;

  const InvestorProfilePage({
    super.key,
    this.symbol,
    this.name,
  });

  @override
  State<InvestorProfilePage> createState() => _InvestorProfilePageState();
}

class _InvestorProfilePageState extends State<InvestorProfilePage>
    with TickerProviderStateMixin {
  bool _showIntro = true;
  int _step = 1;
  bool _goingForward = true;
  int _totalXP = 0;
  int _currentLevel = 1;
  bool _showXPGain = false;
  bool _showLevelUp = false;
  bool _showMilestone = false;
  String _milestoneTitle = '';
  String _selectedLanguage = 'en';

  List<String> _selectedAssets = [];
  List<String> _selectedIndustries = [];
  final Map<String, int> _knowledgeRatings = {};

  // Translations
  String _t(String key) {
    final translations = {
      // Intro Screen
      'qiqt_title': {'en': 'QIQT', 'ar': 'QIQT'},
      'qiqt_full_title': {'en': 'Quantrock Investor Qualification Test', 'ar': 'اختبار تأهيل المستثمر من كوانتروك'},
      'qiqt_subtitle': {'en': 'Quantrock Investor Qualification Test (QIQT)', 'ar': 'اختبار تأهيل المستثمر من كوانتروك (QIQT)'},
      'intro_text1': {'en': 'QIQT is an intelligent qualification test built on OECD, MIT, and CFA standards, designed to measure your investment experience, financial literacy, motivations, and readiness to learn.', 'ar': 'QIQT هو اختبار تأهيل ذكي مبني على معايير OECD وMIT وCFA، مصمم لقياس خبرتك الاستثمارية ومعرفتك المالية ودوافعك واستعدادك للتعلم.'},
      'intro_text2': {'en': 'QIQT helps you assess your financial knowledge, investment background, and determine your ideal path inside Quantrock whether in challenges, daily lessons, or selecting the appropriate demo portfolio size.', 'ar': 'يساعدك QIQT في تقييم معرفتك المالية وخلفيتك الاستثمارية وتحديد مسارك المثالي داخل كوانتروك سواء في التحديات أو الدروس اليومية أو اختيار حجم المحفظة التجريبية المناسب.'},
      'purpose_title': {'en': 'What is the purpose of QIQT?', 'ar': 'ما هو الغرض من QIQT؟'},
      'purpose_subtitle': {'en': 'The test aims to accurately classify the user into one of the following levels:', 'ar': 'يهدف الاختبار إلى تصنيف المستخدم بدقة إلى أحد المستويات التالية:'},
      'beginner': {'en': 'Beginner', 'ar': 'مبتدئ'},
      'intermediate': {'en': 'Intermediate', 'ar': 'متوسط'},
      'advanced': {'en': 'Advanced', 'ar': 'متقدم'},
      'identifies_title': {'en': 'It works on identifying:', 'ar': 'يعمل على تحديد:'},
      'item_objectives': {'en': 'Investment objectives', 'ar': 'أهداف الاستثمار'},
      'item_experience': {'en': 'Investment experience', 'ar': 'الخبرة الاستثمارية'},
      'item_literacy': {'en': 'Financial knowledge and literacy', 'ar': 'المعرفة والثقافة المالية'},
      'item_readiness': {'en': 'Level of readiness and willingness to learn', 'ar': 'مستوى الاستعداد والرغبة في التعلم'},
      'item_challenge': {'en': 'The appropriate challenge level', 'ar': 'مستوى التحدي المناسب'},
      'item_portfolio': {'en': 'The appropriate simulated portfolio size', 'ar': 'حجم المحفظة التجريبية المناسب'},
      'item_path': {'en': 'The best learning path', 'ar': 'أفضل مسار للتعلم'},
      'item_motivation': {'en': 'The motivation for using the Quantrock app', 'ar': 'الدافع لاستخدام تطبيق كوانتروك'},
      'start_test': {'en': 'Start The Test', 'ar': 'ابدأ الاختبار'},
      'questions_count': {'en': '20 Questions', 'ar': '20 سؤال'},
      'time_estimate': {'en': '~5 minutes', 'ar': '~5 دقائق'},

      // Questions
      'q1_title': {'en': 'What is your gender?', 'ar': 'ما هو جنسك؟'},
      'q1_male': {'en': 'Male', 'ar': 'ذكر'},
      'q1_female': {'en': 'Female', 'ar': 'أنثى'},
      'q1_other': {'en': 'Prefer not to say', 'ar': 'أفضل عدم الإجابة'},

      'q2_title': {'en': 'What is your age group?', 'ar': 'ما هي فئتك العمرية؟'},
      'q2_under18': {'en': 'Under 18', 'ar': 'أقل من 18'},
      'q2_18_24': {'en': '18-24', 'ar': '18-24'},
      'q2_25_34': {'en': '25-34', 'ar': '25-34'},
      'q2_35_44': {'en': '35-44', 'ar': '35-44'},
      'q2_45_54': {'en': '45-54', 'ar': '45-54'},
      'q2_55plus': {'en': '55+', 'ar': '+55'},

      'q3_title': {'en': 'How much time can you commit to learning each week?', 'ar': 'كم من الوقت يمكنك تخصيصه للتعلم كل أسبوع؟'},
      'q3_less1': {'en': 'Less than 1 hour', 'ar': 'أقل من ساعة'},
      'q3_1_3': {'en': '1–3 hours', 'ar': '1-3 ساعات'},
      'q3_3_7': {'en': '3–7 hours', 'ar': '3-7 ساعات'},
      'q3_more7': {'en': 'More than 7 hours', 'ar': 'أكثر من 7 ساعات'},

      'q4_title': {'en': 'Do you currently have an active investment portfolio?', 'ar': 'هل لديك حالياً محفظة استثمارية نشطة؟'},
      'q4_yes': {'en': 'Yes, actively managing', 'ar': 'نعم، أديرها بنشاط'},
      'q4_no': {'en': 'No portfolio', 'ar': 'لا يوجد محفظة'},
      'q4_used_to': {'en': 'I used to have one', 'ar': 'كان لدي واحدة سابقاً'},

      'q5_title': {'en': 'What is the approximate size of your current or latest portfolio?', 'ar': 'ما هو الحجم التقريبي لمحفظتك الحالية أو الأخيرة؟'},
      'q5_less1k': {'en': 'Less than \$0.00 - \$1,000', 'ar': 'أقل من 0.00\$ - 1,000\$'},
      'q5_1k_10k': {'en': '\$1,000–\$10,000', 'ar': '1,000\$–10,000\$'},
      'q5_10k_25k': {'en': '\$10,000–\$25,000', 'ar': '10,000\$–25,000\$'},
      'q5_25k_100k': {'en': '\$25,000–\$100,000', 'ar': '25,000\$–100,000\$'},
      'q5_100k_500k': {'en': '\$100,000–\$500,000', 'ar': '100,000\$–500,000\$'},
      'q5_more500k': {'en': 'More than \$500,000', 'ar': 'أكثر من 500,000\$'},

      'q6_title': {'en': 'Rate your knowledge in the following areas', 'ar': 'قيّم معرفتك في المجالات التالية'},
      'q6_stock_market': {'en': 'Stock Market', 'ar': 'سوق الأسهم'},
      'q6_risk': {'en': 'Risk management', 'ar': 'إدارة المخاطر'},
      'q6_technical': {'en': 'Technical and fundamental analysis', 'ar': 'التحليل الفني والأساسي'},
      'q6_diversification': {'en': 'Portfolio diversification', 'ar': 'تنويع المحفظة'},

      'q7_title': {'en': 'Which asset classes have you invested in before?', 'ar': 'ما هي فئات الأصول التي استثمرت فيها من قبل؟'},
      'q7_stocks': {'en': 'Stocks', 'ar': 'أسهم'},
      'q7_etfs': {'en': 'ETFs', 'ar': 'صناديق المؤشرات'},
      'q7_crypto': {'en': 'Cryptocurrency', 'ar': 'عملات رقمية'},
      'q7_bonds': {'en': 'Bonds', 'ar': 'سندات'},
      'q7_real_estate': {'en': 'Real Estate', 'ar': 'عقارات'},
      'q7_none': {'en': 'None', 'ar': 'لا شيء'},

      'q8_title': {'en': 'How comfortable are you reading financial charts?', 'ar': 'ما مدى ارتياحك في قراءة الرسوم البيانية المالية؟'},
      'q8_not': {'en': 'Not comfortable', 'ar': 'غير مرتاح'},
      'q8_slightly': {'en': 'Slightly comfortable', 'ar': 'مرتاح قليلاً'},
      'q8_comfortable': {'en': 'Comfortable', 'ar': 'مرتاح'},
      'q8_very': {'en': 'Very comfortable', 'ar': 'مرتاح جداً'},

      'q9_title': {'en': 'What is your preferred investment time horizon?', 'ar': 'ما هو أفقك الزمني المفضل للاستثمار؟'},
      'q9_less1': {'en': 'Less than 1 year', 'ar': 'أقل من سنة'},
      'q9_1_3': {'en': '1-3 years', 'ar': '1-3 سنوات'},
      'q9_3_7': {'en': '3-7 years', 'ar': '3-7 سنوات'},
      'q9_more7': {'en': 'More than 7 years', 'ar': 'أكثر من 7 سنوات'},

      'q10_title': {'en': 'How would you rate your understanding of market risk?', 'ar': 'كيف تقيّم فهمك لمخاطر السوق؟'},
      'q10_poor': {'en': 'Poor', 'ar': 'ضعيف'},
      'q10_basic': {'en': 'Basic', 'ar': 'أساسي'},
      'q10_good': {'en': 'Good', 'ar': 'جيد'},
      'q10_excellent': {'en': 'Excellent', 'ar': 'ممتاز'},

      'q11_title': {'en': 'How would you describe your saving habits?', 'ar': 'كيف تصف عادات الادخار لديك؟'},
      'q11_dont': {'en': "I don't save regularly", 'ar': 'لا أدخر بانتظام'},
      'q11_sometimes': {'en': 'I save sometimes', 'ar': 'أدخر أحياناً'},
      'q11_regularly': {'en': 'I save regularly', 'ar': 'أدخر بانتظام'},
      'q11_fixed': {'en': 'I save a fixed percentage', 'ar': 'أدخر نسبة ثابتة'},

      'q12_title': {'en': 'Do you have emergency savings (3-6 months expenses)?', 'ar': 'هل لديك مدخرات طوارئ (3-6 أشهر من المصاريف)؟'},
      'q12_yes': {'en': 'Yes', 'ar': 'نعم'},
      'q12_no': {'en': 'No', 'ar': 'لا'},

      'q13_title': {'en': 'Have you started planning for retirement?', 'ar': 'هل بدأت التخطيط للتقاعد؟'},
      'q13_not_yet': {'en': 'Not yet', 'ar': 'ليس بعد'},
      'q13_pension': {'en': 'Yes, through pension', 'ar': 'نعم، من خلال المعاش'},
      'q13_save': {'en': 'Yes, I save regularly for it', 'ar': 'نعم، أدخر لذلك بانتظام'},

      'q14_title': {'en': 'What is your risk tolerance?', 'ar': 'ما هو مستوى تحملك للمخاطر؟'},
      'q14_very_low': {'en': 'Very Low', 'ar': 'منخفض جداً'},
      'q14_low': {'en': 'Low', 'ar': 'منخفض'},
      'q14_medium': {'en': 'Medium', 'ar': 'متوسط'},
      'q14_high': {'en': 'High', 'ar': 'عالي'},

      'q15_title': {'en': 'What is your main investment goal?', 'ar': 'ما هو هدفك الاستثماري الرئيسي؟'},
      'q15_protection': {'en': 'Capital Protection', 'ar': 'حماية رأس المال'},
      'q15_income': {'en': 'Extra Income', 'ar': 'دخل إضافي'},
      'q15_growth': {'en': 'Capital Growth', 'ar': 'نمو رأس المال'},
      'q15_wealth': {'en': 'Long-term Wealth', 'ar': 'الثروة طويلة الأجل'},
      'q15_speculation': {'en': 'Short-term Trading', 'ar': 'التداول قصير الأجل'},

      'q16_title': {'en': 'What is your goal with Quantrock?', 'ar': 'ما هو هدفك مع كوانتروك؟'},
      'q16_learn': {'en': 'Learn about investing', 'ar': 'تعلم الاستثمار'},
      'q16_challenge': {'en': 'Take trading challenges', 'ar': 'خوض تحديات التداول'},
      'q16_test': {'en': 'Test my strategies', 'ar': 'اختبار استراتيجياتي'},
      'q16_prepare': {'en': 'Prepare for real trading', 'ar': 'الاستعداد للتداول الحقيقي'},
      'q16_auto': {'en': 'Explore auto-trading', 'ar': 'استكشاف التداول الآلي'},

      'q17_title': {'en': 'Which industries interest you most?', 'ar': 'ما هي الصناعات التي تهمك أكثر؟'},
      'q17_tech': {'en': 'Technology', 'ar': 'التكنولوجيا'},
      'q17_ev': {'en': 'Electric Vehicles', 'ar': 'السيارات الكهربائية'},
      'q17_energy': {'en': 'Energy', 'ar': 'الطاقة'},
      'q17_healthcare': {'en': 'Healthcare', 'ar': 'الرعاية الصحية'},
      'q17_retail': {'en': 'Retail', 'ar': 'التجزئة'},
      'q17_crypto': {'en': 'Crypto/Blockchain', 'ar': 'العملات الرقمية/البلوكتشين'},
      'q17_finance': {'en': 'Finance', 'ar': 'المالية'},
      'q17_real_estate': {'en': 'Real Estate', 'ar': 'العقارات'},

      'q18_title': {'en': 'How ready do you feel to start investing?', 'ar': 'ما مدى استعدادك للبدء في الاستثمار؟'},
      'q18_need_help': {'en': 'I need guidance', 'ar': 'أحتاج إرشاد'},
      'q18_somewhat': {'en': 'Somewhat ready', 'ar': 'مستعد نوعاً ما'},
      'q18_prepared': {'en': 'Well prepared', 'ar': 'مستعد جيداً'},
      'q18_confident': {'en': 'Very confident', 'ar': 'واثق جداً'},

      'q19_title': {'en': 'How would you rate your understanding of passive income?', 'ar': 'كيف تقيّم فهمك للدخل السلبي؟'},
      'q19_dont': {'en': "I don't understand it", 'ar': 'لا أفهمه'},
      'q19_basic': {'en': 'Basic understanding', 'ar': 'فهم أساسي'},
      'q19_good': {'en': 'Good understanding', 'ar': 'فهم جيد'},
      'q19_excellent': {'en': 'Excellent understanding', 'ar': 'فهم ممتاز'},

      'q20_title': {'en': 'What demo portfolio size would you prefer to start with?', 'ar': 'ما حجم المحفظة التجريبية التي تفضل البدء بها؟'},
      'q20_1k': {'en': '\$1,000', 'ar': '1,000\$'},
      'q20_10k': {'en': '\$10,000', 'ar': '10,000\$'},
      'q20_25k': {'en': '\$25,000', 'ar': '25,000\$'},
      'q20_50k': {'en': '\$50,000', 'ar': '50,000\$'},
      'q20_100k': {'en': '\$100,000', 'ar': '100,000\$'},

      // Common
      'continue': {'en': 'Continue', 'ar': 'متابعة'},
      'back': {'en': 'Back', 'ar': 'رجوع'},
      'question': {'en': 'Question', 'ar': 'سؤال'},
      'of': {'en': 'of', 'ar': 'من'},
      'select_all': {'en': 'Select all that apply', 'ar': 'اختر كل ما ينطبق'},

      // Component badges and buttons
      'choose_one': {'en': 'Choose one', 'ar': 'اختر واحداً'},
      'tap_select': {'en': 'Tap to select', 'ar': 'انقر للاختيار'},
      'select_multiple': {'en': 'Select multiple', 'ar': 'اختر عدة خيارات'},
      'selected': {'en': 'selected', 'ar': 'مختار'},
      'helper_rating': {'en': '1 = No knowledge, 5 = Excellent', 'ar': '1 = لا معرفة، 5 = ممتاز'},
      'rate_all': {'en': 'Rate all areas to continue', 'ar': 'قيّم جميع المجالات للمتابعة'},
      'got_it': {'en': 'Got it', 'ar': 'فهمت'},

      // Knowledge areas for Q6
      'area_stock_market': {'en': 'Stock Market', 'ar': 'سوق الأسهم'},
      'area_risk_management': {'en': 'Risk management', 'ar': 'إدارة المخاطر'},
      'area_technical_analysis': {'en': 'Technical and fundamental analysis', 'ar': 'التحليل الفني والأساسي'},
      'area_portfolio_diversification': {'en': 'Portfolio diversification', 'ar': 'تنويع المحفظة'},
    };

    return translations[key]?[_selectedLanguage] ?? translations[key]?['en'] ?? key;
  }

  bool get _isArabic => _selectedLanguage == 'ar';

  late AnimationController _xpAnimationController;
  late AnimationController _pulseController;
  late AnimationController _particleController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _xpAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<QuestionnaireProvider>();
      _selectedAssets = List.from(provider.answers.assetClasses);
      _selectedIndustries = List.from(provider.answers.industriesInterested);

      if (widget.symbol != null && widget.name != null) {
        provider.setAnswer('selectedAsset', {
          'symbol': widget.symbol,
          'name': widget.name,
        });
      }
    });
  }

  @override
  void dispose() {
    _xpAnimationController.dispose();
    _pulseController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  int _calculateLevel(int xp) {
    return (xp / 200).floor() + 1;
  }

  String _getLevelTitle(int level) {
    if (level <= 2) return 'Novice Investor';
    if (level <= 4) return 'Rising Trader';
    if (level <= 6) return 'Market Explorer';
    if (level <= 8) return 'Portfolio Builder';
    return 'Investment Master';
  }

  void _awardXP(int xp) {
    final newXP = _totalXP + xp;
    final newLevel = _calculateLevel(newXP);

    setState(() {
      _showXPGain = true;
      _totalXP = newXP;

      if (newLevel > _currentLevel) {
        _currentLevel = newLevel;
        _showLevelUp = true;
      }
    });

    _xpAnimationController.forward(from: 0);
    _checkMilestones();

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showXPGain = false;
          _showLevelUp = false;
        });
      }
    });
  }

  void _checkMilestones() {
    if (_step == 9) {
      _showMilestonePopup('Background Complete!', 'Section 1 done!');
    } else if (_step == 14) {
      _showMilestonePopup('Literacy Assessed!', 'Section 2 complete!');
    } else if (_step == 17) {
      _showMilestonePopup('Goals Defined!', 'Section 3 conquered!');
    }
  }

  void _showMilestonePopup(String title, String subtitle) {
    setState(() {
      _milestoneTitle = title;
      _showMilestone = true;
    });
    _particleController.forward(from: 0);

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() => _showMilestone = false);
      }
    });
  }

  void _handleBack() {
    if (_step > 1) {
      setState(() {
        _goingForward = false;
        _step--;
      });
    }
  }

  void _handleNext() {
    if (_step < totalQuestions) {
      final xpReward = questionMetadata[_step]?.xpReward ?? 40;
      _awardXP(xpReward);

      setState(() {
        _goingForward = true;
        _step++;
      });
    } else {
      _awardXP(100);
      final provider = context.read<QuestionnaireProvider>();
      provider.setAnswer('completedAt', DateTime.now().toIso8601String());

      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(
            '/investor-results',
            arguments: {'language': _selectedLanguage},
          );
        }
      });
    }
  }

  void _handleSingleSelect(String key, String value) {
    context.read<QuestionnaireProvider>().setAnswer(key, value);
    Future.delayed(const Duration(milliseconds: 300), _handleNext);
  }

  void _toggleAsset(String value) {
    setState(() {
      if (_selectedAssets.contains(value)) {
        _selectedAssets.remove(value);
      } else {
        _selectedAssets.add(value);
      }
    });
    context.read<QuestionnaireProvider>().setAnswer('assetClasses', _selectedAssets);
  }

  void _toggleIndustry(String value) {
    setState(() {
      if (_selectedIndustries.contains(value)) {
        _selectedIndustries.remove(value);
      } else {
        _selectedIndustries.add(value);
      }
    });
    context.read<QuestionnaireProvider>().setAnswer('industriesInterested', _selectedIndustries);
  }

  String _getSectionProgress() {
    // Section 1: Questions 1-9 (9 questions)
    // Section 2: Questions 10-14 (5 questions)
    // Section 3: Questions 15-17 (3 questions)
    // Section 4: Questions 18-20 (3 questions)

    int sectionStart;
    int sectionEnd;
    String sectionName;

    if (_step <= 9) {
      sectionStart = 1;
      sectionEnd = 9;
      sectionName = 'Section 1';
    } else if (_step <= 14) {
      sectionStart = 10;
      sectionEnd = 14;
      sectionName = 'Section 2';
    } else if (_step <= 17) {
      sectionStart = 15;
      sectionEnd = 17;
      sectionName = 'Section 3';
    } else {
      sectionStart = 18;
      sectionEnd = 20;
      sectionName = 'Section 4';
    }

    final questionInSection = _step - sectionStart + 1;
    final totalInSection = sectionEnd - sectionStart + 1;

    return '$sectionName: $questionInSection/$totalInSection';
  }

  Widget _buildQuestion(QuestionnaireAnswers answers) {
    switch (_step) {
      // SECTION 1 — Personal Information & Investment Background
      case 1:
        return SingleChoiceCard(
          title: _t('q1_title'),
          options: [
            ChoiceOption(label: _t('q1_male'), value: 'male', icon: '👨'),
            ChoiceOption(label: _t('q1_female'), value: 'female', icon: '👩'),
          ],
          selectedValue: answers.gender,
          onSelect: (v) => _handleSingleSelect('gender', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 2:
        return SingleChoiceCard(
          title: _t('q2_title'),
          options: [
            ChoiceOption(label: _t('q2_under18'), value: 'under_18', icon: '👶'),
            ChoiceOption(label: _t('q2_18_24'), value: '18-24', icon: '🎓'),
            ChoiceOption(label: _t('q2_25_34'), value: '25-34', icon: '💼'),
            ChoiceOption(label: _t('q2_35_44'), value: '35-44', icon: '👔'),
            ChoiceOption(label: _t('q2_45_54'), value: '45-54', icon: '🏠'),
            ChoiceOption(label: _t('q2_55plus'), value: '55+', icon: '🌟'),
          ],
          selectedValue: answers.ageRange,
          onSelect: (v) => _handleSingleSelect('ageRange', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 3:
        return SingleChoiceCard(
          title: _t('q3_title'),
          options: [
            ChoiceOption(label: _t('q3_less1'), value: 'less_1_hour', icon: '⏰'),
            ChoiceOption(label: _t('q3_1_3'), value: '1-3_hours', icon: '📚'),
            ChoiceOption(label: _t('q3_3_7'), value: '3-7_hours', icon: '💪'),
            ChoiceOption(label: _t('q3_more7'), value: 'more_7_hours', icon: '🚀'),
          ],
          selectedValue: answers.timeCommitment,
          onSelect: (v) => _handleSingleSelect('timeCommitment', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 4:
        return SingleChoiceCard(
          title: _t('q4_title'),
          options: [
            ChoiceOption(label: _t('q4_yes'), value: 'yes', icon: '✅'),
            ChoiceOption(label: _t('q4_no'), value: 'no', icon: '❌'),
            ChoiceOption(label: _t('q4_used_to'), value: 'used_to', icon: '📉'),
          ],
          selectedValue: answers.hasActivePortfolio,
          onSelect: (v) => _handleSingleSelect('hasActivePortfolio', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 5:
        return SingleChoiceCard(
          title: _t('q5_title'),
          options: [
            ChoiceOption(label: _t('q5_less1k'), value: 'less_1k', icon: '💵'),
            ChoiceOption(label: _t('q5_1k_10k'), value: '1k-10k', icon: '💰'),
            ChoiceOption(label: _t('q5_10k_25k'), value: '10k-25k', icon: '💎'),
            ChoiceOption(label: _t('q5_25k_100k'), value: '25k-100k', icon: '🏆'),
            ChoiceOption(label: _t('q5_100k_500k'), value: '100k-500k', icon: '👑'),
            ChoiceOption(label: _t('q5_more500k'), value: 'more_500k', icon: '🚀'),
          ],
          selectedValue: answers.portfolioSize,
          onSelect: (v) => _handleSingleSelect('portfolioSize', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 6:
        return KnowledgeRatingCard(
          title: _t('q6_title'),
          areas: [_t('area_stock_market'), _t('area_risk_management'), _t('area_technical_analysis'), _t('area_portfolio_diversification')],
          ratings: _knowledgeRatings,
          onRatingChanged: (area, rating) {
            setState(() {
              _knowledgeRatings[area] = rating;
            });
            final provider = context.read<QuestionnaireProvider>();
            if (area == _t('area_stock_market')) provider.setAnswer('stocksKnowledge', rating);
            if (area == _t('area_risk_management')) provider.setAnswer('riskManagementKnowledge', rating);
            if (area == _t('area_technical_analysis')) provider.setAnswer('technicalAnalysisKnowledge', rating);
            if (area == _t('area_portfolio_diversification')) provider.setAnswer('portfolioDiversificationKnowledge', rating);
          },
          onContinue: _handleNext,
          isArabic: _isArabic,
          helperText: _t('helper_rating'),
          continueText: _t('continue'),
          rateAllText: _t('rate_all'),
          gotItText: _t('got_it'),
        );

      case 7:
        return MultiSelectChips(
          title: _t('q7_title'),
          options: [
            ChoiceOption(label: _t('q7_stocks'), value: 'stocks', icon: '📈'),
            ChoiceOption(label: _t('q7_etfs'), value: 'etfs', icon: '📊'),
            ChoiceOption(label: _t('q7_crypto'), value: 'crypto', icon: '₿'),
            ChoiceOption(label: _t('q7_bonds'), value: 'bonds', icon: '📜'),
            ChoiceOption(label: _t('q7_real_estate'), value: 'real_estate', icon: '🏠'),
            ChoiceOption(label: _t('q7_none'), value: 'none', icon: '🚫'),
          ],
          selectedValues: _selectedAssets,
          onToggle: _toggleAsset,
          onContinue: _handleNext,
          isArabic: _isArabic,
          badgeText: _t('select_multiple'),
          selectedText: _t('selected'),
          continueText: _t('continue'),
        );

      case 8:
        return SingleChoiceCard(
          title: _t('q8_title'),
          options: [
            ChoiceOption(label: _t('q8_not'), value: 'not_comfortable', icon: '😰'),
            ChoiceOption(label: _t('q8_slightly'), value: 'slightly_comfortable', icon: '🤔'),
            ChoiceOption(label: _t('q8_comfortable'), value: 'comfortable', icon: '😊'),
            ChoiceOption(label: _t('q8_very'), value: 'very_comfortable', icon: '😎'),
          ],
          selectedValue: answers.chartReadingComfort,
          onSelect: (v) => _handleSingleSelect('chartReadingComfort', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 9:
        return SingleChoiceCard(
          title: _t('q9_title'),
          options: [
            ChoiceOption(label: _t('q9_less1'), value: 'less_1_year', icon: '⏱️'),
            ChoiceOption(label: _t('q9_1_3'), value: '1-3_years', icon: '📅'),
            ChoiceOption(label: _t('q9_3_7'), value: '3-7_years', icon: '📆'),
            ChoiceOption(label: _t('q9_more7'), value: '7+_years', icon: '🗓️'),
          ],
          selectedValue: answers.investmentTimeHorizon,
          onSelect: (v) => _handleSingleSelect('investmentTimeHorizon', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      // SECTION 2 — Financial Literacy & Personal Readiness
      case 10:
        return SingleChoiceCard(
          title: _t('q10_title'),
          options: [
            ChoiceOption(label: _t('q10_poor'), value: 'poor', icon: '😟'),
            ChoiceOption(label: _t('q10_basic'), value: 'basic', icon: '🤔'),
            ChoiceOption(label: _t('q10_good'), value: 'good', icon: '😊'),
            ChoiceOption(label: _t('q10_excellent'), value: 'excellent', icon: '🌟'),
          ],
          selectedValue: answers.marketRiskUnderstanding,
          onSelect: (v) => _handleSingleSelect('marketRiskUnderstanding', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 11:
        return SingleChoiceCard(
          title: _t('q11_title'),
          options: [
            ChoiceOption(label: _t('q11_dont'), value: 'dont_save', icon: '🙈'),
            ChoiceOption(label: _t('q11_sometimes'), value: 'save_sometimes', icon: '🤷'),
            ChoiceOption(label: _t('q11_regularly'), value: 'save_regularly', icon: '💪'),
            ChoiceOption(label: _t('q11_fixed'), value: 'save_fixed', icon: '🎯'),
          ],
          selectedValue: answers.savingHabit,
          onSelect: (v) => _handleSingleSelect('savingHabit', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 12:
        return SingleChoiceGrid(
          title: _t('q12_title'),
          options: [
            ChoiceOption(label: _t('q12_yes'), value: 'yes', icon: '✅'),
            ChoiceOption(label: _t('q12_no'), value: 'no', icon: '❌'),
          ],
          selectedValue: answers.hasEmergencySavings,
          onSelect: (v) => _handleSingleSelect('hasEmergencySavings', v),
          isArabic: _isArabic,
          badgeText: _t('tap_select'),
        );

      case 13:
        return SingleChoiceCard(
          title: _t('q13_title'),
          options: [
            ChoiceOption(label: _t('q13_not_yet'), value: 'not_yet', icon: '🤔'),
            ChoiceOption(label: _t('q13_save'), value: 'save_regularly', icon: '🐷'),
            ChoiceOption(label: _t('q13_pension'), value: 'rely_pension', icon: '🏦'),
          ],
          selectedValue: answers.retirementPlanning,
          onSelect: (v) => _handleSingleSelect('retirementPlanning', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 14:
        return SingleChoiceGrid(
          title: _t('q14_title'),
          options: [
            ChoiceOption(label: _t('q14_very_low'), value: 'very_low', icon: '🛡️'),
            ChoiceOption(label: _t('q14_low'), value: 'low', icon: '🟢'),
            ChoiceOption(label: _t('q14_medium'), value: 'medium', icon: '🟡'),
            ChoiceOption(label: _t('q14_high'), value: 'high', icon: '🔴'),
          ],
          selectedValue: answers.riskTolerance,
          onSelect: (v) => _handleSingleSelect('riskTolerance', v),
          isArabic: _isArabic,
          badgeText: _t('tap_select'),
        );

      // SECTION 3 — Investment Objectives & User Motivation
      case 15:
        return SingleChoiceCard(
          title: _t('q15_title'),
          options: [
            ChoiceOption(label: _t('q15_growth'), value: 'growth', icon: '📈'),
            ChoiceOption(label: _t('q15_income'), value: 'income', icon: '💰'),
            ChoiceOption(label: _t('q15_protection'), value: 'protection', icon: '🛡️'),
            ChoiceOption(label: _t('q15_speculation'), value: 'speculation', icon: '⚡'),
            ChoiceOption(label: _t('q15_wealth'), value: 'wealth_building', icon: '🏰'),
          ],
          selectedValue: answers.investingGoal,
          onSelect: (v) => _handleSingleSelect('investingGoal', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 16:
        return SingleChoiceCard(
          title: _t('q16_title'),
          options: [
            ChoiceOption(label: _t('q16_challenge'), value: 'challenge', icon: '🏆'),
            ChoiceOption(label: _t('q16_prepare'), value: 'prepare_trading', icon: '📊'),
            ChoiceOption(label: _t('q16_test'), value: 'test_strategy', icon: '🎯'),
            ChoiceOption(label: _t('q16_learn'), value: 'learn', icon: '📚'),
            ChoiceOption(label: _t('q16_auto'), value: 'explore_auto', icon: '🤖'),
          ],
          selectedValue: answers.quantrockGoal,
          onSelect: (v) => _handleSingleSelect('quantrockGoal', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 17:
        return MultiSelectChips(
          title: _t('q17_title'),
          options: [
            ChoiceOption(label: _t('q17_tech'), value: 'tech', icon: '💻'),
            ChoiceOption(label: _t('q17_ev'), value: 'ev', icon: '🚗'),
            ChoiceOption(label: _t('q17_energy'), value: 'energy', icon: '⚡'),
            ChoiceOption(label: _t('q17_healthcare'), value: 'healthcare', icon: '💊'),
            ChoiceOption(label: _t('q17_retail'), value: 'retail', icon: '🛒'),
            ChoiceOption(label: _t('q17_crypto'), value: 'crypto', icon: '₿'),
            ChoiceOption(label: _t('q17_finance'), value: 'finance', icon: '🏦'),
            ChoiceOption(label: _t('q17_real_estate'), value: 'real_estate', icon: '🏠'),
          ],
          selectedValues: _selectedIndustries,
          onToggle: _toggleIndustry,
          onContinue: _handleNext,
          isArabic: _isArabic,
          badgeText: _t('select_multiple'),
          selectedText: _t('selected'),
          continueText: _t('continue'),
        );

      // SECTION 4 — Learning Readiness & Portfolio Preferences
      case 18:
        return SingleChoiceCard(
          title: _t('q18_title'),
          options: [
            ChoiceOption(label: _t('q18_need_help'), value: 'need_help', icon: '🆘'),
            ChoiceOption(label: _t('q18_somewhat'), value: 'somewhat_prepared', icon: '🤔'),
            ChoiceOption(label: _t('q18_prepared'), value: 'fully_prepared', icon: '💪'),
            ChoiceOption(label: _t('q18_confident'), value: 'very_confident', icon: '🌟'),
          ],
          selectedValue: answers.investmentReadinessText,
          onSelect: (v) => _handleSingleSelect('investmentReadinessText', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 19:
        return SingleChoiceCard(
          title: _t('q19_title'),
          options: [
            ChoiceOption(label: _t('q19_dont'), value: 'dont_understand', icon: '🤷'),
            ChoiceOption(label: _t('q19_basic'), value: 'basic', icon: '📖'),
            ChoiceOption(label: _t('q19_good'), value: 'good', icon: '🧠'),
            ChoiceOption(label: _t('q19_excellent'), value: 'excellent', icon: '🎯'),
          ],
          selectedValue: answers.passiveIncomeKnowledgeText,
          onSelect: (v) => _handleSingleSelect('passiveIncomeKnowledgeText', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      case 20:
        return SingleChoiceCard(
          title: _t('q20_title'),
          options: [
            ChoiceOption(label: _t('q20_1k'), value: '1k', icon: '💵'),
            ChoiceOption(label: _t('q20_10k'), value: '10k', icon: '💰'),
            ChoiceOption(label: _t('q20_25k'), value: '25k', icon: '💎'),
            ChoiceOption(label: _t('q20_50k'), value: '50k', icon: '🏆'),
            ChoiceOption(label: _t('q20_100k'), value: '100k', icon: '👑'),
          ],
          selectedValue: answers.preferredPortfolioSize,
          onSelect: (v) => _handleSingleSelect('preferredPortfolioSize', v),
          isArabic: _isArabic,
          badgeText: _t('choose_one'),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildIntroScreen() {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Top Badges
                Row(
                  children: [
                    Expanded(
                      child: _buildIntroBadgeWithInfo(
                        Icons.verified,
                        'OECD, MIT & CFA',
                        'Global Trusted Standards',
                        () => _showStandardsInfoPopup(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildIntroBadge(
                        Icons.star,
                        'SMART CLASSIFICATION',
                        'Beginner to Advanced',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // QIQT Badge with Language Selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                      ).createShader(bounds),
                      child: const Text(
                        'QIQT',
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Language Selector
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _selectedLanguage = 'en'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: _selectedLanguage == 'en'
                                    ? const Color(0xFF22C55E)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'EN',
                                style: TextStyle(
                                  color: _selectedLanguage == 'en'
                                      ? Colors.white
                                      : Colors.white.withValues(alpha: 0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(() => _selectedLanguage = 'ar'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: _selectedLanguage == 'ar'
                                    ? const Color(0xFF22C55E)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'AR',
                                style: TextStyle(
                                  color: _selectedLanguage == 'ar'
                                      ? Colors.white
                                      : Colors.white.withValues(alpha: 0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Subtitle (smaller, one line)
                Text(
                  _t('qiqt_full_title'),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9CA3AF),
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Hero Image
                _buildChartIllustration(),
                const SizedBox(height: 24),
                // Description
                _buildQIQTDescription(),
                const SizedBox(height: 24),
                // Privacy Notice
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.03),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: const Color(0xFF22C55E),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Your answers are anonymized, and we do not sell your data.',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Start Test Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showIntro = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _t('start_test').toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(_isArabic ? Icons.arrow_back : Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Footer
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'By proceeding, you agree with ',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: Color(0xFF22C55E),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      ', ',
                      style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
                    ),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Color(0xFF22C55E),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'QUANTROCK LTD',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntroBadge(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF22C55E),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF22C55E), size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroBadgeWithInfo(IconData icon, String title, String subtitle, VoidCallback onInfoTap) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF22C55E),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF22C55E), size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onInfoTap,
            child: const Icon(
              Icons.info_outline,
              color: Color(0xFF22C55E),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  void _showStandardsInfoPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'OECD, MIT & CFA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'The test is based on globally recognized standards:',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _buildStandardItem(
                '🔹',
                'OECD',
                'The Organization for Economic Co-operation and Development\nThe international standard for measuring financial literacy and financial behavior.',
              ),
              const SizedBox(height: 12),
              _buildStandardItem(
                '🔹',
                'MIT Learning Readiness Model',
                'Used to measure educational readiness and motivation.',
              ),
              const SizedBox(height: 12),
              _buildStandardItem(
                '🔹',
                'CFA Investment Knowledge Framework',
                'Used to measure the level of financial and investment knowledge and experience.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Got it',
              style: TextStyle(color: Color(0xFF22C55E)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardItem(String emoji, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showQIQTInfoPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Quantrock Investor Qualification Test (QIQT)',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QIQT is an intelligent qualification test built on OECD, MIT, and CFA standards, designed to measure your investment experience, financial literacy, motivations, and readiness to learn.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'QIQT helps you assess your financial knowledge, investment background, and determine your ideal path inside Quantrock whether in challenges, daily lessons, or selecting the appropriate demo portfolio size.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Got it',
              style: TextStyle(color: Color(0xFF22C55E)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartIllustration() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final imageHeight = screenWidth < 400 ? 180.0 : (screenWidth < 600 ? 220.0 : 280.0);

        return Container(
          height: imageHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background green bull vs red bear stock market image
                Image.network(
                  'https://cdn.pixabay.com/photo/2016/11/27/21/42/stock-1863880_1280.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback gradient if network image fails
                    return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F172A)],
                        ),
                      ),
                    );
                  },
                ),
                // Dark overlay for better contrast
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.3),
                        Colors.black.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
                // Main hero image on top
                Image.asset(
                  'assets/images/qiqt_hero.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to mascot image if hero image fails
                    return Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.asset(
                            'assets/images/mascot.png',
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, err, stack) {
                              return Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQIQTDescription() {
    return Directionality(
      textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main intro text
            Text(
              _t('intro_text1'),
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 15,
                height: 1.5,
              ),
              textAlign: _isArabic ? TextAlign.right : TextAlign.left,
            ),
            const SizedBox(height: 12),
            Text(
              _t('intro_text2'),
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 15,
                height: 1.5,
              ),
              textAlign: _isArabic ? TextAlign.right : TextAlign.left,
            ),
            const SizedBox(height: 20),
            // Purpose section header
            Row(
              children: [
                const Text(
                  '🎯',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _t('purpose_title'),
                    style: const TextStyle(
                      color: Color(0xFF22C55E),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _t('purpose_subtitle'),
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 15,
              ),
              textAlign: _isArabic ? TextAlign.right : TextAlign.left,
            ),
            const SizedBox(height: 8),
            // Classification levels
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF22C55E).withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _t('beginner'),
                    style: const TextStyle(
                      color: Color(0xFF22C55E),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    '/',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                  ),
                  Text(
                    _t('intermediate'),
                    style: const TextStyle(
                      color: Color(0xFF3B82F6),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    '/',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                  ),
                  Text(
                    _t('advanced'),
                    style: const TextStyle(
                      color: Color(0xFFA855F7),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _t('identifies_title'),
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              textAlign: _isArabic ? TextAlign.right : TextAlign.left,
            ),
            const SizedBox(height: 12),
            // Identification items
            _buildIdentificationItem(_t('item_objectives'), Icons.flag_rounded),
            _buildIdentificationItem(_t('item_experience'), Icons.trending_up_rounded),
            _buildIdentificationItem(_t('item_literacy'), Icons.school_rounded),
            _buildIdentificationItem(_t('item_readiness'), Icons.lightbulb_rounded),
            _buildIdentificationItem(_t('item_challenge'), Icons.emoji_events_rounded),
            _buildIdentificationItem(_t('item_portfolio'), Icons.account_balance_wallet_rounded),
            _buildIdentificationItem(_t('item_path'), Icons.route_rounded),
            _buildIdentificationItem(_t('item_motivation'), Icons.rocket_launch_rounded),
          ],
        ),
      ),
    );
  }

  Widget _buildIdentificationItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF22C55E),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showIntro) {
      return _buildIntroScreen();
    }

    final xpForCurrentLevel = (_currentLevel - 1) * 200;
    final xpForNextLevel = _currentLevel * 200;
    final xpProgress = (_totalXP - xpForCurrentLevel) / (xpForNextLevel - xpForCurrentLevel);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background particles
            ...List.generate(20, (index) => _buildBackgroundParticle(index)),

            // Main content
            Consumer<QuestionnaireProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    // Game Header with XP and Level
                    _buildGameHeader(xpProgress),

                    // Progress Quest Bar
                    _buildQuestProgress(),

                    // Question Content
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: Offset(_goingForward ? 1.0 : -1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child: KeyedSubtree(
                          key: ValueKey(_step),
                          child: _buildQuestion(provider.answers),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // Level Up Popup
            if (_showLevelUp) _buildLevelUpPopup(),

            // Milestone Popup
            if (_showMilestone) _buildMilestonePopup(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundParticle(int index) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 4;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final top = random.nextDouble() * MediaQuery.of(context).size.height;
    final opacity = 0.1 + random.nextDouble() * 0.3;

    return Positioned(
      left: left,
      top: top,
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          return Opacity(
            opacity: opacity * (0.5 + _pulseAnimation.value * 0.5),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.5),
                    blurRadius: size * 2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGameHeader(double xpProgress) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                // Back button
                if (_step > 1)
                  GestureDetector(
                    onTap: _handleBack,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 40),

                const SizedBox(width: 12),

                // Level Badge
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _showLevelUp ? _pulseAnimation.value : 1.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.amber, Colors.orange.shade700],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withValues(alpha: 0.4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'LVL $_currentLevel',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(width: 12),

                // XP Bar
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getLevelTitle(_currentLevel),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 8,
                            width: (MediaQuery.of(context).size.width - 200) *
                                xpProgress.clamp(0.0, 1.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.amber, Colors.orange],
                              ),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amber.withValues(alpha: 0.5),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _getSectionProgress(),
                        style: TextStyle(
                          color: Colors.amber.withValues(alpha: 0.8),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestProgress() {
    final progress = _step / totalQuestions;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.map,
                color: Colors.cyan,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                'QIQT Qualification Test',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () => _showQIQTInfoPopup(),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.cyan.withValues(alpha: 0.7),
                  size: 14,
                ),
              ),
              const Spacer(),
              Text(
                '$_step/$totalQuestions',
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                height: 12,
                width: (MediaQuery.of(context).size.width - 48) * progress,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.cyan, Colors.blue, Colors.purple],
                  ),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyan.withValues(alpha: 0.5),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              // Milestone markers
              ...List.generate(4, (index) {
                final position = (index + 1) * 0.2;
                final isReached = progress >= position;
                return Positioned(
                  left: (MediaQuery.of(context).size.width - 48) * position - 8,
                  top: -2,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isReached ? Colors.amber : Colors.grey.shade700,
                      border: Border.all(
                        color: isReached ? Colors.amber : Colors.grey,
                        width: 2,
                      ),
                      boxShadow: isReached
                          ? [
                              BoxShadow(
                                color: Colors.amber.withValues(alpha: 0.5),
                                blurRadius: 6,
                              ),
                            ]
                          : null,
                    ),
                    child: isReached
                        ? const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.white,
                          )
                        : null,
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelUpPopup() {
    return AnimatedBuilder(
      animation: _xpAnimationController,
      builder: (context, child) {
        final progress = Curves.elasticOut.transform(
          (_xpAnimationController.value * 2).clamp(0.0, 1.0),
        );
        return Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.5 * progress),
            child: Center(
              child: Transform.scale(
                scale: progress,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.amber.shade700,
                        Colors.orange.shade800,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withValues(alpha: 0.6),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.emoji_events,
                        color: Colors.white,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'LEVEL UP!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Level $_currentLevel',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getLevelTitle(_currentLevel),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMilestonePopup() {
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = Curves.easeOutBack.transform(
          (_particleController.value * 2).clamp(0.0, 1.0),
        );
        final fadeOut = _particleController.value > 0.7
            ? (1 - (_particleController.value - 0.7) / 0.3)
            : 1.0;

        return Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 0,
          right: 0,
          child: Center(
            child: Opacity(
              opacity: fadeOut,
              child: Transform.scale(
                scale: progress,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withValues(alpha: 0.6),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.celebration,
                        color: Colors.amber,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _milestoneTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

