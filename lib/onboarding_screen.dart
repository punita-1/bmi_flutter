import 'package:bmi_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingContent(),
    );
  }
}

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({super.key});

  @override
  _OnboardingContentState createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              buildOnboardingPage(
                image: 'assets/images/try_food.jpeg',
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              buildOnboardingPage(
                image: 'assets/images/try_food.jpeg',
                text: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              buildOnboardingPage(
                image: 'assets/images/try_food.jpeg',
                text: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Colors.blue,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (currentPage == 2) {
                    // Navigate to the next screen (e.g., home screen)
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(currentPage == 2 ? 'Get Started' : 'Next'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOnboardingPage({required String image, required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
