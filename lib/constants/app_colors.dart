import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); //Explanation: This class is not meant to be instantiated or extended; this constructor prevents instantiation and extension.

  // คือ constructor แบบ private ที่ใช้กันบ่อยใน class ที่เก็บค่า constant 
  // เช่น colors, fonts, sizes เพื่อไม่ให้สร้าง object โดยไม่จำเป็น และให้เรียกใช้งานผ่านชื่อ class โดยตรง เช่น AppColors.primary
  // AppColors colors = AppColors();

  // Main Colors
  static const Color primary = Color.fromARGB(255, 21, 101, 192);
  static const Color secondary = Color.fromARGB(255, 0, 172, 193);
  static const Color accent = Color.fromARGB(255, 255, 179, 0);

  // Background Colors
  static const Color background = Color.fromARGB(255, 245, 247, 250);
  static const Color surface = Color.fromARGB(255, 255, 255, 255);
  static const Color card = Color.fromARGB(255, 255, 255, 255);

  // Text Colors
  static const Color textPrimary = Color.fromARGB(255, 0, 0, 0);
  static const Color textSecondary = Color.fromARGB(255, 0, 0, 0);
  static const Color textLight = Color.fromARGB(255, 0, 0, 0);

  // Status Colors
  static const Color success = Color.fromARGB(255, 67, 160, 71);
  static const Color warning = Color.fromARGB(255, 255, 160, 0);
  static const Color error = Color.fromARGB(255, 229, 57, 53);
  static const Color info = Color.fromARGB(255, 30, 136, 229);

  // Border / Divider
  static const Color border = Color.fromARGB(255, 224, 224, 224);
  static const Color divider = Color.fromARGB(255, 189, 189, 189);

  // Dark Mode
  static const Color darkBackground = Color.fromARGB(255, 18, 18, 18);
  static const Color darkSurface = Color.fromARGB(255, 30, 30, 30);
}