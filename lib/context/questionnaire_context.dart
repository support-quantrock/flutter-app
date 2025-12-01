import 'package:flutter/material.dart';

class QuestionnaireAnswers {
  // Section 1: Personal Information & Investment Background
  String? gender;
  String? timeCommitment;
  String? ageRange;
  String? hasInvestmentAccount;
  String? hasActivePortfolio;
  String? portfolioSize;
  int? stocksKnowledge;
  int? riskManagementKnowledge;
  int? technicalAnalysisKnowledge;
  int? portfolioDiversificationKnowledge;
  List<String> assetClasses;
  String? chartReadingComfort;
  String? investmentTimeHorizon;

  // Section 2: Financial Literacy & Personal Readiness
  String? marketRiskUnderstanding;
  String? savingHabit;
  String? hasEmergencySavings;
  String? retirementPlanning;
  String? riskTolerance;

  // Section 3: Investment Objectives & User Motivation
  String? investingGoal;
  String? quantrockGoal;
  List<String> industriesInterested;

  // Section 4: Learning Readiness & Portfolio Preferences
  String? investmentReadinessText;
  String? passiveIncomeKnowledgeText;
  String? preferredPortfolioSize;

  // Legacy fields (kept for compatibility)
  String? educationLevel;
  String? monthlyIncome;
  String? incomeStability;
  String? incomeSource;
  List<String> currentDebts;
  String? investmentKnowledge;
  String? investmentTimeline;
  String? portfolioDropResponse;
  String? marketFluctuationImpact;
  String? riskAttitude;
  String? financialStressFrequency;
  int? investmentReadiness;
  int? passiveIncomeKnowledge;
  String? completedAt;
  Map<String, dynamic>? selectedAsset;

  QuestionnaireAnswers({
    this.gender,
    this.timeCommitment,
    this.ageRange,
    this.hasInvestmentAccount,
    this.hasActivePortfolio,
    this.portfolioSize,
    this.stocksKnowledge,
    this.riskManagementKnowledge,
    this.technicalAnalysisKnowledge,
    this.portfolioDiversificationKnowledge,
    List<String>? assetClasses,
    this.chartReadingComfort,
    this.investmentTimeHorizon,
    this.marketRiskUnderstanding,
    this.savingHabit,
    this.hasEmergencySavings,
    this.retirementPlanning,
    this.riskTolerance,
    this.investingGoal,
    this.quantrockGoal,
    List<String>? industriesInterested,
    this.investmentReadinessText,
    this.passiveIncomeKnowledgeText,
    this.preferredPortfolioSize,
    this.educationLevel,
    this.monthlyIncome,
    this.incomeStability,
    this.incomeSource,
    List<String>? currentDebts,
    this.investmentKnowledge,
    this.investmentTimeline,
    this.portfolioDropResponse,
    this.marketFluctuationImpact,
    this.riskAttitude,
    this.financialStressFrequency,
    this.investmentReadiness,
    this.passiveIncomeKnowledge,
    this.completedAt,
    this.selectedAsset,
  })  : currentDebts = currentDebts ?? [],
        assetClasses = assetClasses ?? [],
        industriesInterested = industriesInterested ?? [];
}

class QuestionnaireProvider extends ChangeNotifier {
  QuestionnaireAnswers _answers = QuestionnaireAnswers();

  QuestionnaireAnswers get answers => _answers;

  void setAnswer(String key, dynamic value) {
    switch (key) {
      // Section 1: Personal Information & Investment Background
      case 'gender':
        _answers.gender = value;
        break;
      case 'timeCommitment':
        _answers.timeCommitment = value;
        break;
      case 'ageRange':
        _answers.ageRange = value;
        break;
      case 'hasInvestmentAccount':
        _answers.hasInvestmentAccount = value;
        break;
      case 'hasActivePortfolio':
        _answers.hasActivePortfolio = value;
        break;
      case 'portfolioSize':
        _answers.portfolioSize = value;
        break;
      case 'stocksKnowledge':
        _answers.stocksKnowledge = value;
        break;
      case 'riskManagementKnowledge':
        _answers.riskManagementKnowledge = value;
        break;
      case 'technicalAnalysisKnowledge':
        _answers.technicalAnalysisKnowledge = value;
        break;
      case 'portfolioDiversificationKnowledge':
        _answers.portfolioDiversificationKnowledge = value;
        break;
      case 'assetClasses':
        _answers.assetClasses = List<String>.from(value);
        break;
      case 'chartReadingComfort':
        _answers.chartReadingComfort = value;
        break;
      case 'investmentTimeHorizon':
        _answers.investmentTimeHorizon = value;
        break;
      // Section 2: Financial Literacy & Personal Readiness
      case 'marketRiskUnderstanding':
        _answers.marketRiskUnderstanding = value;
        break;
      case 'savingHabit':
        _answers.savingHabit = value;
        break;
      case 'hasEmergencySavings':
        _answers.hasEmergencySavings = value;
        break;
      case 'retirementPlanning':
        _answers.retirementPlanning = value;
        break;
      case 'riskTolerance':
        _answers.riskTolerance = value;
        break;
      // Section 3: Investment Objectives & User Motivation
      case 'investingGoal':
        _answers.investingGoal = value;
        break;
      case 'quantrockGoal':
        _answers.quantrockGoal = value;
        break;
      case 'industriesInterested':
        _answers.industriesInterested = List<String>.from(value);
        break;
      // Section 4: Learning Readiness & Portfolio Preferences
      case 'investmentReadinessText':
        _answers.investmentReadinessText = value;
        break;
      case 'passiveIncomeKnowledgeText':
        _answers.passiveIncomeKnowledgeText = value;
        break;
      case 'preferredPortfolioSize':
        _answers.preferredPortfolioSize = value;
        break;
      // Legacy fields
      case 'educationLevel':
        _answers.educationLevel = value;
        break;
      case 'monthlyIncome':
        _answers.monthlyIncome = value;
        break;
      case 'incomeStability':
        _answers.incomeStability = value;
        break;
      case 'incomeSource':
        _answers.incomeSource = value;
        break;
      case 'currentDebts':
        _answers.currentDebts = List<String>.from(value);
        break;
      case 'investmentKnowledge':
        _answers.investmentKnowledge = value;
        break;
      case 'investmentTimeline':
        _answers.investmentTimeline = value;
        break;
      case 'portfolioDropResponse':
        _answers.portfolioDropResponse = value;
        break;
      case 'marketFluctuationImpact':
        _answers.marketFluctuationImpact = value;
        break;
      case 'riskAttitude':
        _answers.riskAttitude = value;
        break;
      case 'financialStressFrequency':
        _answers.financialStressFrequency = value;
        break;
      case 'investmentReadiness':
        _answers.investmentReadiness = value;
        break;
      case 'passiveIncomeKnowledge':
        _answers.passiveIncomeKnowledge = value;
        break;
      case 'completedAt':
        _answers.completedAt = value;
        break;
      case 'selectedAsset':
        _answers.selectedAsset = value;
        break;
    }
    notifyListeners();
  }

  void reset() {
    _answers = QuestionnaireAnswers();
    notifyListeners();
  }
}
