import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF00B4D8); // Cyan
  static const accentReady = Color(0xFF4CAF50); // Green
  static const accentRunning = Color(0xFF2196F3); // Blue
  static const accentError = Color(0xFFF44336); // Red
  static const accentWarning = Color(0xFFFF9800); // Orange

  static const darkBg = Color(0xFF0B090A);
  static const surface = Color(0xFF161A1D);
  static const cardBg = Color(0xFF1B1B1B);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      surface: surface,
      error: accentError,
    ),
    scaffoldBackgroundColor: darkBg,
    cardTheme: CardThemeData(
      color: cardBg,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.outfit(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      titleLarge: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 20),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
