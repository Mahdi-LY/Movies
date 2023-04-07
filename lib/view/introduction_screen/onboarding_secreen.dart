import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constants.dart';
import '../../route/approute.dart';
import 'page01.dart';

class OnboardingState_Secreen extends StatefulWidget {
  const OnboardingState_Secreen({super.key});
  @override
  State<OnboardingState_Secreen> createState() => _OnboardingState_Secreen();
}

class _OnboardingState_Secreen extends State<OnboardingState_Secreen> {
  @override
  void initState() {}
  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 70),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            intro01(),
            intro01(),
            intro01(),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.white,
                backgroundColor: Constants.kBlackColor,
                minimumSize: Size.fromHeight(60),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("ShowHome", true);
                Navigator.popAndPushNamed(context, AppRoute.loginpage);
              },
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 24),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _controller.jumpToPage(2),
                    child: const Text("Skip"),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
    );
  }
}
