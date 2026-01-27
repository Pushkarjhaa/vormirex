import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vormirex/view/splash_screen.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}
