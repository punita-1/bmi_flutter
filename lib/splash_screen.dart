import 'package:bmi_flutter/onboarding_screen.dart';
import 'package:flutter/material.dart';
  // Make sure this import points to the correct path of your onboarding.dart

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a delay (e.g., loading resources or checking authentication)
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the onboarding screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ));
    });

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BMI',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              Text(
                'Calculator',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange.shade200),
              ),
            ],
          ),
        )
    );
  }
}
