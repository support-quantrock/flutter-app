import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'context/questionnaire_context.dart';
import 'pages/main_navigation.dart';
import 'pages/investor_profile.dart';
import 'pages/investor_results.dart';
import 'pages/skill_challenge_page.dart';
import 'pages/lesson_page.dart';
import 'pages/challenge_home_page.dart';
import 'pages/challenge_signup_page.dart';
import 'pages/dashboard_page.dart';
import 'services/qp_service.dart';
import 'state/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await QPService().init();

  // Initialize stream-based state management
  await appStore.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionnaireProvider(),
      child: MaterialApp(
        title: 'Quantrock',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MainNavigation(),
          '/questionnaire': (context) => const InvestorProfilePage(),
          '/skill-challenge': (context) => const SkillChallengePage(),
          '/dashboard': (context) => const DashboardPage(),
          '/investor-results': (context) => const InvestorResultsPage(),
          '/challenge-home': (context) => const ChallengeHomePage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/lesson') {
            final args = settings.arguments as Map<String, dynamic>?;
            final day = args?['day'] as int? ?? 1;
            final lessonNumber = args?['lessonNumber'] as int? ?? 1;
            return MaterialPageRoute(
              builder: (context) => LessonPage(day: day, lessonNumber: lessonNumber),
            );
          }
          if (settings.name == '/challenge-signup') {
            final args = settings.arguments as Map<String, dynamic>?;
            final mode = args?['mode'] as String? ?? 'free';
            return MaterialPageRoute(
              builder: (context) => ChallengeSignupPage(mode: mode),
            );
          }
          return null;
        },
      ),
    );
  }
}

