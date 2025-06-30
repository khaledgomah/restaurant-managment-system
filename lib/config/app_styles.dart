import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_fonts.dart';

class AppStyles {
  static TextStyle bold12() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      letterSpacing: .5
    );
  }

  static TextStyle bold14() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  static TextStyle bold16() {
    return TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

  static TextStyle bold20() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  static TextStyle medium12() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
  }

  static TextStyle medium14() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  static TextStyle medium16() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  static TextStyle regular12() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  static TextStyle regular16() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
  }

  static TextStyle regular20() {
    return const TextStyle(
      fontFamily: AppFonts.fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    );
  }
}
