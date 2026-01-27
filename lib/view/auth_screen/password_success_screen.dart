import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ai_tutor/ai_tutor_screen.dart';

class PasswordResetSuccessScreen extends StatefulWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  State<PasswordResetSuccessScreen> createState() =>
      _PasswordResetSuccessScreenState();
}

class _PasswordResetSuccessScreenState extends State<PasswordResetSuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _checkmarkController;
  late AnimationController _rippleController;
  late Animation<double> _checkmarkAnimation;
  late Animation<double> _rippleAnimation;

  @override
  void initState() {
    super.initState();

    _checkmarkController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _checkmarkAnimation = CurvedAnimation(
      parent: _checkmarkController,
      curve: Curves.elasticOut,
    );

    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );

    _checkmarkController.forward();
    _rippleController.repeat();
  }
  
  @override
  void dispose() {
    _checkmarkController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Animated checkmark with ripple effect
              AnimatedBuilder(
                animation: _rippleAnimation,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer ripple
                      Container(
                        width: 200 + (_rippleAnimation.value * 100),
                        height: 200 + (_rippleAnimation.value * 100),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(
                            0xFF6aece1,
                          ).withOpacity(0.15 * (1 - _rippleAnimation.value)),
                        ),
                      ),
                      // Middle ripple
                      Container(
                        width: 150 + (_rippleAnimation.value * 80),
                        height: 150 + (_rippleAnimation.value * 80),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(
                            0xFF6aece1,
                          ).withOpacity(0.2 * (1 - _rippleAnimation.value)),
                        ),
                      ),
                      // Inner ripple
                      Container(
                        width: 120 + (_rippleAnimation.value * 60),
                        height: 120 + (_rippleAnimation.value * 60),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(
                            0xFF6aece1,
                          ).withOpacity(0.25 * (1 - _rippleAnimation.value)),
                        ),
                      ),
                      // Checkmark circle
                      ScaleTransition(
                        scale: _checkmarkAnimation,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF6aece1),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6aece1).withOpacity(0.5),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Color(0xFF252525),
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 60),

              // Title
              const Text(
                'Update Successful',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                'Password fixed. Let\'s vibe',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 2),

              // Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to AI Tutor screen
                    Get.to(() => const AITutorScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6aece1),
                    foregroundColor: const Color(0xFF252525),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: const Color(0xFF6aece1).withOpacity(0.5),
                  ),
                  child: const Text(
                    'Go to Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
