import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); //Explanation: This class is not meant to be instantiated or extended; this constructor prevents instantiation and extension.

  // คือ constructor แบบ private ที่ใช้กันบ่อยใน class ที่เก็บค่า constant 
  // เช่น colors, fonts, sizes เพื่อไม่ให้สร้าง object โดยไม่จำเป็น และให้เรียกใช้งานผ่านชื่อ class โดยตรง เช่น AppColors.primary
  // AppColors colors = AppColors();

  // Main Colors
  static const Color primary = Color(0xFF1565C0);
  static const Color secondary = Color(0xFF00ACC1);
  static const Color accent = Color(0xFFFFB300);

  // Background Colors
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF43A047);
  static const Color warning = Color(0xFFFFA000);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF1E88E5);

  // Border / Divider
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFBDBDBD);

  // Dark Mode
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
}