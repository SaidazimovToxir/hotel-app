import 'package:exam2/pages/entries_pages/splash_screen.dart';
import 'package:exam2/pages/home_pages/filter_page.dart';
import 'package:exam2/pages/home_pages/home_page.dart';
import 'package:exam2/pages/main_controller_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const RealEstate());

class RealEstate extends StatelessWidget {
  const RealEstate({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainControllerPage(),
    );
  }
}

