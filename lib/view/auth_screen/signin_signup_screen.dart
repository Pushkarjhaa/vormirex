import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vormirex/controllers/auth_controller/SingIn_signup_controller.dart';


import 'package:vormirex/view/auth_screen/forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Logo + Title ─────────────────────────────────────────────
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/app.png',
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.25,
                    ),
                    Transform.translate(
                      offset: const Offset(0, -20),
                      child: const Text(
                        'VORMIREX',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 2,
                          height: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Your personal AI tutor, unlocking\nyour potential.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // ── Login / Sign Up Toggle ────────────────────────────────────
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _TabButton(
                        label: 'Log In',
                        isSelected: controller.isLoginSelected.value,
                        onTap: () => controller.toggleTab(true),
                      ),
                      _TabButton(
                        label: 'Sign Up',
                        isSelected: !controller.isLoginSelected.value,
                        onTap: () => controller.toggleTab(false),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // ── LOGIN FORM ────────────────────────────────────────────────
                if (controller.isLoginSelected.value) ...[
                  _buildLabel('Email Address'),
                  const SizedBox(height: 12),
                  _InputContainer(
                    icon: Icons.email,
                    child: TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'name@example.com',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildLabel('Password'),
                  const SizedBox(height: 12),
                  _InputContainer(
                    icon: Icons.lock,
                    trailing: IconButton(
                      onPressed: controller.togglePasswordVisibility,
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: '••••••',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          Get.to(() => ForgotPasswordScreen()),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6aece1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                // ── SIGNUP FORM ───────────────────────────────────────────────
                ] else ...[
                  _buildLabel('Full Name'),
                  const SizedBox(height: 12),
                  _InputContainer(
                    icon: Icons.person,
                    child: TextField(
                      controller: controller.fullNameController,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'Enter your full name',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildLabel('Email Address'),
                  const SizedBox(height: 12),
                  _InputContainer(
                    icon: Icons.email,
                    child: TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'name@example.com',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildLabel('Password'),
                  const SizedBox(height: 12),
                  _InputContainer(
                    icon: Icons.lock,
                    trailing: IconButton(
                      onPressed: controller.togglePasswordVisibility,
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: '••••••',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildLabel('Confirm Password'),
                  const SizedBox(height: 12),
                  _InputContainer(
                    icon: Icons.lock,
                    trailing: IconButton(
                      onPressed: controller.toggleConfirmPasswordVisibility,
                      icon: Icon(
                        controller.obscureConfirmPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    child: TextField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.obscureConfirmPassword.value,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: '••••••',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],

                SizedBox(height: screenHeight * 0.02),

                // ── Action Button ─────────────────────────────────────────────
                Container(
                  height: screenHeight * 0.060,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6aece1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: controller.isLoading.value
                          ? null
                          : (controller.isLoginSelected.value
                              ? controller.handleLogin
                              : controller.handleSignup),
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 2,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.isLoginSelected.value
                                        ? 'Log In'
                                        : 'Create Account',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // ── OR Divider ────────────────────────────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 1,
                          color: Colors.white.withOpacity(0.2)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR CONTINUE WITH',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.5),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          height: 1,
                          color: Colors.white.withOpacity(0.2)),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ── Google Button ─────────────────────────────────────────────
                Container(
                  height: screenHeight * 0.056,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3E6B6B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // TODO: Google sign-in
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icons/google_icon.png'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.7),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

// ─── Private helper widgets ───────────────────────────────────────────────────

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF3E6B6B)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputContainer extends StatelessWidget {
  final IconData icon;
  final Widget child;
  final Widget? trailing;

  const _InputContainer({
    required this.icon,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.5), size: 24),
          const SizedBox(width: 16),
          Expanded(child: child),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}