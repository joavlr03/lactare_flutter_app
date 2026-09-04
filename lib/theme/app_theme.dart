// =============================================================================
// CONFIGURAÇÃO TEMA E APLICATIVO
// =============================================================================
import 'package:flutter/material.dart';
import 'package:lactare_flutter_app/screens/admindashboard_screen.dart';
import 'package:lactare_flutter_app/screens/home_screen.dart';
import 'package:lactare_flutter_app/screens/impact_screen.dart';
import 'package:lactare_flutter_app/screens/login_screen.dart';
import 'package:lactare_flutter_app/screens/quiz_screen.dart';
import 'package:lactare_flutter_app/screens/scheduling_screen.dart';
import 'package:lactare_flutter_app/screens/splash_screen.dart';
import 'package:lactare_flutter_app/screens/support_screen.dart';
import 'package:lactare_flutter_app/screens/tracking_screen.dart';

class LactareApp extends StatelessWidget {
  const LactareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lactare Eurofarma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF3B6B),
          primary: const Color(0xFFFF3B6B),
          secondary: const Color(0xFF2563EB),
          surface: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.08),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8FAFC),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: Color(0xFF0F172A)),
          titleTextStyle: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF1F5F9),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFFF3B6B), width: 1.5),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/scheduling': (context) => const SchedulingScreen(),
        '/tracking': (context) => const TrackingScreen(),
        '/impact': (context) => const ImpactScreen(),
        '/support': (context) => const SupportScreen(),
        '/admin': (context) => const AdminDashboardScreen(),
      },
    );
  }
}
