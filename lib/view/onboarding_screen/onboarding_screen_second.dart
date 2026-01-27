import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vormirex/view/utils/utils.dart';
import 'package:vormirex/view/onboarding_screen/onboarding_screen_third.dart';

class OnboardingScreenSecond extends StatelessWidget {
  const OnboardingScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 1),
              Container(
                width: screenWidth * 0.76,
                height: screenHeight * 0.35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/icons/human.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // RESPONSIVE OPTION 2: Min/Max constraints
              // Uncomment to use this approach
              // Container(
              //   width: screenWidth.clamp(250.0, 350.0),  // Between 250-350px
              //   height: screenHeight.clamp(300.0, 450.0), // Between 300-450px
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16),
              //     color: const Color(0xFF0A1628),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(16),
              //     child: Image.asset(
              //       'assets/images/onboarding_brain.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),

              // RESPONSIVE OPTION 3: Aspect ratio-based
              // Uncomment to use this approach
              // Container(
              //   width: screenWidth * 0.75,
              //   child: AspectRatio(
              //     aspectRatio: 3 / 4, // Width to height ratio
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         color: const Color(0xFF0A1628),
              //       ),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(16),
              //         child: Image.asset(
              //           'assets/images/onboarding_brain.png',
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: screenHeight * 0.03),

              Text(
                'Instant AI Guidance',
                textAlign: TextAlign.center,
                style: AppTextStyle.appText30White,
              ),

              SizedBox(height: screenHeight * 0.03),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Stuck on a problem? Your Vormirex AI tutor is available 24/7 to explain complex topics and guide you to the solution',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.appText14White,
                ),
              ),

              const Spacer(flex: 2),

              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.056,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const OnboardingScreenThird()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6aece1),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
