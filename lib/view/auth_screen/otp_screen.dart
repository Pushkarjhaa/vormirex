// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'change_password_screen.dart';

// class VerifyIdentityScreen extends StatefulWidget {
//   const VerifyIdentityScreen({super.key});

//   @override
//   State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
// }

// class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
//   final List<TextEditingController> _controllers = List.generate(
//     6,
//     (index) => TextEditingController(),
//   );
//   final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var node in _focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }

//   void _onChanged(String value, int index) {
//     if (value.isNotEmpty && index < 5) {
//       _focusNodes[index + 1].requestFocus();
//     }
//   }

//   void _onBackspace(int index) {
//     if (index > 0) {
//       _controllers[index].clear();
//       _focusNodes[index - 1].requestFocus();
//     }
//   }

//   void _verify() {
//     // Handle verification logic here
//     Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePasswordScreen()));
//   }

//   void _resendOTP() {
//     // Handle resend OTP logic here
//     print('Resending OTP');
//     // Clear all fields
//     for (var controller in _controllers) {
//       controller.clear();
//     }
//     _focusNodes[0].requestFocus();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF252525),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const SizedBox(height: 80),
//                 Center(
//                   child: Container(
//                     width: 45, 
//                     height: 45,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF6aece1).withOpacity(0.7),
//                           blurRadius: 25,
//                           spreadRadius: 15,
//                         ),
//                       ],
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: const Color(0xFF6aece1).withOpacity(0.07),
//                       ),
//                       child: Image.asset("assets/icons/verify.png"),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 50),

//                 // Title
//                 const Text(
//                   'Verify Your Identity',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     letterSpacing: -0.5,
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 // Subtitle
//                 Text(
//                   'Enter the 6-digit code sent to',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white.withOpacity(0.6),
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),

//                 const SizedBox(height: 4),

//                 Text(
//                   'email@gmail.com',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white.withOpacity(0.7),
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),

//                 const SizedBox(height: 50),

//                 // OTP Input Boxes
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(6, (index) => _buildOTPBox(index)),
//                 ),

//                 const SizedBox(height: 40),

//                 // Resend OTP Button
//                 TextButton(
//                   onPressed: _resendOTP,
//                   child: const Text(
//                     'Resend OTP',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFF6aece1),
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 // Verify Button
//                 ElevatedButton(
//                   onPressed:
//                    _verify,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF6aece1),
//                     foregroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(vertical: 18),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: const Text(
//                     'Verify',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 0.5,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOTPBox(int index) {
//     return Container(
//       width: 50,
//       height: 60,
//       decoration: BoxDecoration(
//         color: Color(0xFF1A1A1A),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: const Color(0xFF6aece1).withOpacity(0.3),
//           width: 2,
//         ),
//       ),
//       child: TextField(
//         controller: _controllers[index],
//         focusNode: _focusNodes[index],
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         style: const TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         decoration: const InputDecoration(
//           counterText: '',
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.zero,
//         ),
//         inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//         onChanged: (value) => _onChanged(value, index),
//         onTap: () {
//           // Clear the field when tapped for easier input
//           _controllers[index].selection = TextSelection.fromPosition(
//             TextPosition(offset: _controllers[index].text.length),
//           );
//         },
//         onEditingComplete: () {
//           if (index < 5) {
//             _focusNodes[index + 1].requestFocus();
//           } else {
//             _focusNodes[index].unfocus();
//           }
//         },
//       ),
//     );
//   }
// }
