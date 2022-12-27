// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color grayDark;
  late Color dark900;
  late Color background;
  late Color grayIcon;
  late Color tertiary;
  late Color primaryBtnText;
  late Color lineColor;
  late Color gray200;
  late Color gray600;
  late Color black600;
  late Color tertiary400;
  late Color textColor;
  late Color spaceCadet;
  late Color tealBlue;
  late Color illuminatingEmerald;
  late Color cambridgeBlue;
  late Color flax;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF4B39EF);
  late Color secondaryColor = const Color(0xFFEE8B60);
  late Color tertiaryColor = const Color(0xFFFFFFFF);
  late Color alternate = const Color(0xFF39D2C0);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF090F13);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color grayDark = Color(0xFF616E78);
  late Color dark900 = Color(0xFFFFFFFF);
  late Color background = Color(0xFFF1F4F8);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color tertiary = Color(0xFF39D2C0);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color gray200 = Color(0xFFDBE2E7);
  late Color gray600 = Color(0xFF262D34);
  late Color black600 = Color(0xFF090F13);
  late Color tertiary400 = Color(0xFF39D2C0);
  late Color textColor = Color(0xFF1E2429);
  late Color spaceCadet = Color(0xFF222E50);
  late Color tealBlue = Color(0xFF007991);
  late Color illuminatingEmerald = Color(0xFF439A86);
  late Color cambridgeBlue = Color(0xFFBCD8C1);
  late Color flax = Color(0xFFE9D985);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lexend Deca';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  String get title2Family => 'Lexend Deca';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  String get title3Family => 'Lexend Deca';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.tertiary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  String get subtitle1Family => 'Lexend Deca';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Lexend Deca';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Lexend Deca';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Lexend Deca';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF4B39EF);
  late Color secondaryColor = const Color(0xFFEE8B60);
  late Color tertiaryColor = const Color(0xFFFFFFFF);
  late Color alternate = const Color(0xFF39D2C0);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF090F13);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color grayDark = Color(0xFF95A1AC);
  late Color dark900 = Color(0xFF1A1F24);
  late Color background = Color(0xFF14181B);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color tertiary = Color(0xFF39D2C0);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF22282F);
  late Color gray200 = Color(0xFFDBE2E7);
  late Color gray600 = Color(0xFF262D34);
  late Color black600 = Color(0xFF090F13);
  late Color tertiary400 = Color(0xFF39D2C0);
  late Color textColor = Color(0xFF1E2429);
  late Color spaceCadet = Color(0xFF222E50);
  late Color tealBlue = Color(0xFF007991);
  late Color illuminatingEmerald = Color(0xFF439A86);
  late Color cambridgeBlue = Color(0xFFBCD8C1);
  late Color flax = Color(0xFFE9D985);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
