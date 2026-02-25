import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const HousingApp());
}

class HousingApp extends StatelessWidget {
  const HousingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
