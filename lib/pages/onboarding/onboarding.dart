import 'package:bazar/pages/auth/login/login.dart';
import 'package:bazar/pages/onboarding/widgets/first.dart';
import 'package:bazar/pages/onboarding/widgets/secound.dart';
import 'package:bazar/pages/onboarding/widgets/therd.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 580,
            child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const FirstStep();
                    case 1:
                      return const SecoundStep();
                    case 2:
                      return const TherdStep();
                  }
                  return const SizedBox();
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: pageIndex,
                count: 3,
                effect: const WormEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Color(0xFF54408C)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
            width: MediaQuery.sizeOf(context).width,
            height: 56,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    backgroundColor: const Color(0xFF54408C)),
                onPressed: () {
                  pageIndex = pageIndex + 1;
                  pageController.nextPage(
                      duration: const Duration(seconds: 0),
                      curve: Curves.easeInExpo);
                  setState(() {});
                },
                child: Center(
                    child: Text(
                        pageIndex == 0 || pageIndex == 1
                            ? "Continue"
                            : "Get Started",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)))),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 24, right: 24),
            width: MediaQuery.sizeOf(context).width,
            height: 56,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    backgroundColor: const Color(0xFFF9F8FC)),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage())),
                child: const Center(
                    child: Text("Sign in",
                        style: TextStyle(
                            color: Color(0xFF54408C),
                            fontWeight: FontWeight.w700,
                            fontSize: 16)))),
          )
        ],
      ),
    ));
  }
}
