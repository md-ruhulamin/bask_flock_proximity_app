import 'package:flutter/material.dart';

class MedicalTheme {
  // --- Color Palette ---
  static const Color scaffoldBg = Color(0xFF0B0F1A);
  static const Color surface = Color(0xFF161B22); // Main container cards
  static const Color surfaceLight = Color(0xFF21262D); // Inner filled cards
  static const Color accentBlue = Color(0xFF1A6DFF);
  static const Color accentOrange = Color(0xFFFFA726);
  static const Color accentRed = Color(0xFFEF5350);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;
  static const Color borderSubtle = Color(0xFF30363D);

  // --- Gradient Definitions ---
  static const LinearGradient profileGradient = LinearGradient(
    colors: [Color(0xFF1A2233), Color(0xFF0F1724)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient actionGradient = LinearGradient(
    colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // --- The Theme Data Object ---
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: scaffoldBg,
    primaryColor: accentBlue,
    
    // Default Card Theme
    cardTheme: CardThemeData(
      color: surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
    ),

    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
    ),

    // Text Theme
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: textPrimary, fontSize: 20, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(color: textSecondary, fontSize: 14),
      labelSmall: TextStyle(color: accentBlue, fontSize: 12, fontWeight: FontWeight.bold),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: textSecondary.withOpacity(0.2),
      thickness: 1,
    ),
  );
}