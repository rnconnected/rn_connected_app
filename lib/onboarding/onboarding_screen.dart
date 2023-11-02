import 'package:flutter/material.dart';
import 'onboarding_data.dart';
import 'onboarding_page.dart';
import '../registration/signup/registration_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required void Function() onOnboardingCompleted});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  List<OnboardingData> onboardingData = [
    OnboardingData(
      title: "Connections",
      description:
          "Empowers connection and collaboration through safe and secured real-time video, voice, and messaging solutions.",
      image: "assets/images/splash/1.png",
    ),
    OnboardingData(
      title: "Find Jobs",
      description:
          "Experience the ease of job hunting with our dedicated mobile platform, designed for nurses seeking to inspire, innovate and excel.",
      image: "assets/images/splash/2.png",
    ),
    OnboardingData(
      title: "Continuing Education",
      description:
          "Achieve your CEU requirements and more with our innovative app, where quality education meets lively networking.",
      image: "assets/images/splash/3.png",
    ),
    OnboardingData(
      title: "Recruit Nurses",
      description:
          "Streamline your recruitment process with our easy-to-navigate profile overviews, direct messaging capabilities, and insightful candidates recommendations.",
      image: "assets/images/splash/4.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(6, 77, 108, 0.992),
                    Color.fromRGBO(7, 12, 55, 0.938),
                  ],
                  stops: [0.1325, 0.5456], // Gradient stops
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: _currentPage < onboardingData.length
                  ? Image.asset(
                      onboardingData[_currentPage].image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                    )
                  : null,
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                data: onboardingData[index],
                isLastPage: index == onboardingData.length - 1,
                onGetStartedPressed: () {
                  if (_currentPage < onboardingData.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  } else {
                    // Handle Get Started action, e.g., navigate to the next screen or main app
                  }
                },
              );
            },
          ),
          Positioned(
            top: 20.0,
            left: 20.0,
            child: _currentPage > 0
                ? IconButton(
                    onPressed: () {
                      if (_currentPage > 0) {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  )
                : Container(),
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: TextButton(
              onPressed: () {
                // Navigate to the RegistrationPage
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegistrationPage(),
                ));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: onboardingData
                      .asMap()
                      .entries
                      .map((entry) => buildDot(entry.key))
                      .toList(),
                ),
                if (_currentPage < onboardingData.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: _currentPage == index
          ? 20.0
          : 10.0, // Adjust the width for the active dot
      height: 10.0, // Height of the dots
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(
            _currentPage == index ? 5.0 : 10.0), // Adjust the border radius
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
