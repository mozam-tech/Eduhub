import 'package:flutter/material.dart';
import 'screens/brand_splash_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/loading.dart'; // Make sure this file exists and has LoadingSplashScreen class
import 'screens/login_screen.dart';
import 'screens/homescreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 🗺️ Route map
      initialRoute: '/home: const HomeScreen()',
      routes: {
        '/': (context) => const BrandSplashScreen(),
        '/splash': (context) => const SplashScreen(),
        '/loading': (context) => const LoadingSplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
