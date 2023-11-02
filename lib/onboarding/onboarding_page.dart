import 'package:flutter/material.dart';
import 'onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final bool isLastPage;
  final VoidCallback onGetStartedPressed;

  const OnboardingPage({
    Key? key,
    required this.data,
    required this.isLastPage,
    required this.onGetStartedPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Align children at the top
      children: [
        const SizedBox(height: 230.0), // Add top padding to the title
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0), // Add left and right padding to the title
          child: Text(
            data.title,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0), // Add left and right padding to the description
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}
