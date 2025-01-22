import 'package:crypto_app/Views/HomeScreen/HomeScreen.dart';
import 'package:crypto_app/Views/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         home: SplashScreen(),
    );
  }
}

