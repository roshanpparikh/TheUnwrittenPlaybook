

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/theme/fit_progress_color_palette.dart';
import 'package:upwork_the_unwritten_playbook/theme/light_theme.dart';



import 'color_scheme.dart';

ThemeData createDarkTheme(BuildContext context) {
  final scaleFactor = calculateScaleFactor(context);

  TextStyle resizeTextStyle(TextStyle style) {
    return style.copyWith(
      fontSize: style.fontSize! * scaleFactor,
      height: style.height! * scaleFactor,
      wordSpacing: style.wordSpacing != null
          ? style.wordSpacing! * scaleFactor
          : null,
    );
  }

  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColorPalette.electricBlue,
      onPrimary: Colors.black,
      secondary: AppColorPalette.vibrantCoral,
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.black,
      surface: Color(0xFF121212),
      onSurface: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorPalette.lightGray)),
      counterStyle: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.inter, color: AppColorPalette.white, fontSize: 14, height: 1.4, letterSpacing: 0.25, fontWeight: FontWeight.normal)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorPalette.electricBlue)),
    ),
    textTheme: TextTheme(
      displayLarge: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 57, height: 1.12, letterSpacing: 0, fontWeight: FontWeight.normal)),
      displayMedium: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 45, height: 1.15, letterSpacing: 0, fontWeight: FontWeight.normal)),
      displaySmall: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 36, height: 1.22, letterSpacing: 0, fontWeight: FontWeight.normal)),
      headlineLarge: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 32, height: 1.25, letterSpacing: 0, fontWeight: FontWeight.normal)),
      headlineMedium: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 28, height: 1.28, letterSpacing: 0, fontWeight: FontWeight.normal)),
      headlineSmall: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 24, height: 1.16, letterSpacing: 0, fontWeight: FontWeight.normal)),
      titleLarge: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 22, height: 1.27, letterSpacing: 0, fontWeight: FontWeight.w500)),
      titleMedium: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 16, height: 1.5, letterSpacing: 0.15, fontWeight: FontWeight.w500)),
      titleSmall: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.roboto, color: Colors.white, fontSize: 14, height: 1.4, letterSpacing: 0.1, fontWeight: FontWeight.w500)),
      bodyLarge: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.inter, color: Colors.white, fontSize: 16, height: 1.5, letterSpacing: 0.15, fontWeight: FontWeight.normal)),
      bodyMedium: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.inter, color: Colors.white, fontSize: 14, height: 1.4, letterSpacing: 0.25, fontWeight: FontWeight.normal)),
      bodySmall: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.inter, color: Colors.white, fontSize: 12, height: 1.33, letterSpacing: 0.4, fontWeight: FontWeight.normal)),
      labelLarge: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.inter, color: Colors.white, fontSize: 14, height: 1.4, letterSpacing: 0.1, fontWeight: FontWeight.w500)),
      labelMedium: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.inter, color: Colors.white, fontSize: 12, height: 1.3, letterSpacing: 0.5, fontWeight: FontWeight.w500)),
      labelSmall: resizeTextStyle(TextStyle(fontFamily: FitProgressFonts.inter, color: Colors.white, fontSize: 11, height: 1.45, letterSpacing: 0.5, fontWeight: FontWeight.w500)),
    ),

    appBarTheme: AppBarTheme(
        backgroundColor: navy,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        )
    ),
    iconTheme: IconThemeData(
        color: AppColorPalette.charcoal
    ),
    scaffoldBackgroundColor: navy,
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.aquaBreeze,
      selectionColor: AppColors.skyBlue,
      selectionHandleColor: AppColors.skyBlue,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: const WidgetStatePropertyAll(true),
      trackVisibility: const WidgetStatePropertyAll(false),
      interactive: true,
      crossAxisMargin: 4,
      mainAxisMargin: 4,
      thickness: const WidgetStatePropertyAll(10),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.any((state) =>
        state == WidgetState.hovered || state == WidgetState.pressed)) {
          return AppColors.cerulean;
        }
        return AppColors.cerulean.withOpacity(0.5);
      }),
    ),
  );
}