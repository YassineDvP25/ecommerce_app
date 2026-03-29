import 'package:flutter/material.dart';

/// Application Color Constants
class AppColors2 {
  AppColors2._();

  // Flutter built-in aliases
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color white54 = Colors.white54;
  static const Color white70 = Colors.white70;
  static const Color black = Colors.black;
  static const Color black12 = Colors.black12;
  static const Color black87 = Colors.black87;
  static const Color blue = Colors.blue;
  static const Color deepPurple = Colors.deepPurple;
  static const Color green = Colors.green;
  static const Color grey = Colors.grey;
  static const Color orange = Colors.orange;
  static const Color red = Colors.red;
  static const Color redAccent = Colors.redAccent;
  static const Color yellow = Colors.yellow;

  // App branding colors
  static const Color primary = Color(0xFF667EEA);
  static const Color primaryDark = Color(0xFF5A67D8);
  static const Color primaryLight = Color(0xFF7C8FFF);
  static const Color secondary = Color(0xFF764BA2);
  static const Color secondaryDark = Color(0xFF6B4190);
  static const Color secondaryLight = Color(0xFF8B5BB5);
  static const Color accent = Color(0xFFF093FB);
  static const Color accentDark = Color(0xFFE080E8);
  static const Color accentLight = Color(0xFFFFB3FF);

  // Background & surfaces
  static const Color background = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF16213E);
  static const Color scaffoldBackground = Color(0xFFF5F5F5);
  static const Color scaffoldBackgroundAlt = Color(0xFFF3F3F3);
  static const Color cardBackground = Color(0xFFF2F2F2);
  static const Color overlayBackground = Color(0xFFF5F6F7);

  // Text colors
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color textLight = Color(0xFFB2BEC3);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF000000);

  // Status
  static const Color success = Color(0xFF00B894);
  static const Color warning = Color(0xFFFDAA5D);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF74B9FF);

  // Borders + dividers
  static const Color border = Color(0xFFDFE6E9);
  static const Color divider = Color(0xFFECF0F1);
  static const Color darkBorder = Color(0xFF606060);

  // Additional colors used in templates
  static const Color accentRed = Color(0xFFDB4437);
  static const Color deepBlue = Color(0xFF0F2A75);
  static const Color midTeal = Color(0xFF2D8C9F);
  static const Color brightGreen = Color(0xFF4CD964);
  static const Color peach = Color(0xFFFF5A28);
  static const Color darkGrey = Color(0xFF1F2024);
  static const Color midGrey = Color(0xFF3F3F3F);
  static const Color darkText = Color(0xFF1E1E1E);
  static const Color charcoal = Color(0xFF2A2B2B);
  static const Color blackHard = Color(0xFF101111);
  static const Color veryLight = Color(0xFFF5F6F7);

  // Helpers
  static Color black05 = Colors.black.withOpacity(0.05);
  static Color black10 = Colors.black.withOpacity(0.1);
  static Color black20 = Colors.black.withOpacity(0.2);
  static Color white08 = Colors.white.withOpacity(0.08);
  static Color white02 = Colors.white.withOpacity(0.2);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, Color(0xFFF5576C)],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [backgroundDark, surfaceDark],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
  );
}
