import 'package:exam2/utils/my_colors.dart';
import 'package:flutter/material.dart';

class MyStyles {
  
  static textStyle(bool checkColors) {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: checkColors ? MyColors.mainBlueColor : null,
    );
  }
}
