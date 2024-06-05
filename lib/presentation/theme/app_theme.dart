import 'package:app_web/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 5,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black12,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        color: AppColors.darkCharcoal,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AppColors.darkCharcoal,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    ),
  );
}
