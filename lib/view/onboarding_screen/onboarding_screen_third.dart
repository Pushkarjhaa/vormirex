import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vormirex/view/utils/utils.dart';
import 'package:vormirex/view/auth_screen/login_signup_screen.dart';
import 'package:vormirex/view/basic_profile_setup_screen/basic_profile_setup_screen.dart';

class OnboardingScreenThird extends StatelessWidget {
  const OnboardingScreenThird({Key? key}) : super(key: key);

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

              
              SizedBox(height: screenHeight * 0.03),

              Text(
                'Watch Yourself Grow',
                textAlign: TextAlign.center,
                style: AppTextStyle.appText30White,
              ),

              SizedBox(height: screenHeight * 0.03),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Our AI analytics provide deep insights into your learning curve, helping you focus on what matters most.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.appText14White,
                ),
              ),

              const Spacer(flex: 2),

              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.056,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
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
                        'Get Started',
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
