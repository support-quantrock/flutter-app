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
      'qiqt_title': {'en': 'QIQT', 'ar': 'QIQT', 'fr': 'QIQT', 'es': 'QIQT', 'zh': 'QIQT', 'hi': 'QIQT'},
      'qiqt_full_title': {'en': 'Quantrock Investor Qualification Test', 'ar': 'اختبار تأهيل المستثمر من كوانتروك', 'fr': 'Test de Qualification des Investisseurs Quantrock', 'es': 'Prueba de Calificación de Inversores Quantrock', 'zh': 'Quantrock投资者资格测试', 'hi': 'کوانٹراک سرمایہ کار اہلیت ٹیسٹ'},
      'qiqt_subtitle': {'en': 'Quantrock Investor Qualification Test (QIQT)', 'ar': 'اختبار تأهيل المستثمر من كوانتروك (QIQT)', 'fr': 'Test de Qualification des Investisseurs Quantrock (QIQT)', 'es': 'Prueba de Calificación de Inversores Quantrock (QIQT)', 'zh': 'Quantrock投资者资格测试 (QIQT)', 'hi': 'کوانٹراک سرمایہ کار اہلیت ٹیسٹ (QIQT)'},
      'intro_text1': {'en': 'It is an intelligent qualification test based on the standards of the OECD, MIT, and the CFA Institute. It is designed to measure your investment expertise, financial literacy, and to accurately classify the user into one of the following levels:', 'ar': 'QIQT هو اختبار تأهيل ذكي مبني على معايير OECD وMIT وCFA، مصمم لقياس خبرتك الاستثمارية ومعرفتك المالية ودوافعك واستعدادك للتعلم.', 'fr': 'QIQT est un test de qualification intelligent basé sur les normes OCDE, MIT et CFA, conçu pour mesurer votre expérience en investissement, vos connaissances financières, vos motivations et votre volonté d\'apprendre.', 'es': 'QIQT es una prueba de calificación inteligente basada en los estándares de OCDE, MIT y CFA, diseñada para medir su experiencia en inversión, conocimientos financieros, motivaciones y disposición para aprender.', 'zh': 'QIQT是基于OECD、MIT和CFA标准构建的智能资格测试，旨在衡量您的投资经验、金融素养、动机和学习意愿。', 'hi': 'QIQT ایک ذہین اہلیت ٹیسٹ ہے جو OECD، MIT اور CFA معیارات پر مبنی ہے، آپ کے سرمایہ کاری کے تجربے، مالی خواندگی، محرکات اور سیکھنے کی تیاری کی پیمائش کے لیے ڈیزائن کیا گیا ہے۔'},
      'intro_text2': {'en': 'QIQT helps you assess your financial knowledge, investment background, and determine your ideal path inside Quantrock whether in challenges, daily lessons, or selecting the appropriate demo portfolio size.', 'ar': 'يساعدك QIQT في تقييم معرفتك المالية وخلفيتك الاستثمارية وتحديد مسارك المثالي داخل كوانتروك سواء في التحديات أو الدروس اليومية أو اختيار حجم المحفظة التجريبية المناسب.', 'fr': 'QIQT vous aide à évaluer vos connaissances financières, votre expérience en investissement et à déterminer votre parcours idéal dans Quantrock, que ce soit dans les défis, les leçons quotidiennes ou le choix de la taille du portefeuille de démonstration appropriée.', 'es': 'QIQT le ayuda a evaluar sus conocimientos financieros, antecedentes de inversión y determinar su camino ideal dentro de Quantrock, ya sea en desafíos, lecciones diarias o seleccionando el tamaño de cartera de demostración apropiado.', 'zh': 'QIQT帮助您评估您的金融知识、投资背景，并确定您在Quantrock内的理想路径，无论是挑战、每日课程还是选择合适的模拟投资组合规模。', 'hi': 'QIQT آپ کی مالی معلومات، سرمایہ کاری کے پس منظر کا جائزہ لینے اور Quantrock کے اندر آپ کے مثالی راستے کا تعین کرنے میں مدد کرتا ہے چاہے چیلنجز، روزانہ سبق، یا مناسب ڈیمو پورٹ فولیو سائز کا انتخاب ہو۔'},
      'purpose_title': {'en': 'What is the purpose of QIQT?', 'ar': 'ما هو الغرض من QIQT؟', 'fr': 'Quel est le but de QIQT?', 'es': '¿Cuál es el propósito de QIQT?', 'zh': 'QIQT的目的是什么？', 'hi': 'QIQT کا مقصد کیا ہے؟'},
      'purpose_subtitle': {'en': 'The test aims to accurately classify the user into one of the following levels:', 'ar': 'يهدف الاختبار إلى تصنيف المستخدم بدقة إلى أحد المستويات التالية:', 'fr': 'Le test vise à classer précisément l\'utilisateur dans l\'un des niveaux suivants:', 'es': 'La prueba tiene como objetivo clasificar con precisión al usuario en uno de los siguientes niveles:', 'zh': '该测试旨在准确地将用户分类为以下级别之一：', 'hi': 'ٹیسٹ کا مقصد صارف کو درج ذیل سطحوں میں سے کسی ایک میں درست طریقے سے درجہ بندی کرنا ہے:'},
      'beginner': {'en': 'Beginner', 'ar': 'مبتدئ', 'fr': 'Débutant', 'es': 'Principiante', 'zh': '初学者', 'hi': 'ابتدائی'},
      'intermediate': {'en': 'Intermediate', 'ar': 'متوسط', 'fr': 'Intermédiaire', 'es': 'Intermedio', 'zh': '中级', 'hi': 'درمیانی'},
      'advanced': {'en': 'Advanced', 'ar': 'متقدم', 'fr': 'Avancé', 'es': 'Avanzado', 'zh': '高级', 'hi': 'ایڈوانسڈ'},
      'identifies_title': {'en': 'It works on identifying:', 'ar': 'يعمل على تحديد:', 'fr': 'Il travaille à identifier:', 'es': 'Trabaja en identificar:', 'zh': '它致力于识别：', 'hi': 'یہ شناخت کرنے پر کام کرتا ہے:'},
      'item_objectives': {'en': 'Investment objectives', 'ar': 'أهداف الاستثمار', 'fr': 'Objectifs d\'investissement', 'es': 'Objetivos de inversión', 'zh': '投资目标', 'hi': 'سرمایہ کاری کے مقاصد'},
      'item_experience': {'en': 'Investment experience', 'ar': 'الخبرة الاستثمارية', 'fr': 'Expérience en investissement', 'es': 'Experiencia en inversión', 'zh': '投资经验', 'hi': 'سرمایہ کاری کا تجربہ'},
      'item_literacy': {'en': 'Financial knowledge and literacy', 'ar': 'المعرفة والثقافة المالية', 'fr': 'Connaissances et culture financières', 'es': 'Conocimiento y cultura financiera', 'zh': '金融知识和素养', 'hi': 'مالی علم اور خواندگی'},
      'item_readiness': {'en': 'Level of readiness and willingness to learn', 'ar': 'مستوى الاستعداد والرغبة في التعلم', 'fr': 'Niveau de préparation et volonté d\'apprendre', 'es': 'Nivel de preparación y disposición para aprender', 'zh': '学习准备和意愿程度', 'hi': 'تیاری کی سطح اور سیکھنے کی خواہش'},
      'item_challenge': {'en': 'The appropriate challenge level', 'ar': 'مستوى التحدي المناسب', 'fr': 'Le niveau de défi approprié', 'es': 'El nivel de desafío apropiado', 'zh': '适当的挑战级别', 'hi': 'مناسب چیلنج کی سطح'},
      'item_portfolio': {'en': 'The appropriate simulated portfolio size', 'ar': 'حجم المحفظة التجريبية المناسب', 'fr': 'La taille de portefeuille simulé appropriée', 'es': 'El tamaño de cartera simulada apropiado', 'zh': '适当的模拟投资组合规模', 'hi': 'مناسب تجرباتی پورٹ فولیو سائز'},
      'item_path': {'en': 'The best learning path', 'ar': 'أفضل مسار للتعلم', 'fr': 'Le meilleur parcours d\'apprentissage', 'es': 'El mejor camino de aprendizaje', 'zh': '最佳学习路径', 'hi': 'بہترین سیکھنے کا راستہ'},
      'item_motivation': {'en': 'The motivation for using the Quantrock app', 'ar': 'الدافع لاستخدام تطبيق كوانتروك', 'fr': 'La motivation pour utiliser l\'application Quantrock', 'es': 'La motivación para usar la aplicación Quantrock', 'zh': '使用Quantrock应用的动机', 'hi': 'Quantrock ایپ استعمال کرنے کی ترغیب'},
      'start_test': {'en': 'Start The Test', 'ar': 'ابدأ الاختبار', 'fr': 'Commencer le Test', 'es': 'Iniciar la Prueba', 'zh': '开始测试', 'hi': 'ٹیسٹ شروع کریں'},
      'questions_count': {'en': '20 Questions', 'ar': '20 سؤال', 'fr': '20 Questions', 'es': '20 Preguntas', 'zh': '20个问题', 'hi': '20 سوالات'},
      'time_estimate': {'en': '~5 minutes', 'ar': '~5 دقائق', 'fr': '~5 minutes', 'es': '~5 minutos', 'zh': '~5分钟', 'hi': '~5 منٹ'},

      // Questions
      'q1_title': {'en': 'What is your gender?', 'ar': 'ما هو جنسك؟', 'fr': 'Quel est votre genre?', 'es': '¿Cuál es su género?', 'zh': '您的性别是什么？', 'hi': 'آپ کی جنس کیا ہے؟'},
      'q1_male': {'en': 'Male', 'ar': 'ذكر', 'fr': 'Homme', 'es': 'Masculino', 'zh': '男', 'hi': 'مرد'},
      'q1_female': {'en': 'Female', 'ar': 'أنثى', 'fr': 'Femme', 'es': 'Femenino', 'zh': '女', 'hi': 'عورت'},
      'q1_other': {'en': 'Prefer not to say', 'ar': 'أفضل عدم الإجابة', 'fr': 'Préfère ne pas dire', 'es': 'Prefiero no decir', 'zh': '不愿透露', 'hi': 'بتانا پسند نہیں'},

      'q2_title': {'en': 'What is your age group?', 'ar': 'ما هي فئتك العمرية؟', 'fr': 'Quel est votre groupe d\'âge?', 'es': '¿Cuál es su grupo de edad?', 'zh': '您的年龄段是？', 'hi': 'آپ کی عمر کا گروپ کیا ہے؟'},
      'q2_under18': {'en': 'Under 18', 'ar': 'أقل من 18', 'fr': 'Moins de 18 ans', 'es': 'Menor de 18', 'zh': '18岁以下', 'hi': '18 سے کم'},
      'q2_18_24': {'en': '18-24', 'ar': '18-24', 'fr': '18-24', 'es': '18-24', 'zh': '18-24', 'hi': '18-24'},
      'q2_25_34': {'en': '25-34', 'ar': '25-34', 'fr': '25-34', 'es': '25-34', 'zh': '25-34', 'hi': '25-34'},
      'q2_35_44': {'en': '35-44', 'ar': '35-44', 'fr': '35-44', 'es': '35-44', 'zh': '35-44', 'hi': '35-44'},
      'q2_45_54': {'en': '45-54', 'ar': '45-54', 'fr': '45-54', 'es': '45-54', 'zh': '45-54', 'hi': '45-54'},
      'q2_55plus': {'en': '55+', 'ar': '+55', 'fr': '55+', 'es': '55+', 'zh': '55+', 'hi': '55+'},

      'q3_title': {'en': 'How much time can you commit to learning each week?', 'ar': 'كم من الوقت يمكنك تخصيصه للتعلم كل أسبوع؟', 'fr': 'Combien de temps pouvez-vous consacrer à l\'apprentissage chaque semaine?', 'es': '¿Cuánto tiempo puede dedicar al aprendizaje cada semana?', 'zh': '您每周可以投入多少时间学习？', 'hi': 'آپ ہر ہفتے سیکھنے کے لیے کتنا وقت دے سکتے ہیں؟'},
      'q3_less1': {'en': 'Less than 1 hour', 'ar': 'أقل من ساعة', 'fr': 'Moins d\'1 heure', 'es': 'Menos de 1 hora', 'zh': '少于1小时', 'hi': '1 گھنٹے سے کم'},
      'q3_1_3': {'en': '1–3 hours', 'ar': '1-3 ساعات', 'fr': '1-3 heures', 'es': '1-3 horas', 'zh': '1-3小时', 'hi': '1-3 گھنٹے'},
      'q3_3_7': {'en': '3–7 hours', 'ar': '3-7 ساعات', 'fr': '3-7 heures', 'es': '3-7 horas', 'zh': '3-7小时', 'hi': '3-7 گھنٹے'},
      'q3_more7': {'en': 'More than 7 hours', 'ar': 'أكثر من 7 ساعات', 'fr': 'Plus de 7 heures', 'es': 'Más de 7 horas', 'zh': '超过7小时', 'hi': '7 گھنٹے سے زیادہ'},

      'q4_title': {'en': 'Do you currently have an active investment portfolio?', 'ar': 'هل لديك حالياً محفظة استثمارية نشطة؟', 'fr': 'Avez-vous actuellement un portefeuille d\'investissement actif?', 'es': '¿Tiene actualmente una cartera de inversión activa?', 'zh': '您目前有活跃的投资组合吗？', 'hi': 'کیا آپ کے پاس فی الحال ایک فعال سرمایہ کاری پورٹ فولیو ہے؟'},
      'q4_yes': {'en': 'Yes, actively managing', 'ar': 'نعم، أديرها بنشاط', 'fr': 'Oui, gestion active', 'es': 'Sí, gestión activa', 'zh': '是的，正在积极管理', 'hi': 'ہاں، فعال طور پر منظم کر رہا ہوں'},
      'q4_no': {'en': 'No portfolio', 'ar': 'لا يوجد محفظة', 'fr': 'Pas de portefeuille', 'es': 'Sin cartera', 'zh': '没有投资组合', 'hi': 'کوئی پورٹ فولیو نہیں'},
      'q4_used_to': {'en': 'I used to have one', 'ar': 'كان لدي واحدة سابقاً', 'fr': 'J\'en avais un', 'es': 'Solía tener uno', 'zh': '我以前有过', 'hi': 'میرے پاس پہلے تھا'},

      'q5_title': {'en': 'What is the approximate size of your current, latest or future portfolio?', 'ar': 'ما هو الحجم التقريبي لمحفظتك الحالية أو الأخيرة أو المستقبلية؟', 'fr': 'Quelle est la taille approximative de votre portefeuille actuel, récent ou futur?', 'es': '¿Cuál es el tamaño aproximado de su cartera actual, reciente o futura?', 'zh': '您当前、最近或未来投资组合的大致规模是多少？', 'hi': 'آپ کے موجودہ، حالیہ یا مستقبل کے پورٹ فولیو کا تقریباً سائز کیا ہے؟'},
      'q5_less1k': {'en': 'Less than \$0.00 - \$1,000', 'ar': 'أقل من 0.00\$ - 1,000\$', 'fr': 'Moins de 0,00\$ - 1 000\$', 'es': 'Menos de \$0.00 - \$1,000', 'zh': '少于\$0.00 - \$1,000', 'hi': '\$0.00 - \$1,000 سے کم'},
      'q5_1k_10k': {'en': '\$1,000–\$10,000', 'ar': '1,000\$–10,000\$', 'fr': '1 000\$–10 000\$', 'es': '\$1,000–\$10,000', 'zh': '\$1,000–\$10,000', 'hi': '\$1,000–\$10,000'},
      'q5_10k_25k': {'en': '\$10,000–\$25,000', 'ar': '10,000\$–25,000\$', 'fr': '10 000\$–25 000\$', 'es': '\$10,000–\$25,000', 'zh': '\$10,000–\$25,000', 'hi': '\$10,000–\$25,000'},
      'q5_25k_100k': {'en': '\$25,000–\$100,000', 'ar': '25,000\$–100,000\$', 'fr': '25 000\$–100 000\$', 'es': '\$25,000–\$100,000', 'zh': '\$25,000–\$100,000', 'hi': '\$25,000–\$100,000'},
      'q5_100k_500k': {'en': '\$100,000–\$500,000', 'ar': '100,000\$–500,000\$', 'fr': '100 000\$–500 000\$', 'es': '\$100,000–\$500,000', 'zh': '\$100,000–\$500,000', 'hi': '\$100,000–\$500,000'},
      'q5_more500k': {'en': 'More than \$500,000', 'ar': 'أكثر من 500,000\$', 'fr': 'Plus de 500 000\$', 'es': 'Más de \$500,000', 'zh': '超过\$500,000', 'hi': '\$500,000 سے زیادہ'},

      'q6_title': {'en': 'Rate your knowledge in the following areas', 'ar': 'قيّم معرفتك في المجالات التالية', 'fr': 'Évaluez vos connaissances dans les domaines suivants', 'es': 'Califique su conocimiento en las siguientes áreas', 'zh': '评估您在以下领域的知识', 'hi': 'درج ذیل شعبوں میں اپنے علم کی درجہ بندی کریں'},
      'q6_stock_market': {'en': 'Stock Market', 'ar': 'سوق الأسهم', 'fr': 'Marché boursier', 'es': 'Mercado de valores', 'zh': '股票市场', 'hi': 'سٹاک مارکیٹ'},
      'q6_risk': {'en': 'Risk management', 'ar': 'إدارة المخاطر', 'fr': 'Gestion des risques', 'es': 'Gestión de riesgos', 'zh': '风险管理', 'hi': 'رسک مینجمنٹ'},
      'q6_technical': {'en': 'Technical and fundamental analysis', 'ar': 'التحليل الفني والأساسي', 'fr': 'Analyse technique et fondamentale', 'es': 'Análisis técnico y fundamental', 'zh': '技术和基本面分析', 'hi': 'تکنیکی اور بنیادی تجزیہ'},
      'q6_diversification': {'en': 'Portfolio diversification', 'ar': 'تنويع المحفظة', 'fr': 'Diversification du portefeuille', 'es': 'Diversificación de cartera', 'zh': '投资组合多元化', 'hi': 'پورٹ فولیو ڈائیورسیفیکیشن'},

      'q7_title': {'en': 'Which asset classes have you invested in before?', 'ar': 'ما هي فئات الأصول التي استثمرت فيها من قبل؟', 'fr': 'Dans quelles classes d\'actifs avez-vous investi auparavant?', 'es': '¿En qué clases de activos ha invertido antes?', 'zh': '您以前投资过哪些资产类别？', 'hi': 'آپ نے پہلے کن اثاثہ جات کی کلاسوں میں سرمایہ کاری کی ہے؟'},
      'q7_stocks': {'en': 'Stocks', 'ar': 'أسهم', 'fr': 'Actions', 'es': 'Acciones', 'zh': '股票', 'hi': 'سٹاکس'},
      'q7_etfs': {'en': 'ETFs', 'ar': 'صناديق المؤشرات', 'fr': 'ETFs', 'es': 'ETFs', 'zh': 'ETFs', 'hi': 'ETFs'},
      'q7_crypto': {'en': 'Cryptocurrency', 'ar': 'عملات رقمية', 'fr': 'Cryptomonnaie', 'es': 'Criptomoneda', 'zh': '加密货币', 'hi': 'کرپٹو کرنسی'},
      'q7_bonds': {'en': 'Bonds', 'ar': 'سندات', 'fr': 'Obligations', 'es': 'Bonos', 'zh': '债券', 'hi': 'بانڈز'},
      'q7_real_estate': {'en': 'Real Estate', 'ar': 'عقارات', 'fr': 'Immobilier', 'es': 'Bienes raíces', 'zh': '房地产', 'hi': 'رئیل اسٹیٹ'},
      'q7_commodities': {'en': 'Commodities', 'ar': 'سلع', 'fr': 'Matières premières', 'es': 'Materias primas', 'zh': '大宗商品', 'hi': 'کموڈٹیز'},
      'q7_metals': {'en': 'Metals', 'ar': 'معادن', 'fr': 'Métaux', 'es': 'Metales', 'zh': '金属', 'hi': 'دھاتیں'},
      'q7_forex': {'en': 'Forex', 'ar': 'فوركس', 'fr': 'Forex', 'es': 'Forex', 'zh': '外汇', 'hi': 'فاریکس'},
      'q7_none': {'en': 'None', 'ar': 'لا شيء', 'fr': 'Aucun', 'es': 'Ninguno', 'zh': '无', 'hi': 'کوئی نہیں'},

      'q8_title': {'en': 'How comfortable are you reading financial charts?', 'ar': 'ما مدى ارتياحك في قراءة الرسوم البيانية المالية؟', 'fr': 'À quel point êtes-vous à l\'aise pour lire des graphiques financiers?', 'es': '¿Qué tan cómodo se siente leyendo gráficos financieros?', 'zh': '您阅读金融图表的舒适程度如何？', 'hi': 'مالیاتی چارٹس پڑھنے میں آپ کتنے آرام دہ ہیں؟'},
      'q8_not': {'en': 'Not comfortable', 'ar': 'غير مرتاح', 'fr': 'Pas à l\'aise', 'es': 'No cómodo', 'zh': '不舒适', 'hi': 'آرام دہ نہیں'},
      'q8_slightly': {'en': 'Slightly comfortable', 'ar': 'مرتاح قليلاً', 'fr': 'Légèrement à l\'aise', 'es': 'Ligeramente cómodo', 'zh': '稍微舒适', 'hi': 'تھوڑا آرام دہ'},
      'q8_comfortable': {'en': 'Comfortable', 'ar': 'مرتاح', 'fr': 'À l\'aise', 'es': 'Cómodo', 'zh': '舒适', 'hi': 'آرام دہ'},
      'q8_very': {'en': 'Very comfortable', 'ar': 'مرتاح جداً', 'fr': 'Très à l\'aise', 'es': 'Muy cómodo', 'zh': '非常舒适', 'hi': 'بہت آرام دہ'},

      'q9_title': {'en': 'What is your preferred investment time horizon?', 'ar': 'ما هو أفقك الزمني المفضل للاستثمار؟', 'fr': 'Quel est votre horizon d\'investissement préféré?', 'es': '¿Cuál es su horizonte de inversión preferido?', 'zh': '您首选的投资时间范围是多少？', 'hi': 'آپ کا ترجیحی سرمایہ کاری کا وقت کیا ہے؟'},
      'q9_less1': {'en': 'Less than 1 year', 'ar': 'أقل من سنة', 'fr': 'Moins d\'1 an', 'es': 'Menos de 1 año', 'zh': '少于1年', 'hi': '1 سال سے کم'},
      'q9_1_3': {'en': '1-3 years', 'ar': '1-3 سنوات', 'fr': '1-3 ans', 'es': '1-3 años', 'zh': '1-3年', 'hi': '1-3 سال'},
      'q9_3_7': {'en': '3-7 years', 'ar': '3-7 سنوات', 'fr': '3-7 ans', 'es': '3-7 años', 'zh': '3-7年', 'hi': '3-7 سال'},
      'q9_more7': {'en': 'More than 7 years', 'ar': 'أكثر من 7 سنوات', 'fr': 'Plus de 7 ans', 'es': 'Más de 7 años', 'zh': '超过7年', 'hi': '7 سال سے زیادہ'},

      'q10_title': {'en': 'How would you rate your understanding of market risk?', 'ar': 'كيف تقيّم فهمك لمخاطر السوق؟', 'fr': 'Comment évalueriez-vous votre compréhension du risque de marché?', 'es': '¿Cómo calificaría su comprensión del riesgo de mercado?', 'zh': '您如何评价您对市场风险的理解？', 'hi': 'آپ مارکیٹ رسک کے بارے میں اپنی سمجھ کی درجہ بندی کیسے کریں گے؟'},
      'q10_poor': {'en': 'Poor', 'ar': 'ضعيف', 'fr': 'Faible', 'es': 'Pobre', 'zh': '差', 'hi': 'کمزور'},
      'q10_basic': {'en': 'Basic', 'ar': 'أساسي', 'fr': 'Basique', 'es': 'Básico', 'zh': '基本', 'hi': 'بنیادی'},
      'q10_good': {'en': 'Good', 'ar': 'جيد', 'fr': 'Bon', 'es': 'Bueno', 'zh': '好', 'hi': 'اچھا'},
      'q10_excellent': {'en': 'Excellent', 'ar': 'ممتاز', 'fr': 'Excellent', 'es': 'Excelente', 'zh': '优秀', 'hi': 'بہترین'},

      'q11_title': {'en': 'How would you describe your saving habits?', 'ar': 'كيف تصف عادات الادخار لديك؟', 'fr': 'Comment décririez-vous vos habitudes d\'épargne?', 'es': '¿Cómo describiría sus hábitos de ahorro?', 'zh': '您如何描述您的储蓄习惯？', 'hi': 'آپ اپنی بچت کی عادات کو کیسے بیان کریں گے؟'},
      'q11_dont': {'en': "I don't save regularly", 'ar': 'لا أدخر بانتظام', 'fr': 'Je n\'épargne pas régulièrement', 'es': 'No ahorro regularmente', 'zh': '我不经常储蓄', 'hi': 'میں باقاعدگی سے نہیں بچاتا'},
      'q11_sometimes': {'en': 'I save sometimes', 'ar': 'أدخر أحياناً', 'fr': 'J\'épargne parfois', 'es': 'Ahorro a veces', 'zh': '我有时储蓄', 'hi': 'میں کبھی کبھی بچاتا ہوں'},
      'q11_regularly': {'en': 'I save regularly', 'ar': 'أدخر بانتظام', 'fr': 'J\'épargne régulièrement', 'es': 'Ahorro regularmente', 'zh': '我经常储蓄', 'hi': 'میں باقاعدگی سے بچاتا ہوں'},
      'q11_fixed': {'en': 'I save a fixed percentage', 'ar': 'أدخر نسبة ثابتة', 'fr': 'J\'épargne un pourcentage fixe', 'es': 'Ahorro un porcentaje fijo', 'zh': '我储蓄固定比例', 'hi': 'میں ایک مقررہ فیصد بچاتا ہوں'},

      'q12_title': {'en': 'Do you have emergency savings (3-6 months expenses)?', 'ar': 'هل لديك مدخرات طوارئ (3-6 أشهر من المصاريف)؟', 'fr': 'Avez-vous une épargne d\'urgence (3-6 mois de dépenses)?', 'es': '¿Tiene ahorros de emergencia (3-6 meses de gastos)?', 'zh': '您有应急储蓄（3-6个月的支出）吗？', 'hi': 'کیا آپ کے پاس ہنگامی بچت ہے (3-6 ماہ کے اخراجات)؟'},
      'q12_yes': {'en': 'Yes', 'ar': 'نعم', 'fr': 'Oui', 'es': 'Sí', 'zh': '是', 'hi': 'ہاں'},
      'q12_no': {'en': 'No', 'ar': 'لا', 'fr': 'Non', 'es': 'No', 'zh': '否', 'hi': 'نہیں'},

      'q13_title': {'en': 'Have you started planning for retirement?', 'ar': 'هل بدأت التخطيط للتقاعد؟', 'fr': 'Avez-vous commencé à planifier votre retraite?', 'es': '¿Ha comenzado a planificar su jubilación?', 'zh': '您开始规划退休了吗？', 'hi': 'کیا آپ نے ریٹائرمنٹ کی منصوبہ بندی شروع کر دی ہے؟'},
      'q13_not_yet': {'en': 'Not yet', 'ar': 'ليس بعد', 'fr': 'Pas encore', 'es': 'Todavía no', 'zh': '还没有', 'hi': 'ابھی نہیں'},
      'q13_pension': {'en': 'Yes, through pension', 'ar': 'نعم، من خلال المعاش', 'fr': 'Oui, par la pension', 'es': 'Sí, a través de la pensión', 'zh': '是的，通过养老金', 'hi': 'ہاں، پنشن کے ذریعے'},
      'q13_save': {'en': 'Yes, I save regularly for it', 'ar': 'نعم، أدخر لذلك بانتظام', 'fr': 'Oui, j\'épargne régulièrement pour cela', 'es': 'Sí, ahorro regularmente para ello', 'zh': '是的，我为此定期储蓄', 'hi': 'ہاں، میں اس کے لیے باقاعدگی سے بچاتا ہوں'},

      'q14_title': {'en': 'What is your risk tolerance?', 'ar': 'ما هو مستوى تحملك للمخاطر؟', 'fr': 'Quelle est votre tolérance au risque?', 'es': '¿Cuál es su tolerancia al riesgo?', 'zh': '您的风险承受能力是多少？', 'hi': 'آپ کی رسک برداشت کیا ہے؟'},
      'q14_very_low': {'en': 'Very Low', 'ar': 'منخفض جداً', 'fr': 'Très faible', 'es': 'Muy bajo', 'zh': '非常低', 'hi': 'بہت کم'},
      'q14_low': {'en': 'Low', 'ar': 'منخفض', 'fr': 'Faible', 'es': 'Bajo', 'zh': '低', 'hi': 'کم'},
      'q14_medium': {'en': 'Medium', 'ar': 'متوسط', 'fr': 'Moyen', 'es': 'Medio', 'zh': '中等', 'hi': 'درمیانی'},
      'q14_high': {'en': 'High', 'ar': 'عالي', 'fr': 'Élevé', 'es': 'Alto', 'zh': '高', 'hi': 'زیادہ'},

      'q15_title': {'en': 'What is your main investment goal?', 'ar': 'ما هو هدفك الاستثماري الرئيسي؟', 'fr': 'Quel est votre principal objectif d\'investissement?', 'es': '¿Cuál es su principal objetivo de inversión?', 'zh': '您的主要投资目标是什么？', 'hi': 'آپ کا اصل سرمایہ کاری کا مقصد کیا ہے؟'},
      'q15_protection': {'en': 'Capital Protection', 'ar': 'حماية رأس المال', 'fr': 'Protection du capital', 'es': 'Protección del capital', 'zh': '资本保护', 'hi': 'سرمائے کا تحفظ'},
      'q15_income': {'en': 'Extra Income', 'ar': 'دخل إضافي', 'fr': 'Revenu supplémentaire', 'es': 'Ingreso extra', 'zh': '额外收入', 'hi': 'اضافی آمدنی'},
      'q15_growth': {'en': 'Capital Growth', 'ar': 'نمو رأس المال', 'fr': 'Croissance du capital', 'es': 'Crecimiento del capital', 'zh': '资本增长', 'hi': 'سرمائے کی نمو'},
      'q15_wealth': {'en': 'Long-term Wealth', 'ar': 'الثروة طويلة الأجل', 'fr': 'Richesse à long terme', 'es': 'Riqueza a largo plazo', 'zh': '长期财富', 'hi': 'طویل مدتی دولت'},
      'q15_speculation': {'en': 'Short-term Trading', 'ar': 'التداول قصير الأجل', 'fr': 'Trading à court terme', 'es': 'Trading a corto plazo', 'zh': '短期交易', 'hi': 'قلیل مدتی تجارت'},

      'q16_title': {'en': 'What is your goal from using Quantrock?', 'ar': 'ما هو هدفك من استخدام كوانتروك؟', 'fr': 'Quel est votre objectif en utilisant Quantrock?', 'es': '¿Cuál es su objetivo al usar Quantrock?', 'zh': '您使用Quantrock的目标是什么？', 'hi': 'Quantrock استعمال کرنے کا آپ کا مقصد کیا ہے؟'},
      'q16_learn': {'en': 'Learn about investing', 'ar': 'تعلم الاستثمار', 'fr': 'Apprendre l\'investissement', 'es': 'Aprender sobre inversión', 'zh': '学习投资', 'hi': 'سرمایہ کاری سیکھنا'},
      'q16_challenge': {'en': 'Take trading challenges', 'ar': 'خوض تحديات التداول', 'fr': 'Relever des défis de trading', 'es': 'Tomar desafíos de trading', 'zh': '接受交易挑战', 'hi': 'تجارتی چیلنجز لینا'},
      'q16_test': {'en': 'Test my strategies', 'ar': 'اختبار استراتيجياتي', 'fr': 'Tester mes stratégies', 'es': 'Probar mis estrategias', 'zh': '测试我的策略', 'hi': 'اپنی حکمت عملی کی جانچ'},
      'q16_prepare': {'en': 'Prepare for real trading', 'ar': 'الاستعداد للتداول الحقيقي', 'fr': 'Se préparer au trading réel', 'es': 'Prepararse para el trading real', 'zh': '为真实交易做准备', 'hi': 'اصل تجارت کی تیاری'},
      'q16_auto': {'en': 'Explore auto-trading', 'ar': 'استكشاف التداول الآلي', 'fr': 'Explorer le trading automatique', 'es': 'Explorar el trading automático', 'zh': '探索自动交易', 'hi': 'آٹو ٹریڈنگ کی تلاش'},

      'q17_title': {'en': 'Which industries interest you most?', 'ar': 'ما هي الصناعات التي تهمك أكثر؟', 'fr': 'Quelles industries vous intéressent le plus?', 'es': '¿Qué industrias le interesan más?', 'zh': '哪些行业最让您感兴趣？', 'hi': 'کون سی صنعتیں آپ کو سب سے زیادہ دلچسپی رکھتی ہیں؟'},
      'q17_tech': {'en': 'Technology', 'ar': 'التكنولوجيا', 'fr': 'Technologie', 'es': 'Tecnología', 'zh': '科技', 'hi': 'ٹیکنالوجی'},
      'q17_ev': {'en': 'Electric Vehicles', 'ar': 'السيارات الكهربائية', 'fr': 'Véhicules électriques', 'es': 'Vehículos eléctricos', 'zh': '电动汽车', 'hi': 'الیکٹرک گاڑیاں'},
      'q17_energy': {'en': 'Energy', 'ar': 'الطاقة', 'fr': 'Énergie', 'es': 'Energía', 'zh': '能源', 'hi': 'توانائی'},
      'q17_healthcare': {'en': 'Healthcare', 'ar': 'الرعاية الصحية', 'fr': 'Santé', 'es': 'Salud', 'zh': '医疗保健', 'hi': 'صحت کی دیکھ بھال'},
      'q17_retail': {'en': 'Retail', 'ar': 'التجزئة', 'fr': 'Commerce de détail', 'es': 'Comercio minorista', 'zh': '零售', 'hi': 'ریٹیل'},
      'q17_crypto': {'en': 'Crypto/Blockchain', 'ar': 'العملات الرقمية/البلوكتشين', 'fr': 'Crypto/Blockchain', 'es': 'Cripto/Blockchain', 'zh': '加密货币/区块链', 'hi': 'کرپٹو/بلاکچین'},
      'q17_finance': {'en': 'Finance', 'ar': 'المالية', 'fr': 'Finance', 'es': 'Finanzas', 'zh': '金融', 'hi': 'مالیات'},
      'q17_real_estate': {'en': 'Real Estate', 'ar': 'العقارات', 'fr': 'Immobilier', 'es': 'Bienes raíces', 'zh': '房地产', 'hi': 'رئیل اسٹیٹ'},

      'q18_title': {'en': 'How ready do you feel to start investing?', 'ar': 'ما مدى استعدادك للبدء في الاستثمار؟', 'fr': 'À quel point vous sentez-vous prêt à commencer à investir?', 'es': '¿Qué tan listo se siente para comenzar a invertir?', 'zh': '您觉得开始投资的准备程度如何？', 'hi': 'سرمایہ کاری شروع کرنے کے لیے آپ کتنے تیار ہیں؟'},
      'q18_need_help': {'en': 'I need guidance', 'ar': 'أحتاج إرشاد', 'fr': 'J\'ai besoin de conseils', 'es': 'Necesito orientación', 'zh': '我需要指导', 'hi': 'مجھے رہنمائی چاہیے'},
      'q18_somewhat': {'en': 'Somewhat ready', 'ar': 'مستعد نوعاً ما', 'fr': 'Assez prêt', 'es': 'Algo listo', 'zh': '有些准备', 'hi': 'کچھ تیار'},
      'q18_prepared': {'en': 'Well prepared', 'ar': 'مستعد جيداً', 'fr': 'Bien préparé', 'es': 'Bien preparado', 'zh': '准备充分', 'hi': 'اچھی طرح تیار'},
      'q18_confident': {'en': 'Very confident', 'ar': 'واثق جداً', 'fr': 'Très confiant', 'es': 'Muy confiado', 'zh': '非常有信心', 'hi': 'بہت پراعتماد'},

      'q19_title': {'en': 'How would you rate your understanding of passive income?', 'ar': 'كيف تقيّم فهمك للدخل السلبي؟', 'fr': 'Comment évalueriez-vous votre compréhension du revenu passif?', 'es': '¿Cómo calificaría su comprensión de los ingresos pasivos?', 'zh': '您如何评价您对被动收入的理解？', 'hi': 'آپ غیر فعال آمدنی کے بارے میں اپنی سمجھ کی درجہ بندی کیسے کریں گے؟'},
      'q19_dont': {'en': "I don't understand it", 'ar': 'لا أفهمه', 'fr': 'Je ne comprends pas', 'es': 'No lo entiendo', 'zh': '我不理解', 'hi': 'میں نہیں سمجھتا'},
      'q19_basic': {'en': 'Basic understanding', 'ar': 'فهم أساسي', 'fr': 'Compréhension basique', 'es': 'Comprensión básica', 'zh': '基本理解', 'hi': 'بنیادی سمجھ'},
      'q19_good': {'en': 'Good understanding', 'ar': 'فهم جيد', 'fr': 'Bonne compréhension', 'es': 'Buena comprensión', 'zh': '良好理解', 'hi': 'اچھی سمجھ'},
      'q19_excellent': {'en': 'Excellent understanding', 'ar': 'فهم ممتاز', 'fr': 'Excellente compréhension', 'es': 'Excelente comprensión', 'zh': '极好的理解', 'hi': 'بہترین سمجھ'},

      'q20_title': {'en': 'What demo portfolio size would you prefer to start with?', 'ar': 'ما حجم المحفظة التجريبية التي تفضل البدء بها؟', 'fr': 'Quelle taille de portefeuille de démonstration préféreriez-vous pour commencer?', 'es': '¿Con qué tamaño de cartera de demostración preferiría comenzar?', 'zh': '您希望从多大的模拟投资组合开始？', 'hi': 'آپ کس ڈیمو پورٹ فولیو سائز سے شروع کرنا پسند کریں گے؟'},
      'q20_1k': {'en': '\$1,000', 'ar': '1,000\$', 'fr': '1 000\$', 'es': '\$1,000', 'zh': '\$1,000', 'hi': '\$1,000'},
      'q20_10k': {'en': '\$10,000', 'ar': '10,000\$', 'fr': '10 000\$', 'es': '\$10,000', 'zh': '\$10,000', 'hi': '\$10,000'},
      'q20_25k': {'en': '\$25,000', 'ar': '25,000\$', 'fr': '25 000\$', 'es': '\$25,000', 'zh': '\$25,000', 'hi': '\$25,000'},
      'q20_50k': {'en': '\$50,000', 'ar': '50,000\$', 'fr': '50 000\$', 'es': '\$50,000', 'zh': '\$50,000', 'hi': '\$50,000'},
      'q20_100k': {'en': '\$100,000', 'ar': '100,000\$', 'fr': '100 000\$', 'es': '\$100,000', 'zh': '\$100,000', 'hi': '\$100,000'},

      // Common
      'continue': {'en': 'Continue', 'ar': 'متابعة', 'fr': 'Continuer', 'es': 'Continuar', 'zh': '继续', 'hi': 'جاری رکھیں'},
      'back': {'en': 'Back', 'ar': 'رجوع', 'fr': 'Retour', 'es': 'Atrás', 'zh': '返回', 'hi': 'واپس'},
      'question': {'en': 'Question', 'ar': 'سؤال', 'fr': 'Question', 'es': 'Pregunta', 'zh': '问题', 'hi': 'سوال'},
      'of': {'en': 'of', 'ar': 'من', 'fr': 'sur', 'es': 'de', 'zh': '的', 'hi': 'کا'},
      'select_all': {'en': 'Select all that apply', 'ar': 'اختر كل ما ينطبق', 'fr': 'Sélectionnez tout ce qui s\'applique', 'es': 'Seleccione todo lo que corresponda', 'zh': '选择所有适用的', 'hi': 'سب کا انتخاب کریں جو لاگو ہو'},

      // Component badges and buttons
      'choose_one': {'en': 'Choose one', 'ar': 'اختر واحداً', 'fr': 'Choisissez-en un', 'es': 'Elija uno', 'zh': '选择一个', 'hi': 'ایک چنیں'},
      'tap_select': {'en': 'Tap to select', 'ar': 'انقر للاختيار', 'fr': 'Appuyez pour sélectionner', 'es': 'Toque para seleccionar', 'zh': '点击选择', 'hi': 'منتخب کرنے کے لیے ٹیپ کریں'},
      'select_multiple': {'en': 'Select multiple', 'ar': 'اختر عدة خيارات', 'fr': 'Sélectionnez plusieurs', 'es': 'Seleccione múltiples', 'zh': '选择多个', 'hi': 'متعدد منتخب کریں'},
      'selected': {'en': 'selected', 'ar': 'مختار', 'fr': 'sélectionné', 'es': 'seleccionado', 'zh': '已选择', 'hi': 'منتخب'},
      'helper_rating': {'en': '1 = No knowledge, 5 = Excellent', 'ar': '1 = لا معرفة، 5 = ممتاز', 'fr': '1 = Aucune connaissance, 5 = Excellent', 'es': '1 = Sin conocimiento, 5 = Excelente', 'zh': '1 = 无知识，5 = 优秀', 'hi': '1 = کوئی علم نہیں، 5 = بہترین'},
      'rate_all': {'en': 'Rate all areas to continue', 'ar': 'قيّم جميع المجالات للمتابعة', 'fr': 'Évaluez tous les domaines pour continuer', 'es': 'Califique todas las áreas para continuar', 'zh': '评估所有领域以继续', 'hi': 'جاری رکھنے کے لیے تمام شعبوں کی درجہ بندی کریں'},
      'got_it': {'en': 'Got it', 'ar': 'فهمت', 'fr': 'Compris', 'es': 'Entendido', 'zh': '明白了', 'hi': 'سمجھ گیا'},

      // Knowledge areas for Q6
      'area_stock_market': {'en': 'Stock Market', 'ar': 'سوق الأسهم', 'fr': 'Marché boursier', 'es': 'Mercado de valores', 'zh': '股票市场', 'hi': 'سٹاک مارکیٹ'},
      'area_risk_management': {'en': 'Risk management', 'ar': 'إدارة المخاطر', 'fr': 'Gestion des risques', 'es': 'Gestión de riesgos', 'zh': '风险管理', 'hi': 'رسک مینجمنٹ'},
      'area_technical_analysis': {'en': 'Technical and fundamental analysis', 'ar': 'التحليل الفني والأساسي', 'fr': 'Analyse technique et fondamentale', 'es': 'Análisis técnico y fundamental', 'zh': '技术和基本面分析', 'hi': 'تکنیکی اور بنیادی تجزیہ'},
      'area_portfolio_diversification': {'en': 'Portfolio diversification', 'ar': 'تنويع المحفظة', 'fr': 'Diversification du portefeuille', 'es': 'Diversificación de cartera', 'zh': '投资组合多元化', 'hi': 'پورٹ فولیو ڈائیورسیفیکیشن'},
    };

    return translations[key]?[_selectedLanguage] ?? translations[key]?['en'] ?? key;
  }

  bool get _isArabic => _selectedLanguage == 'ar';
  bool get _isRTL => _selectedLanguage == 'ar';

  String _getLanguageLabel(String code) {
    switch (code) {
      case 'en': return 'EN';
      case 'ar': return 'AR';
      case 'fr': return 'FR';
      case 'es': return 'ES';
      case 'zh': return 'ZH';
      case 'hi': return 'HI';
      default: return 'EN';
    }
  }

  PopupMenuItem<String> _buildLanguageMenuItem(String code, String label) {
    return PopupMenuItem<String>(
      value: code,
      child: Row(
        children: [
          Text(label, style: TextStyle(color: _selectedLanguage == code ? const Color(0xFF22C55E) : Colors.white, fontSize: 14)),
          if (_selectedLanguage == code) ...[
            const Spacer(),
            const Icon(Icons.check, color: Color(0xFF22C55E), size: 18),
          ],
        ],
      ),
    );
  }

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
    // Level badges: Novice → Rising Trader → Market Explorer → Portfolio Builder → Investment Master
    if (level <= 1) return 'Novice';
    if (level <= 2) return 'Rising Trader';
    if (level <= 3) return 'Market Explorer';
    if (level <= 4) return 'Portfolio Builder';
    return 'Investment Master';
  }

  void _awardXP(int xp) {
    final newXP = _totalXP + xp;
    final newLevel = _calculateLevel(newXP);

    setState(() {
      _totalXP = newXP;
      if (newLevel > _currentLevel) {
        _currentLevel = newLevel;
      }
    });

    _checkMilestones();
  }

  void _checkMilestones() {
    if (_step == 5) {
      _showMilestonePopup('5 Questions Complete!', 'Great start on your journey!');
    } else if (_step == 10) {
      _showMilestonePopup('Halfway There!', '10 questions answered!');
    } else if (_step == 15) {
      _showMilestonePopup('Almost Done!', 'Just 5 more to go!');
    } else if (_step == 20) {
      _showMilestonePopup('Quest Complete!', 'You are ready to invest!');
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

  // Get section-specific colors for progress bars
  List<Color> _getSectionGradientColors() {
    if (_step <= 9) {
      // Section 1: Investment Background - Green theme
      return [const Color(0xFF22C55E), const Color(0xFF16A34A)];
    } else if (_step <= 14) {
      // Section 2: Financial Literacy - Blue theme
      return [const Color(0xFF3B82F6), const Color(0xFF2563EB)];
    } else if (_step <= 17) {
      // Section 3: Investment Goals - Purple theme
      return [const Color(0xFFA855F7), const Color(0xFF9333EA)];
    } else {
      // Section 4: Portfolio Preferences - Gold theme
      return [const Color(0xFFF59E0B), const Color(0xFFD97706)];
    }
  }

  Color _getSectionPrimaryColor() {
    if (_step <= 9) return const Color(0xFF22C55E);
    if (_step <= 14) return const Color(0xFF3B82F6);
    if (_step <= 17) return const Color(0xFFA855F7);
    return const Color(0xFFF59E0B);
  }

  IconData _getSectionIcon() {
    if (_step <= 9) return Icons.person_outline;
    if (_step <= 14) return Icons.school_outlined;
    if (_step <= 17) return Icons.flag_outlined;
    return Icons.account_balance_wallet_outlined;
  }

  String _getSectionProgress() {
    // Section 1: Questions 1-9 (9 questions) - Investment Background
    // Section 2: Questions 10-14 (5 questions) - Financial Literacy
    // Section 3: Questions 15-17 (3 questions) - Investment Goals
    // Section 4: Questions 18-20 (3 questions) - Portfolio Preferences

    int sectionStart;
    int sectionEnd;
    String sectionName;

    if (_step <= 9) {
      sectionStart = 1;
      sectionEnd = 9;
      sectionName = 'Investment Background';
    } else if (_step <= 14) {
      sectionStart = 10;
      sectionEnd = 14;
      sectionName = 'Financial Literacy';
    } else if (_step <= 17) {
      sectionStart = 15;
      sectionEnd = 17;
      sectionName = 'Investment Goals';
    } else {
      sectionStart = 18;
      sectionEnd = 20;
      sectionName = 'Portfolio Preferences';
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
            ChoiceOption(label: _t('q7_commodities'), value: 'commodities', icon: '🛢️'),
            ChoiceOption(label: _t('q7_metals'), value: 'metals', icon: '🥇'),
            ChoiceOption(label: _t('q7_forex'), value: 'forex', icon: '💱'),
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
                // Top Row: Logo on left, Language selector on right
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/images/logo.png',
                      height: 40,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback if logo not found
                        return Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFA855F7), Color(0xFF3B82F6)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.hexagon, color: Colors.white, size: 24),
                        );
                      },
                    ),
                    // Language Selector Dropdown
                    PopupMenuButton<String>(
                      onSelected: (value) => setState(() => _selectedLanguage = value),
                      offset: const Offset(0, 40),
                      color: const Color(0xFF1A1A2E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getLanguageLabel(_selectedLanguage),
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => [
                        _buildLanguageMenuItem('en', '🇺🇸 English'),
                        _buildLanguageMenuItem('ar', '🇸🇦 العربية'),
                        _buildLanguageMenuItem('fr', '🇫🇷 Français'),
                        _buildLanguageMenuItem('es', '🇪🇸 Español'),
                        _buildLanguageMenuItem('zh', '🇨🇳 中文'),
                        _buildLanguageMenuItem('hi', '🇮🇳 हिंदी'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                // QIQT Badge with Info Icon
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
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _showQIQTLevelsPopup(),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                        ).createShader(bounds),
                        child: const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 28,
                        ),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showIntro = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                      ),
                      borderRadius: BorderRadius.circular(12),
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
                  '© 2025 Quantrock. All rights reserved.',
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0A),
          borderRadius: BorderRadius.circular(10.5),
        ),
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
              ).createShader(bounds),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
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
      ),
    );
  }

  Widget _buildIntroBadgeWithInfo(IconData icon, String title, String subtitle, VoidCallback onInfoTap) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0A),
          borderRadius: BorderRadius.circular(10.5),
        ),
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
              ).createShader(bounds),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
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
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                ).createShader(bounds),
                child: const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
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
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Got it',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
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

  void _showQIQTLevelsPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
              ).createShader(bounds),
              child: const Text(
                'QIQT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const Text(
              ' Classification',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'QIQT is an intelligent qualification test built on OECD, MIT, and CFA standards, designed to measure your investment experience, financial literacy, motivations, and readiness to learn.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'QIQT helps you assess your financial knowledge, investment background, and determine your ideal path inside Quantrock-whether in challenges, daily lessons, or selecting the appropriate demo portfolio size.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              _buildWhitePointItem(_t('item_objectives')),
              _buildWhitePointItem(_t('item_experience')),
              _buildWhitePointItem(_t('item_literacy')),
              _buildWhitePointItem(_t('item_readiness')),
              _buildWhitePointItem(_t('item_challenge')),
              _buildWhitePointItem(_t('item_portfolio')),
              _buildWhitePointItem(_t('item_path')),
              _buildWhitePointItem(_t('item_motivation')),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _t('got_it'),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhitePointItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
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
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Got it',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
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
                fontSize: 13,
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
                    final sectionColors = _getSectionGradientColors();
                    return Transform.scale(
                      scale: 1.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: sectionColors,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: sectionColors[0].withValues(alpha: 0.4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getSectionIcon(),
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
                  child: Builder(
                    builder: (context) {
                      final sectionColors = _getSectionGradientColors();
                      final primaryColor = _getSectionPrimaryColor();
                      return Column(
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
                                  gradient: LinearGradient(
                                    colors: sectionColors,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withValues(alpha: 0.5),
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
                              color: primaryColor.withValues(alpha: 0.8),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    },
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
    final primaryColor = _getSectionPrimaryColor();

    // Purple gradient colors for each section
    final milestoneColors = [
      const Color(0xFFA855F7), // Section 1 - Purple
      const Color(0xFFA855F7), // Section 2 - Purple
      const Color(0xFFA855F7), // Section 3 - Purple
      const Color(0xFFA855F7), // Section 4 - Purple
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                _getSectionIcon(),
                color: primaryColor,
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
                  color: primaryColor.withValues(alpha: 0.7),
                  size: 14,
                ),
              ),
              const Spacer(),
              Text(
                '$_step/$totalQuestions',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 12,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  // Multi-colored segmented progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: SizedBox(
                      height: 12,
                      width: constraints.maxWidth,
                      child: Row(
                        children: () {
                          // Section boundaries at milestones (5, 10, 15, 20)
                          final sectionBounds = [0, 5, 10, 15, 20];
                          final segmentWidgets = <Widget>[];
                          // Equal visual width for each section (25% each)
                          final sectionWidth = constraints.maxWidth / 4;

                          for (int i = 0; i < 4; i++) {
                            final sectionStart = sectionBounds[i];
                            final sectionEnd = sectionBounds[i + 1];
                            final sectionLength = sectionEnd - sectionStart;

                            // Calculate fill for this section
                            double fillFraction = 0.0;
                            if (_step >= sectionEnd) {
                              fillFraction = 1.0; // Fully filled
                            } else if (_step > sectionStart) {
                              fillFraction = (_step - sectionStart) / sectionLength;
                            }

                            segmentWidgets.add(
                              SizedBox(
                                width: sectionWidth,
                                child: Stack(
                                  children: [
                                    // Empty background (already covered by outer background)
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeOutCubic,
                                      height: 12,
                                      width: sectionWidth * fillFraction,
                                      decoration: BoxDecoration(
                                        color: milestoneColors[i],
                                        boxShadow: fillFraction > 0
                                            ? [
                                                BoxShadow(
                                                  color: milestoneColors[i].withValues(alpha: 0.5),
                                                  blurRadius: 8,
                                                ),
                                              ]
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return segmentWidgets;
                        }(),
                      ),
                    ),
                  ),
                  // Milestone markers - at 5, 10, 15, 20 questions
                  ...List.generate(4, (index) {
                    // Milestone positions at 5, 10, 15, 20 questions (25%, 50%, 75%, 100%)
                    final milestoneSteps = [5, 10, 15, 20];
                    final isReached = _step >= milestoneSteps[index];
                    final milestoneColor = milestoneColors[index];
                    // Equal spacing: each at 25%, 50%, 75%, 100%
                    final equalPosition = (index + 1) / 4.0;
                    final leftPosition = index == 3
                        ? constraints.maxWidth - 16
                        : constraints.maxWidth * equalPosition - 8;
                    return Positioned(
                      left: leftPosition,
                      top: -2,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isReached ? milestoneColor : Colors.grey.shade700,
                          border: Border.all(
                            color: isReached ? milestoneColor : Colors.grey,
                            width: 2,
                          ),
                          boxShadow: isReached
                              ? [
                                  BoxShadow(
                                    color: milestoneColor.withValues(alpha: 0.5),
                                    blurRadius: 6,
                                  ),
                                ]
                              : null,
                        ),
                        child: isReached
                            ? const Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ],
      ),
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

