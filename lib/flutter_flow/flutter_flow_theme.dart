import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  FlutterFlowTheme._();

  static FlutterFlowTheme of(BuildContext context) => FlutterFlowTheme._();

  // Colors
  Color get primaryBackground => const Color(0xFF0D0D1A);
  Color get primary => const Color(0xFF6C5CE7);
  Color get primaryText => const Color(0xFFFFFFFF);
  Color get secondaryText => const Color(0xFFB0B0CC);
  Color get secondaryBackground => const Color(0xFF161630);
  Color get alternate => const Color(0xFF2A2A4A);
  Color get tertiary => const Color(0xFFFFD93D);
  Color get onPrimary => const Color(0xFFFFFFFF);
  Color get error => const Color(0xFFFF5252);
  Color get success => const Color(0xFF00E676);
  Color get warning => const Color(0xFFFFAB40);
  Color get info => const Color(0xFF00D2FF);

  LinearGradient get primaryGradient => LinearGradient(
    colors: [primary, info],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Alpha variants
  Color get background60 => const Color(0xFF0D0D1A).withValues(alpha: 0.6);
  Color get background80 => const Color(0xFF0D0D1A).withValues(alpha: 0.8);
  Color get background20 => const Color(0xFF0D0D1A).withValues(alpha: 0.2);
  Color get primary27 => const Color(0xFF6C5CE7).withValues(alpha: 0.27);
  Color get primary50 => const Color(0xFF6C5CE7).withValues(alpha: 0.5);
  Color get primaryText80 => const Color(0xFFFFFFFF).withValues(alpha: 0.8);
  Color get surface40 => const Color(0xFF161630).withValues(alpha: 0.4);
  Color get onSurface => const Color(0xFFB0B0CC);
  Color get divider20 => const Color(0xFFFFFFFF).withValues(alpha: 0.12);
  Color get onError => const Color(0xFFFFFFFF);

  // Text styles
  TextStyle get displayLarge => GoogleFonts.outfit(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: primaryText,
      );

  TextStyle get displayMedium => GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: primaryText,
      );

  TextStyle get headlineLarge => GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: primaryText,
      );

  TextStyle get headlineMedium => GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  TextStyle get headlineSmall => GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  TextStyle get titleLarge => GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  TextStyle get titleMedium => GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  TextStyle get bodyLarge => GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: secondaryText,
      );

  TextStyle get bodyMedium => GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: secondaryText,
      );

  TextStyle get bodySmall => GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF6B6B8D),
      );

  TextStyle get labelLarge => GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: primaryText,
      );

  TextStyle get labelMedium => GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: secondaryText,
      );

  TextStyle get labelSmall => GoogleFonts.outfit(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF6B6B8D),
      );
}

// Extension to add .override() method to TextStyle
extension TextStyleOverride on TextStyle {
  TextStyle override({
    TextStyle? font,
    Color? color,
    double? fontSize,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: font?.fontFamily ?? fontFamily,
      fontSize: fontSize ?? font?.fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? font?.fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? font?.fontStyle ?? this.fontStyle,
      color: color ?? this.color,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      height: lineHeight ?? height,
      fontFamilyFallback: font?.fontFamilyFallback ?? fontFamilyFallback,
    );
  }
}
