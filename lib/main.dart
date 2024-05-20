import 'package:exam2/pages/entries_pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const RealEstate());

class RealEstate extends StatelessWidget {
  const RealEstate({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}