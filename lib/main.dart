import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vormirex/view/splash_screen.dart';
import 'package:vormirex/view/auth_screen/signin_signup_screen.dart';
import 'package:vormirex/view/basic_profile_setup_screen/basic_profile_setup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vormirex',
      home: SplashScreen(),
   
      // home: PaymentSuccessScreen(),
     
      // home: PaymentScreen(),
      // home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/LoginScreen', page: () => LoginScreen()),
        GetPage(name: '/SetupProfileScreen', page: () => SetupProfileScreen()),
      ],
    );
  }
}
