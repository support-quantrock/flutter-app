import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';

// Scoring Models
class ScoreResult {
  final int score;
  final int maxScore;
  final String label;
  final Color color;
  final String emoji;

  ScoreResult({
    required this.score,
    required this.maxScore,
    required this.label,
    required this.color,
    required this.emoji,
  });
}

class PortfolioSuggestion {
  final String size;
  final Color color;

  PortfolioSuggestion({required this.size, required this.color});
}

// Portfolio Allocation Model
class AssetAllocation {
  final String name;
  final double percentage;
  final Color color;
  final IconData icon;

  AssetAllocation({
    required this.name,
    required this.percentage,
    required this.color,
    required this.icon,
  });
}

// QIQT Scoring Calculations (Based on OECD, MIT, CFA Standards)
class InvestorScoring {
  // SECTION 1: Investment Experience (0-40 points)
  static ScoreResult calculateInvestmentExperience(QuestionnaireAnswers answers) {
    int score = 0;

    // Q1 Gender - 0 points (not scored)

    // Q2 Age Group (0-5 points)
    switch (answers.ageRange) {
      case 'under_18':
        score += 0;
        break;
      case '18_24':
        score += 2;
        break;
      case '25_34':
        score += 4;
        break;
      case '35_44':
        score += 5;
        break;
      case '45_54':
        score += 4;
        break;
      case '55_64':
        score += 3;
        break;
      case '65_plus':
        score += 2;
        break;
    }

    // Q3 Investment Account (0-4 points)
    switch (answers.hasInvestmentAccount) {
      case 'no':
        score += 0;
        break;
      case 'planning':
        score += 2;
        break;
      case 'yes':
        score += 4;
        break;
    }

    // Q4 Active Portfolio (0-5 points)
    switch (answers.hasActivePortfolio) {
      case 'no':
        score += 0;
        break;
      case 'used_to':
        score += 3;
        break;
      case 'yes':
        score += 5;
        break;
    }

    // Q5 Portfolio Size (1-6 points)
    switch (answers.portfolioSize) {
      case 'less_1k':
        score += 1;
        break;
      case '1k_10k':
        score += 2;
        break;
      case '10k_25k':
        score += 3;
        break;
      case '25k_100k':
        score += 4;
        break;
      case '100k_500k':
        score += 5;
        break;
      case 'more_500k':
        score += 6;
        break;
    }

    // Q6 Knowledge Ratings - avg × 2 (max 10 points)
    final stocksKnowledge = answers.stocksKnowledge ?? 1;
    final riskKnowledge = answers.riskManagementKnowledge ?? 1;
    final technicalKnowledge = answers.technicalAnalysisKnowledge ?? 1;
    final diversificationKnowledge = answers.portfolioDiversificationKnowledge ?? 1;
    final avgKnowledge = (stocksKnowledge + riskKnowledge + technicalKnowledge + diversificationKnowledge) / 4;
    score += (avgKnowledge * 2).round().clamp(0, 10);

    // Q7 Asset Classes - +1 per selection (max 5 points)
    final assetClasses = answers.assetClasses;
    if (!assetClasses.contains('none')) {
      score += math.min(assetClasses.length, 5);
    }

    // Q8 Chart Reading Comfort (0-3 points)
    switch (answers.chartReadingComfort) {
      case 'not_comfortable':
        score += 0;
        break;
      case 'slightly':
        score += 1;
        break;
      case 'comfortable':
        score += 2;
        break;
      case 'very_comfortable':
        score += 3;
        break;
    }

    // Q9 Investment Time Horizon (0-3 points)
    switch (answers.investmentTimeHorizon) {
      case 'less_1_year':
        score += 0;
        break;
      case '1_3_years':
        score += 1;
        break;
      case '3_7_years':
        score += 2;
        break;
      case 'more_7_years':
        score += 3;
        break;
    }

    // Determine experience level based on score
    String label;
    Color color;
    String emoji;

    if (score <= 10) {
      label = 'Very Low Experience';
      color = const Color(0xFFEF4444);
      emoji = '🔴';
    } else if (score <= 20) {
      label = 'Low Experience';
      color = const Color(0xFFF59E0B);
      emoji = '🟠';
    } else if (score <= 30) {
      label = 'Moderate Experience';
      color = const Color(0xFF3B82F6);
      emoji = '🔵';
    } else {
      label = 'High Experience';
      color = const Color(0xFF22C55E);
      emoji = '🟢';
    }

    return ScoreResult(
      score: score.clamp(0, 40),
      maxScore: 40,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  // SECTION 2: Financial Literacy & Readiness (0-30 points)
  static ScoreResult calculateFinancialLiteracy(QuestionnaireAnswers answers) {
    int score = 0;

    // Q10 Market Risk Understanding (0-6 points)
    switch (answers.marketRiskUnderstanding) {
      case 'poor':
        score += 0;
        break;
      case 'basic':
        score += 2;
        break;
      case 'good':
        score += 4;
        break;
      case 'excellent':
        score += 6;
        break;
    }

    // Q11 Saving Discipline (0-4 points)
    switch (answers.savingHabit) {
      case 'dont_save':
        score += 0;
        break;
      case 'sometimes':
        score += 2;
        break;
      case 'regularly':
        score += 3;
        break;
      case 'fixed_percentage':
        score += 4;
        break;
    }

    // Q12 Emergency Savings (0-3 points)
    if (answers.hasEmergencySavings == 'yes') {
      score += 3;
    }

    // Q13 Retirement Planning (0-3 points)
    switch (answers.retirementPlanning) {
      case 'not_yet':
        score += 0;
        break;
      case 'pension':
        score += 2;
        break;
      case 'save_regularly':
        score += 3;
        break;
    }

    // Q14 Risk Tolerance (0-5 points)
    switch (answers.riskTolerance) {
      case 'very_low':
        score += 0;
        break;
      case 'low':
        score += 2;
        break;
      case 'medium':
        score += 3;
        break;
      case 'high':
        score += 5;
        break;
    }

    // Determine literacy level for label
    String label;
    Color color;
    String emoji;

    if (score <= 10) {
      label = 'Beginner';
      color = const Color(0xFFF59E0B);
      emoji = '🟠';
    } else if (score <= 20) {
      label = 'Intermediate';
      color = const Color(0xFF3B82F6);
      emoji = '🔵';
    } else {
      label = 'Expert';
      color = const Color(0xFF22C55E);
      emoji = '🟢';
    }

    return ScoreResult(
      score: score.clamp(0, 30),
      maxScore: 30,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  // SECTION 3: Motivation & Objectives (0-15 points)
  static ScoreResult calculateMotivation(QuestionnaireAnswers answers) {
    int score = 0;

    // Q15 Investment Goal (1-5 points)
    switch (answers.investingGoal) {
      case 'capital_protection':
        score += 1;
        break;
      case 'extra_income':
        score += 2;
        break;
      case 'capital_growth':
        score += 3;
        break;
      case 'long_term_wealth':
        score += 4;
        break;
      case 'short_term_speculation':
        score += 5;
        break;
    }

    // Q16 Quantrock Goal (2-4 points)
    switch (answers.quantrockGoal) {
      case 'learn':
        score += 2;
        break;
      case 'challenge':
        score += 2;
        break;
      case 'test_strategy':
        score += 3;
        break;
      case 'prepare_trading':
        score += 4;
        break;
      case 'explore_auto':
        score += 4;
        break;
    }

    // Q17 Industries Interested - +0.5 per selection (max 5 points)
    final industries = answers.industriesInterested;
    score += (industries.length * 0.5).round().clamp(0, 5);

    // Determine motivation level based on score
    String label;
    Color color;
    String emoji;

    if (score <= 5) {
      label = 'Unclear or Basic Objectives';
      color = const Color(0xFFF59E0B);
      emoji = '🟠';
    } else if (score <= 10) {
      label = 'Developing Objectives';
      color = const Color(0xFF3B82F6);
      emoji = '🔵';
    } else {
      label = 'Strong, Defined Objectives';
      color = const Color(0xFF22C55E);
      emoji = '🟢';
    }

    return ScoreResult(
      score: score.clamp(0, 15),
      maxScore: 15,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  // SECTION 4: Learning Readiness (0-15 points)
  static ScoreResult calculateLearningReadiness(QuestionnaireAnswers answers) {
    int score = 0;

    // Q18 Investment Readiness (0-4 points)
    switch (answers.investmentReadinessText) {
      case 'need_help':
        score += 0;
        break;
      case 'somewhat':
        score += 2;
        break;
      case 'prepared':
        score += 3;
        break;
      case 'confident':
        score += 4;
        break;
    }

    // Q19 Passive Income Knowledge (0-3 points)
    switch (answers.passiveIncomeKnowledgeText) {
      case 'dont_understand':
        score += 0;
        break;
      case 'basic':
        score += 1;
        break;
      case 'good':
        score += 2;
        break;
      case 'excellent':
        score += 3;
        break;
    }

    // Q20 Demo Portfolio Size (1-5 points)
    switch (answers.preferredPortfolioSize) {
      case '1k':
        score += 1;
        break;
      case '10k':
        score += 2;
        break;
      case '25k':
        score += 3;
        break;
      case '50k':
        score += 4;
        break;
      case '100k':
        score += 5;
        break;
    }

    // Determine readiness level based on score
    String label;
    Color color;
    String emoji;

    if (score <= 5) {
      label = 'Learning Challenge';
      color = const Color(0xFFF59E0B);
      emoji = '🟠';
    } else if (score <= 10) {
      label = 'Investing Challenge';
      color = const Color(0xFF3B82F6);
      emoji = '🔵';
    } else {
      label = 'Ready for Challenge';
      color = const Color(0xFF22C55E);
      emoji = '🟢';
    }

    return ScoreResult(
      score: score.clamp(0, 15),
      maxScore: 15,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  // Calculate Total Score (0-100) and Final Classification
  static ScoreResult calculateTotalScore(
    ScoreResult experience,
    ScoreResult literacy,
    ScoreResult motivation,
    ScoreResult readiness,
  ) {
    final totalScore = experience.score + literacy.score + motivation.score + readiness.score;

    String label;
    Color color;
    String emoji;

    if (totalScore <= 40) {
      label = 'Beginner';
      color = const Color(0xFFF59E0B);
      emoji = '🌱';
    } else if (totalScore <= 70) {
      label = 'Intermediate';
      color = const Color(0xFF3B82F6);
      emoji = '📚';
    } else {
      label = 'Advanced';
      color = const Color(0xFF22C55E);
      emoji = '🎓';
    }

    return ScoreResult(
      score: totalScore,
      maxScore: 100,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  // Legacy methods for compatibility - now map to new system
  static ScoreResult calculatePersonality(QuestionnaireAnswers answers) {
    return calculateInvestmentExperience(answers);
  }

  static ScoreResult calculateLiteracy(QuestionnaireAnswers answers) {
    return calculateFinancialLiteracy(answers);
  }

  static ScoreResult calculateStrength(QuestionnaireAnswers answers) {
    return calculateMotivation(answers);
  }

  static ScoreResult calculateReadiness(QuestionnaireAnswers answers) {
    return calculateLearningReadiness(answers);
  }

  static PortfolioSuggestion getSuggestedPortfolio(
    ScoreResult strength,
    ScoreResult personality,
    ScoreResult readiness,
  ) {
    if (strength.label == 'Weak' || personality.label == 'Conservative Investor') {
      return PortfolioSuggestion(size: '\$1k – \$10k', color: const Color(0xFFF59E0B));
    } else if (strength.label == 'Moderate' || personality.label == 'Balanced Investor') {
      return PortfolioSuggestion(size: '\$10k – \$25k', color: const Color(0xFF3B82F6));
    } else if (strength.label == 'Strong' && personality.label == 'Growth Investor') {
      return PortfolioSuggestion(size: '\$25k – \$50k', color: const Color(0xFF8B5CF6));
    } else if (strength.label == 'Strong' &&
        personality.label == 'Aggressive Trader' &&
        readiness.label == 'Full Challenge Ready') {
      return PortfolioSuggestion(size: '\$50k – \$100k', color: const Color(0xFF22C55E));
    }
    return PortfolioSuggestion(size: '\$10k – \$25k', color: const Color(0xFF3B82F6));
  }

  // Portfolio allocation based on user's selected asset classes
  static List<AssetAllocation> getPortfolioAllocation(ScoreResult personality, QuestionnaireAnswers answers) {
    // This method is kept for legacy compatibility but not used
    return getPortfolioAllocationByScore(50);
  }

  static List<AssetAllocation> getPortfolioAllocationByScore(int totalScore) {
    // Fixed items: Stocks, ETFs, Crypto, Bonds
    // Percentages vary based on total score (0-100)

    double stocksPercent;
    double etfsPercent;
    double cryptoPercent;
    double bondsPercent;

    if (totalScore <= 40) {
      // Low score (Beginner) - Conservative allocation
      stocksPercent = 30;
      etfsPercent = 35;
      cryptoPercent = 5;
      bondsPercent = 30;
    } else if (totalScore <= 70) {
      // Medium score (Intermediate) - Balanced allocation
      stocksPercent = 35;
      etfsPercent = 30;
      cryptoPercent = 15;
      bondsPercent = 20;
    } else {
      // High score (Expert) - Aggressive allocation
      stocksPercent = 40;
      etfsPercent = 25;
      cryptoPercent = 25;
      bondsPercent = 10;
    }

    return [
      AssetAllocation(
        name: 'Stocks',
        percentage: stocksPercent,
        color: const Color(0xFF3B82F6),
        icon: Icons.trending_up,
      ),
      AssetAllocation(
        name: 'ETFs',
        percentage: etfsPercent,
        color: const Color(0xFF8B5CF6),
        icon: Icons.pie_chart,
      ),
      AssetAllocation(
        name: 'Crypto',
        percentage: cryptoPercent,
        color: const Color(0xFFF59E0B),
        icon: Icons.currency_bitcoin,
      ),
      AssetAllocation(
        name: 'Bonds',
        percentage: bondsPercent,
        color: const Color(0xFF22C55E),
        icon: Icons.account_balance,
      ),
    ];
  }
}

// Info Content
class InfoCategory {
  final String title;
  final List<InfoItem> items;

  InfoCategory({required this.title, required this.items});
}

class InfoItem {
  final String emoji;
  final String label;
  final Color color;
  final String description;

  InfoItem({
    required this.emoji,
    required this.label,
    required this.color,
    required this.description,
  });
}

final Map<String, InfoCategory> infoContent = {
  'personality': InfoCategory(
    title: 'Personal Information & Investment Background (0-40 pts)',
    items: [
      InfoItem(
        emoji: '🔴',
        label: 'Very Low Experience (0-10)',
        color: const Color(0xFFEF4444),
        description: 'No portfolio, no knowledge, short time horizon, minimal exposure.',
      ),
      InfoItem(
        emoji: '🟠',
        label: 'Low Experience (11-20)',
        color: const Color(0xFFF59E0B),
        description: 'Beginner investor, small portfolio, limited knowledge.',
      ),
      InfoItem(
        emoji: '🔵',
        label: 'Moderate Experience (21-30)',
        color: const Color(0xFF3B82F6),
        description: 'Some investment history, several asset classes, average chart reading.',
      ),
      InfoItem(
        emoji: '🟢',
        label: 'High Experience (31-40)',
        color: const Color(0xFF22C55E),
        description: 'Strong portfolio size, good knowledge, diversified exposure, long time horizon.',
      ),
      InfoItem(
        emoji: '📋',
        label: 'What This Measures',
        color: const Color(0xFF6366F1),
        description: 'Real investment involvement • Portfolio size & history • Knowledge level • Asset exposure • Time horizon confidence',
      ),
    ],
  ),
  'literacy': InfoCategory(
    title: 'Financial Literacy (0-30 pts)',
    items: [
      InfoItem(
        emoji: '🟠',
        label: 'Beginner (0-10)',
        color: const Color(0xFFF59E0B),
        description: 'Limited risk understanding, building savings habits, learning financial fundamentals.',
      ),
      InfoItem(
        emoji: '🔵',
        label: 'Intermediate (11-20)',
        color: const Color(0xFF3B82F6),
        description: 'Good understanding of risk, consistent saving, has emergency fund and basic planning.',
      ),
      InfoItem(
        emoji: '🟢',
        label: 'Expert (21-30)',
        color: const Color(0xFF22C55E),
        description: 'Strong risk understanding, mature saving habits, comprehensive retirement planning.',
      ),
      InfoItem(
        emoji: '📋',
        label: 'What This Measures',
        color: const Color(0xFF6366F1),
        description: 'Risk understanding • Saving discipline • Emergency fund stability • Retirement planning • Behavioral profile',
      ),
    ],
  ),
  'strength': InfoCategory(
    title: 'Investment Objectives & Motivation (0-15 pts)',
    items: [
      InfoItem(
        emoji: '🟠',
        label: 'Unclear or Basic Objectives (0-5)',
        color: const Color(0xFFF59E0B),
        description: 'User is still exploring investing or focusing on protection.',
      ),
      InfoItem(
        emoji: '🔵',
        label: 'Developing Objectives (6-10)',
        color: const Color(0xFF3B82F6),
        description: 'Focus on income, growth, or learning.',
      ),
      InfoItem(
        emoji: '🟢',
        label: 'Strong, Defined Objectives (11-15)',
        color: const Color(0xFF22C55E),
        description: 'User aims for advanced goals like wealth-building or strategy testing.',
      ),
      InfoItem(
        emoji: '📋',
        label: 'What This Measures',
        color: const Color(0xFF8B5CF6),
        description: 'Investment goals • Intent behind using Quantrock • Industry interests • Motivation strength',
      ),
    ],
  ),
  'readiness': InfoCategory(
    title: 'Learning Readiness (0-15 pts)',
    items: [
      InfoItem(
        emoji: '🟠',
        label: 'Learning Challenge (0-5)',
        color: const Color(0xFFF59E0B),
        description: 'Needs foundation and learning before investing. Focus on education first.',
      ),
      InfoItem(
        emoji: '🔵',
        label: 'Investing Challenge (6-10)',
        color: const Color(0xFF3B82F6),
        description: 'Has knowledge but needs guided practice. Ready for investment challenges.',
      ),
      InfoItem(
        emoji: '🟢',
        label: 'Ready for Challenge (10-15)',
        color: const Color(0xFF22C55E),
        description: 'Fully confident and prepared for advanced trading tests or challenges.',
      ),
      InfoItem(
        emoji: '📋',
        label: 'What This Measures',
        color: const Color(0xFF10B981),
        description: 'Self-assessed preparedness • Understanding of passive income • Confidence and portfolio preference',
      ),
    ],
  ),
};

// Helper functions for display
String _getRiskToleranceLabel(String? value) {
  switch (value) {
    case 'low':
      return 'Low Risk';
    case 'medium':
      return 'Medium Risk';
    case 'high':
      return 'High Risk';
    default:
      return 'Not Set';
  }
}

String _getIndustryLabel(String value) {
  switch (value) {
    case 'tech':
      return 'Tech';
    case 'ev':
      return 'EV';
    case 'energy':
      return 'Energy';
    case 'healthcare':
      return 'Healthcare';
    case 'retail':
      return 'Retail';
    case 'crypto':
      return 'Crypto';
    default:
      return value;
  }
}

String _getAssetLabel(String value) {
  switch (value) {
    case 'stocks':
      return 'Stocks';
    case 'etfs':
      return 'ETFs';
    case 'crypto':
      return 'Crypto';
    case 'bonds':
      return 'Bonds';
    case 'real_estate':
      return 'Real Estate';
    case 'none':
      return 'None';
    default:
      return value;
  }
}

IconData _getIndustryIcon(String value) {
  switch (value) {
    case 'tech':
      return Icons.computer;
    case 'ev':
      return Icons.electric_car;
    case 'energy':
      return Icons.bolt;
    case 'healthcare':
      return Icons.local_hospital;
    case 'retail':
      return Icons.shopping_cart;
    case 'crypto':
      return Icons.currency_bitcoin;
    default:
      return Icons.business;
  }
}

IconData _getAssetIcon(String value) {
  switch (value) {
    case 'stocks':
      return Icons.trending_up;
    case 'etfs':
      return Icons.pie_chart;
    case 'crypto':
      return Icons.currency_bitcoin;
    case 'bonds':
      return Icons.account_balance;
    case 'real_estate':
      return Icons.home_work;
    case 'none':
      return Icons.block;
    default:
      return Icons.attach_money;
  }
}

class InvestorResultsPage extends StatefulWidget {
  const InvestorResultsPage({super.key});

  @override
  State<InvestorResultsPage> createState() => _InvestorResultsPageState();
}

class _InvestorResultsPageState extends State<InvestorResultsPage>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _pulseController;
  late AnimationController _confettiController;
  late Animation<double> _pulseAnimation;

  final List<_ConfettiParticle> _confetti = [];
  bool _showContent = false;
  String _selectedLanguage = 'en';

  bool get _isArabic => _selectedLanguage == 'ar';

  String _t(String key) {
    final translations = {
      'congratulations': {'en': 'Congratulations!', 'ar': 'تهانينا!'},
      'your_investor_profile': {'en': 'Your Investor Profile', 'ar': 'ملفك الاستثماري'},
      'risk_profile': {'en': 'Risk Profile', 'ar': 'ملف المخاطر'},
      'goal': {'en': 'Goal', 'ar': 'الهدف'},
      'low_risk': {'en': 'Low Risk', 'ar': 'مخاطر منخفضة'},
      'medium_risk': {'en': 'Medium Risk', 'ar': 'مخاطر متوسطة'},
      'high_risk': {'en': 'High Risk', 'ar': 'مخاطر عالية'},
      'not_set': {'en': 'Not Set', 'ar': 'غير محدد'},
      'learn_challenge': {'en': 'Learn Challenge', 'ar': 'تحدي التعلم'},
      '28_days_skills': {'en': '28 Days Skills', 'ar': 'مهارات 28 يوم'},
      'investment_challenge': {'en': 'Investment Challenge', 'ar': 'تحدي الاستثمار'},
      'interested_industries': {'en': 'Interested Industries', 'ar': 'الصناعات المهتم بها'},
      'asset_experience': {'en': 'Asset Experience', 'ar': 'خبرة الأصول'},
      'investment_background': {'en': '1: Investment Background', 'ar': '1: الخلفية الاستثمارية'},
      'financial_literacy': {'en': '2: Financial Literacy', 'ar': '2: الثقافة المالية'},
      'objectives_motivation': {'en': '3: Objectives & Motivation', 'ar': '3: الأهداف والدوافع'},
      'learning_readiness': {'en': '4: Learning Readiness', 'ar': '4: الاستعداد للتعلم'},
      'suggested_portfolio': {'en': 'Suggested Portfolio', 'ar': 'المحفظة المقترحة'},
      'portfolio_description': {'en': 'Based on your profile, this portfolio size is recommended to start your investment journey.', 'ar': 'بناءً على ملفك الشخصي، يُوصى بحجم المحفظة هذا لبدء رحلتك الاستثمارية.'},
      'portfolio_allocation': {'en': 'Portfolio Allocation', 'ar': 'توزيع المحفظة'},
      'optimized_for': {'en': 'Optimized for', 'ar': 'محسّن لـ'},
      'share_results': {'en': 'Share Results', 'ar': 'مشاركة النتائج'},
      'start_trading': {'en': 'Start Trading', 'ar': 'ابدأ التداول'},
      'stocks': {'en': 'Stocks', 'ar': 'أسهم'},
      'etfs': {'en': 'ETFs', 'ar': 'صناديق المؤشرات'},
      'crypto': {'en': 'Crypto', 'ar': 'عملات رقمية'},
      'bonds': {'en': 'Bonds', 'ar': 'سندات'},
      'real_estate': {'en': 'Real Estate', 'ar': 'عقارات'},
      'none': {'en': 'None', 'ar': 'لا شيء'},
      'tech': {'en': 'Tech', 'ar': 'التقنية'},
      'ev': {'en': 'EV', 'ar': 'السيارات الكهربائية'},
      'energy': {'en': 'Energy', 'ar': 'الطاقة'},
      'healthcare': {'en': 'Healthcare', 'ar': 'الرعاية الصحية'},
      'retail': {'en': 'Retail', 'ar': 'التجزئة'},
      // Score labels
      'very_low_experience': {'en': 'Very Low Experience', 'ar': 'خبرة منخفضة جداً'},
      'low_experience': {'en': 'Low Experience', 'ar': 'خبرة منخفضة'},
      'moderate_experience': {'en': 'Moderate Experience', 'ar': 'خبرة متوسطة'},
      'high_experience': {'en': 'High Experience', 'ar': 'خبرة عالية'},
      'beginner': {'en': 'Beginner', 'ar': 'مبتدئ'},
      'intermediate': {'en': 'Intermediate', 'ar': 'متوسط'},
      'expert': {'en': 'Expert', 'ar': 'متقدم'},
      'advanced': {'en': 'Advanced', 'ar': 'متقدم'},
      'unclear_objectives': {'en': 'Unclear or Basic Objectives', 'ar': 'أهداف غير واضحة أو أساسية'},
      'developing_objectives': {'en': 'Developing Objectives', 'ar': 'أهداف قيد التطوير'},
      'strong_objectives': {'en': 'Strong, Defined Objectives', 'ar': 'أهداف قوية ومحددة'},
      'learning_challenge': {'en': 'Learning Challenge', 'ar': 'تحدي التعلم'},
      'skill_challenge': {'en': 'Skill Challenge', 'ar': 'تحدي المهارات'},
      'investing_challenge': {'en': 'Investing Challenge', 'ar': 'تحدي الاستثمار'},
      'ready_for_challenge': {'en': 'Ready for Challenge', 'ar': 'جاهز للتحدي'},
      // Goal labels
      'capital_protection': {'en': 'Capital Protection', 'ar': 'حماية رأس المال'},
      'extra_income': {'en': 'Extra Income', 'ar': 'دخل إضافي'},
      'capital_growth': {'en': 'Capital Growth', 'ar': 'نمو رأس المال'},
      'long_term_wealth': {'en': 'Long-term Wealth', 'ar': 'الثروة طويلة الأجل'},
      'short_term_trading': {'en': 'Short-term Trading', 'ar': 'التداول قصير الأجل'},
      'not_specified': {'en': 'Not specified', 'ar': 'غير محدد'},
      // Finance label
      'finance': {'en': 'Finance', 'ar': 'المالية'},
      'crypto_blockchain': {'en': 'Crypto/Blockchain', 'ar': 'العملات الرقمية/البلوكتشين'},
    };
    return translations[key]?[_selectedLanguage] ?? translations[key]?['en'] ?? key;
  }

  String _translateScoreLabel(String label) {
    final keyMap = {
      'Very Low Experience': 'very_low_experience',
      'Low Experience': 'low_experience',
      'Moderate Experience': 'moderate_experience',
      'High Experience': 'high_experience',
      'Beginner': 'beginner',
      'Intermediate': 'intermediate',
      'Expert': 'expert',
      'Advanced': 'advanced',
      'Unclear or Basic Objectives': 'unclear_objectives',
      'Developing Objectives': 'developing_objectives',
      'Strong, Defined Objectives': 'strong_objectives',
      'Learning Challenge': 'learning_challenge',
      'Skill Challenge': 'skill_challenge',
      'Investing Challenge': 'investing_challenge',
      'Ready for Challenge': 'ready_for_challenge',
    };
    final key = keyMap[label];
    return key != null ? _t(key) : label;
  }

  String _getChallengeTitle(String level) {
    switch (level) {
      case 'Beginner':
        return _t('learning_challenge');
      case 'Intermediate':
        return _t('skill_challenge');
      default: // Advanced/Expert
        return _t('investing_challenge');
    }
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

    _mainController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _generateConfetti();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _showContent = true);
    });
  }

  void _generateConfetti() {
    final random = math.Random();
    for (int i = 0; i < 60; i++) {
      _confetti.add(_ConfettiParticle(
        color: [
          const Color(0xFF8B5CF6),
          const Color(0xFF3B82F6),
          const Color(0xFF22C55E),
          const Color(0xFFF59E0B),
          const Color(0xFFEC4899),
          const Color(0xFF6366F1),
        ][random.nextInt(6)],
        x: random.nextDouble(),
        delay: random.nextDouble() * 0.5,
        speed: 0.3 + random.nextDouble() * 0.7,
        size: 4 + random.nextDouble() * 8,
        rotation: random.nextDouble() * math.pi * 2,
      ));
    }
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _showInfoModal(String category) {
    final info = infoContent[category];
    if (info == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _InfoModal(category: info),
    );
  }

  @override
  Widget build(BuildContext context) {
    final answers = context.watch<QuestionnaireProvider>().answers;

    // New QIQT scoring system
    final experience = InvestorScoring.calculateInvestmentExperience(answers);
    final literacy = InvestorScoring.calculateFinancialLiteracy(answers);
    final motivation = InvestorScoring.calculateMotivation(answers);
    final readiness = InvestorScoring.calculateLearningReadiness(answers);
    final totalScore = InvestorScoring.calculateTotalScore(experience, literacy, motivation, readiness);

    // Legacy compatibility for portfolio suggestions
    final personality = InvestorScoring.calculatePersonality(answers);
    final strength = InvestorScoring.calculateStrength(answers);
    final portfolio = InvestorScoring.getSuggestedPortfolio(strength, personality, readiness);
    final allocations = InvestorScoring.getPortfolioAllocationByScore(totalScore.score);

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A1A2E),
                  Color(0xFF16213E),
                  Color(0xFF0F3460),
                ],
              ),
            ),
          ),

          // Confetti
          AnimatedBuilder(
            animation: _confettiController,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: _ConfettiPainter(
                  confetti: _confetti,
                  progress: _confettiController.value,
                ),
              );
            },
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  // Header
                  _AnimatedSlideIn(
                    controller: _mainController,
                    delay: 0.0,
                    child: Column(
                      children: [
                        Text(
                          _t('congratulations'),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple.shade300,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _t('your_investor_profile'),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Main Score Card (Total Score with Classification)
                  _AnimatedSlideIn(
                    controller: _mainController,
                    delay: 0.1,
                    child: _MainPersonalityCard(
                      result: totalScore,
                      pulseAnimation: _pulseAnimation,
                      onInfoTap: () => _showInfoModal('personality'),
                      translateLabel: _translateScoreLabel,
                    ),
                  ),

                  const SizedBox(height: 20),

                  if (_showContent) ...[
                    // Risk Profile & Investment Goal
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.15,
                      child: _RiskAndGoalSection(
                        riskTolerance: answers.riskTolerance,
                        investingGoal: answers.investingGoal,
                        literacyLabel: literacy.label,
                        t: _t,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Interested Industries
                    if (answers.industriesInterested.isNotEmpty)
                      _AnimatedSlideIn(
                        controller: _mainController,
                        delay: 0.2,
                        child: _InterestsSection(
                          title: _t('interested_industries'),
                          icon: Icons.factory_outlined,
                          items: answers.industriesInterested,
                          getLabel: _getIndustryLabel,
                          getIcon: _getIndustryIcon,
                        ),
                      ),

                    const SizedBox(height: 16),

                    // Asset Classes
                    if (answers.assetClasses.isNotEmpty && !answers.assetClasses.contains('none'))
                      _AnimatedSlideIn(
                        controller: _mainController,
                        delay: 0.25,
                        child: _InterestsSection(
                          title: _t('asset_experience'),
                          icon: Icons.account_balance_wallet_outlined,
                          items: answers.assetClasses,
                          getLabel: _getAssetLabel,
                          getIcon: _getAssetIcon,
                        ),
                      ),

                    const SizedBox(height: 20),

                    // Score Cards (QIQT 0-100 System)
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.3,
                      child: _ScoreCard(
                        title: _t('investment_background'),
                        result: experience,
                        onInfoTap: () => _showInfoModal('personality'),
                        translateLabel: _translateScoreLabel,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.35,
                      child: _ScoreCard(
                        title: _t('financial_literacy'),
                        result: literacy,
                        onInfoTap: () => _showInfoModal('literacy'),
                        translateLabel: _translateScoreLabel,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.4,
                      child: _ScoreCard(
                        title: _t('objectives_motivation'),
                        result: motivation,
                        onInfoTap: () => _showInfoModal('strength'),
                        translateLabel: _translateScoreLabel,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.45,
                      child: _ScoreCard(
                        title: _getChallengeTitle(totalScore.label),
                        result: readiness,
                        onInfoTap: () => _showInfoModal('readiness'),
                        translateLabel: _translateScoreLabel,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Portfolio Suggestion
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.5,
                      child: _PortfolioCard(suggestion: portfolio, literacyLabel: literacy.label, t: _t),
                    ),

                    const SizedBox(height: 20),

                    // Portfolio Allocation
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.55,
                      child: _RoboAdvisorSection(
                        allocations: allocations,
                        personalityLabel: personality.label,
                        t: _t,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Action Buttons
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.6,
                      child: Row(
                        children: [
                          Expanded(
                            child: _ActionButton(
                              label: _t('share_results'),
                              icon: Icons.share_rounded,
                              isPrimary: false,
                              onTap: () => _shareResults(totalScore, experience, literacy, motivation, readiness, portfolio, allocations),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _ActionButton(
                              label: _t('start_trading'),
                              icon: _isArabic ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                              isPrimary: true,
                              onTap: () => Navigator.pushReplacementNamed(
                                context,
                                '/challenge-home',
                                arguments: {'language': _selectedLanguage},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _shareResults(
    ScoreResult totalScore,
    ScoreResult experience,
    ScoreResult literacy,
    ScoreResult motivation,
    ScoreResult readiness,
    PortfolioSuggestion portfolio,
    List<AssetAllocation> allocations,
  ) {
    final allocationText = allocations.map((a) => '${a.name}: ${a.percentage.toInt()}%').join(', ');
    final message = '''
🎯 My Quantrock QIQT Score: ${totalScore.score}/100

${totalScore.emoji} Classification: ${totalScore.label}

📊 Scores:
• Investment Background: ${experience.score}/${experience.maxScore}
• Financial Literacy: ${literacy.score}/${literacy.maxScore}
• Objectives & Motivation: ${motivation.score}/${motivation.maxScore}
• Learning Readiness: ${readiness.score}/${readiness.maxScore}

💼 Portfolio Allocation:
$allocationText

📈 Suggested Portfolio: ${portfolio.size}

Start your investment journey with Quantrock!
#Quantrock #Investing #Trading
''';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Share: $message'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Risk and Goal Section
class _RiskAndGoalSection extends StatelessWidget {
  final String? riskTolerance;
  final String? investingGoal;
  final String literacyLabel;
  final String Function(String) t;

  const _RiskAndGoalSection({
    required this.riskTolerance,
    required this.investingGoal,
    required this.literacyLabel,
    required this.t,
  });

  Color _getRiskColor(String? risk) {
    switch (risk) {
      case 'low':
        return const Color(0xFF22C55E);
      case 'medium':
        return const Color(0xFFF59E0B);
      case 'high':
        return const Color(0xFFEF4444);
      default:
        return Colors.grey;
    }
  }

  IconData _getGoalIcon(String? goal) {
    switch (goal) {
      case 'growth':
        return Icons.trending_up;
      case 'income':
        return Icons.attach_money;
      case 'protection':
        return Icons.shield;
      default:
        return Icons.flag;
    }
  }

  String _getGoalByLiteracy(String literacyLabel, String? investingGoal) {
    switch (literacyLabel) {
      case 'Beginner':
        return t('learn_challenge');
      case 'Intermediate':
        return t('28_days_skills');
      case 'Expert':
        return t('investment_challenge');
      default:
        return _getInvestingGoalLabel(investingGoal);
    }
  }

  String _getRiskByLiteracy(String literacyLabel) {
    switch (literacyLabel) {
      case 'Beginner':
        return t('low_risk');
      case 'Intermediate':
        return t('medium_risk');
      case 'Expert':
        return t('high_risk');
      default:
        return t('not_set');
    }
  }

  Color _getRiskColorByLiteracy(String literacyLabel) {
    switch (literacyLabel) {
      case 'Beginner':
        return const Color(0xFF22C55E);
      case 'Intermediate':
        return const Color(0xFFF59E0B);
      case 'Expert':
        return const Color(0xFFEF4444);
      default:
        return Colors.grey;
    }
  }

  String _getInvestingGoalLabel(String? goal) {
    switch (goal) {
      case 'capital_protection':
        return 'Capital Protection';
      case 'extra_income':
        return 'Extra Income';
      case 'capital_growth':
        return 'Capital Growth';
      case 'long_term_wealth':
        return 'Long-term Wealth';
      case 'short_term_speculation':
        return 'Short-term Trading';
      default:
        return 'Not specified';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Risk Profile
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _getRiskColorByLiteracy(literacyLabel).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.speed,
                        color: _getRiskColorByLiteracy(literacyLabel),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      t('risk_profile'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  _getRiskByLiteracy(literacyLabel),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: _getRiskColorByLiteracy(literacyLabel),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Investment Goal
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        (literacyLabel == 'Beginner' || literacyLabel == 'Intermediate' || literacyLabel == 'Advanced')
                            ? Icons.emoji_events
                            : _getGoalIcon(investingGoal),
                        color: const Color(0xFF8B5CF6),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      t('goal'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  _getGoalByLiteracy(literacyLabel, investingGoal),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8B5CF6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Interests Section (Industries & Assets)
class _InterestsSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> items;
  final String Function(String) getLabel;
  final IconData Function(String) getIcon;

  const _InterestsSection({
    required this.title,
    required this.icon,
    required this.items,
    required this.getLabel,
    required this.getIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.cyan, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyan.withValues(alpha: 0.3),
                      Colors.blue.withValues(alpha: 0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.cyan.withValues(alpha: 0.5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(getIcon(item), color: Colors.cyan, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      getLabel(item),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// Robo-Advisor Section
class _RoboAdvisorSection extends StatelessWidget {
  final List<AssetAllocation> allocations;
  final String personalityLabel;
  final String Function(String) t;

  const _RoboAdvisorSection({
    required this.allocations,
    required this.personalityLabel,
    required this.t,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E3A5F).withValues(alpha: 0.8),
            const Color(0xFF0F3460).withValues(alpha: 0.9),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.cyan.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D4FF), Color(0xFF0099FF)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.smart_toy, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t('portfolio_allocation'),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${t('optimized_for')} $personalityLabel',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.cyan.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Allocation Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 24,
              child: Row(
                children: allocations.map((allocation) {
                  return Expanded(
                    flex: allocation.percentage.toInt(),
                    child: Container(
                      color: allocation.color,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Allocation Details
          ...allocations.map((allocation) => _AllocationRow(allocation: allocation, t: t)),
        ],
      ),
    );
  }
}

class _AllocationRow extends StatefulWidget {
  final AssetAllocation allocation;
  final String Function(String) t;

  const _AllocationRow({required this.allocation, required this.t});

  @override
  State<_AllocationRow> createState() => _AllocationRowState();
}

class _AllocationRowState extends State<_AllocationRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.allocation.percentage / 100)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: widget.allocation.color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              widget.allocation.icon,
              color: widget.allocation.color,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.t(widget.allocation.name.toLowerCase()),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${widget.allocation.percentage.toInt()}%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: widget.allocation.color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _animation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.allocation.color,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: widget.allocation.color.withValues(alpha: 0.5),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Animated Slide In Widget
class _AnimatedSlideIn extends StatelessWidget {
  final AnimationController controller;
  final double delay;
  final Widget child;

  const _AnimatedSlideIn({
    required this.controller,
    required this.delay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final progress = ((controller.value - delay) / (1 - delay)).clamp(0.0, 1.0);
        final curved = Curves.easeOutCubic.transform(progress);

        return Opacity(
          opacity: curved,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - curved)),
            child: child,
          ),
        );
      },
    );
  }
}

// Main Personality Card
class _MainPersonalityCard extends StatelessWidget {
  final ScoreResult result;
  final Animation<double> pulseAnimation;
  final VoidCallback onInfoTap;
  final String Function(String)? translateLabel;

  const _MainPersonalityCard({
    required this.result,
    required this.pulseAnimation,
    required this.onInfoTap,
    this.translateLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            result.color.withValues(alpha: 0.4),
            result.color.withValues(alpha: 0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onInfoTap,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white.withValues(alpha: 0.7),
                  size: 20,
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: pulseAnimation.value,
                      child: Text(
                        result.emoji,
                        style: const TextStyle(fontSize: 64),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),

                Text(
                  translateLabel != null ? translateLabel!(result.label) : result.label,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: result.color,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '${result.score}/${result.maxScore}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Score Card
class _ScoreCard extends StatefulWidget {
  final String title;
  final ScoreResult result;
  final VoidCallback onInfoTap;
  final String Function(String)? translateLabel;

  const _ScoreCard({
    required this.title,
    required this.result,
    required this.onInfoTap,
    this.translateLabel,
  });

  @override
  State<_ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<_ScoreCard> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.result.score / widget.result.maxScore,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeOutCubic,
    ));

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _progressController.forward();
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: widget.onInfoTap,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white.withValues(alpha: 0.5),
                  size: 16,
                ),
              ),
            ),
          ),

          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: widget.result.color.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(widget.result.emoji, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.translateLabel != null ? widget.translateLabel!(widget.result.label) : widget.result.label,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: widget.result.color,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: AnimatedBuilder(
                              animation: _progressAnimation,
                              builder: (context, child) {
                                return FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: _progressAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: widget.result.color,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${widget.result.score}/${widget.result.maxScore}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: widget.result.color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Portfolio Card
class _PortfolioCard extends StatelessWidget {
  final PortfolioSuggestion suggestion;
  final String literacyLabel;
  final String Function(String) t;

  const _PortfolioCard({required this.suggestion, required this.literacyLabel, required this.t});

  String _getPortfolioByLiteracy() {
    switch (literacyLabel) {
      case 'Beginner':
        return '\$1,000 – \$5,000';
      case 'Intermediate':
        return '\$5,000 – \$10,000';
      case 'Expert':
        return '\$10,000 – \$50,000';
      default:
        return suggestion.size;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              Text(
                t('suggested_portfolio'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _getPortfolioByLiteracy(),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t('portfolio_description'),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.8),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// Action Button
class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF6366F1) : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isPrimary) Icon(icon, color: const Color(0xFF6366F1), size: 20),
            if (!isPrimary) const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isPrimary ? Colors.white : const Color(0xFF6366F1),
              ),
            ),
            if (isPrimary) const SizedBox(width: 8),
            if (isPrimary) Icon(icon, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

// Info Modal
class _InfoModal extends StatelessWidget {
  final InfoCategory category;

  const _InfoModal({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, color: Colors.grey.shade600, size: 24),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              itemCount: category.items.length,
              itemBuilder: (context, index) {
                final item = category.items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: item.color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(item.emoji, style: const TextStyle(fontSize: 24)),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.label,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: item.color,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Confetti
class _ConfettiParticle {
  final Color color;
  final double x;
  final double delay;
  final double speed;
  final double size;
  final double rotation;

  _ConfettiParticle({
    required this.color,
    required this.x,
    required this.delay,
    required this.speed,
    required this.size,
    required this.rotation,
  });
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> confetti;
  final double progress;

  _ConfettiPainter({required this.confetti, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in confetti) {
      final adjustedProgress = ((progress - particle.delay) / (1 - particle.delay)).clamp(0.0, 1.0);
      if (adjustedProgress <= 0) continue;

      final paint = Paint()
        ..color = particle.color.withValues(alpha: (1 - adjustedProgress) * 0.8)
        ..style = PaintingStyle.fill;

      final x = particle.x * size.width;
      final y = adjustedProgress * size.height * particle.speed;
      final wobble = math.sin(adjustedProgress * math.pi * 4) * 20;

      canvas.save();
      canvas.translate(x + wobble, y);
      canvas.rotate(particle.rotation + adjustedProgress * math.pi * 2);

      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: particle.size, height: particle.size * 0.6),
        const Radius.circular(2),
      );
      canvas.drawRRect(rect, paint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
