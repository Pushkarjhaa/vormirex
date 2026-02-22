import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import 'package:vormirex/view/homescreen/homescreen.dart';
import 'package:vormirex/view/utils/url.dart';

class AuthController extends GetxController {
  // ─── Observables ────────────────────────────────────────────────────────────
  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;
  final RxBool isLoginSelected = true.obs;

  // ─── Text Controllers ────────────────────────────────────────────────────────
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // ─── Dispose ─────────────────────────────────────────────────────────────────
  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // ─── Toggle Helpers ──────────────────────────────────────────────────────────
  void toggleTab(bool isLogin) {
    isLoginSelected.value = isLogin;
    // Clear all fields on tab switch
    emailController.clear();
    passwordController.clear();
    fullNameController.clear();
    confirmPasswordController.clear();
  }

  void togglePasswordVisibility() =>
      obscurePassword.value = !obscurePassword.value;

  void toggleConfirmPasswordVisibility() =>
      obscureConfirmPassword.value = !obscureConfirmPassword.value;

  // ─── Email Validation ────────────────────────────────────────────────────────
  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // ─── Snackbars ───────────────────────────────────────────────────────────────
  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      duration: const Duration(seconds: 4),
    );
  }

  void _showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      duration: const Duration(seconds: 3),
    );
  }

  // ─── Save Login Data to SharedPreferences ────────────────────────────────────
  Future<void> _saveUserData({
    required String accessToken,
    required String userId,
    required String userName,
    required String userEmail,
    required String userRole,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('userId', userId);
    await prefs.setString('userName', userName);
    await prefs.setString('userEmail', userEmail);
    await prefs.setString('userRole', userRole);
    await prefs.setBool('isLoggedIn', true);
  }

  // ─── LOGIN API ────────────────────────────────────────────────────────────────
  // POST https://www.vormirex.com/api/auth/login
  // Body: { "email": "", "password": "" }
  // Response: { "success": true, "accessToken": "...", "user": { id, name, email, role } }
  Future<void> handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError('Please fill all fields');
      return;
    }
    if (!_validateEmail(email)) {
      _showError('Please enter a valid email address');
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        // Save token + user info in SharedPreferences
        await _saveUserData(
          accessToken: data['accessToken'] ?? '',
          userId: data['user']['id'] ?? '',
          userName: data['user']['name'] ?? '',
          userEmail: data['user']['email'] ?? '',
          userRole: data['user']['role'] ?? '',
        );

        isLoading.value = false;
        _showSuccess('Login successful! Welcome back.');
        Get.offAll(() => HomeScreen());
      } else {
        isLoading.value = false;
        _showError(data['message'] ?? 'Login failed. Please try again.');
      }
    } on http.ClientException {
      isLoading.value = false;
      _showError('Network error. Please check your connection.');
    } catch (e) {
      isLoading.value = false;
      _showError('Something went wrong. Please try again.');
    }
  }

  // ─── SIGNUP API ───────────────────────────────────────────────────────────────
  // POST https://www.vormirex.com/api/auth/signup
  // Body: { "name": "", "email": "", "password": "" }
  // Response: { "success": true, "message": "Signup successful. Please check your email..." }
  Future<void> handleSignup() async {
    final name = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty ||
        confirmPassword.isEmpty) {
      _showError('Please fill all fields');
      return;
    }
    if (!_validateEmail(email)) {
      _showError('Please enter a valid email address');
      return;
    }
    if (password.length < 6) {
      _showError('Password must be at least 6 characters');
      return;
    }
    if (password != confirmPassword) {
      _showError('Passwords do not match');
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(signupUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        isLoading.value = false;
        _showSuccess(
          data['message'] ??
              'Account created! Please verify your email before logging in.',
        );

        // Clear fields and switch back to Login tab
        fullNameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        isLoginSelected.value = true;
      } else {
        isLoading.value = false;
        _showError(data['message'] ?? 'Signup failed. Please try again.');
      }
    } on http.ClientException {
      isLoading.value = false;
      _showError('Network error. Please check your connection.');
    } catch (e) {
      isLoading.value = false;
      _showError('Something went wrong. Please try again.');
    }
  }
}