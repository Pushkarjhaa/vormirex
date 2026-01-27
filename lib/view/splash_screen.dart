import 'package:flutter/material.dart';
import 'package:vormirex/view/utils/utils.dart';
import 'package:vormirex/view/onboarding_screen/onboarding_screen_first.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreenFirst()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/app.png',
              height: screenHeight * 0.3,
              width: screenWidth * 0.3,
            ),
            Transform.translate(
              offset: const Offset(0, -20),
              child: const Text(
                'VORMIREX',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 2,
                  height: 0.8,
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.005),
            Text(
              'Personalised Learning AI',
              style: AppTextStyle.appText14White,
            ),
          ],
        ),
      ),
    );
  }
}
