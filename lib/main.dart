import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding/onboarding_screen.dart'; // Update the import path
import 'registration/login/Login_page.dart'; // Import your login screen

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showOnboarding = true;

  @override
  void initState() {
    super.initState();
    checkIfOnboardingShown();
  }

  Future<void> checkIfOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingShown = prefs.getBool('onboardingShown') ?? false;

    if (onboardingShown) {
      // Onboarding screen has been shown before, navigate to login screen
      setState(() {
        showOnboarding = false;
      });
    }
  }

  void markOnboardingAsShown() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingShown', true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showOnboarding
          ? OnboardingScreen(onOnboardingCompleted: markOnboardingAsShown)
          : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
