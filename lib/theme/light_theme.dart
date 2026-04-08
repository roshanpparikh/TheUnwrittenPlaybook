import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upwork_the_unwritten_playbook/theme/color_scheme.dart';
import 'package:upwork_the_unwritten_playbook/theme/fit_progress_color_palette.dart';

ThemeData createLightTheme(BuildContext context, [Color? primaryColor]) {
  final scaleFactor = calculateScaleFactor(context);

  TextStyle resizeTextStyle(TextStyle style) {
    return style.copyWith(
      fontSize: style.fontSize! * scaleFactor,
      height: style.height! * scaleFactor,
      wordSpacing:
          style.wordSpacing != null ? style.wordSpacing! * scaleFactor : null,
    );
  }
  primaryColor ??= AppColorPalette.electricBlue;
  return ThemeData(
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColorPalette.charcoal,
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: Colors.white, // Assuming light text on primary background
      secondary: AppColorPalette.vibrantCoral,
      onSecondary: Colors.white, // Assuming light text on secondary background
      error: Colors.red, // Add a custom one if needed
      onError: Colors.white,
      surface: AppColorPalette.lightGray,
      onSurface: AppColorPalette.charcoal,
    ),
    
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        // side: WidgetStateProperty.all(BorderSide())
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColorPalette.charcoal.withAlpha(50)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColorPalette.charcoal),
      ),
      counterStyle: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.inter,
          color: AppColorPalette.charcoal,
          fontSize: 14,
          height: 1.4,
          letterSpacing: 0.25,
          fontWeight: FontWeight.normal,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 57,
          height: 1.12,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
      ),
      displayMedium: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 45,
          height: 1.15,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
      ),
      displaySmall: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 36,
          height: 1.22,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
      ),
      headlineLarge: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 32,
          height: 1.25,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
      ),
      headlineMedium: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 28,
          height: 1.28,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
      ),
      headlineSmall: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 24,
          height: 1.16,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
      ),
      titleLarge: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 22,
          height: 1.27,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
      ),
      titleMedium: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w500,
        ),
      ),
      titleSmall: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.roboto,
          color: AppColorPalette.charcoal,
          fontSize: 14,
          height: 1.4,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
        ),
      ),
      bodyLarge: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.inter,
          color: AppColorPalette.charcoal,
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.15,
          fontWeight: FontWeight.normal,
        ),
      ),
      bodyMedium: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.inter,
          color: AppColorPalette.charcoal,
          fontSize: 14,
          height: 1.4,
          letterSpacing: 0.25,
          fontWeight: FontWeight.normal,
        ),
      ),
      bodySmall: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.inter,
          color: AppColorPalette.charcoal,
          fontSize: 12,
          height: 1.33,
          letterSpacing: 0.4,
          fontWeight: FontWeight.normal,
        ),
      ),
      labelLarge: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.inter,
          color: AppColorPalette.charcoal,
          fontSize: 14,
          height: 1.4,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
        ),
      ),
      labelMedium: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.inter,
          color: AppColorPalette.charcoal,
          fontSize: 12,
          height: 1.3,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
      ),
      labelSmall: resizeTextStyle(
        TextStyle(
          fontFamily: FitProgressFonts.inter,
          color: AppColorPalette.charcoal,
          fontSize: 11,
          height: 1.45,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    iconTheme: IconThemeData(color: AppColorPalette.charcoal, size: 32),
    scaffoldBackgroundColor: AppColorPalette.lightGray,
    useMaterial3: true,
    sliderTheme: SliderThemeData(
      trackHeight: 8,
      thumbColor: AppColors.cerulean,
      activeTrackColor: AppColors.aquaBreeze,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
      overlayShape: SliderComponentShape.noOverlay,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.aquaBreeze,
      selectionColor: AppColors.skyBlue,
      selectionHandleColor: AppColors.skyBlue,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: const WidgetStatePropertyAll(true),
      trackVisibility: const WidgetStatePropertyAll(true),
      interactive: true,
      crossAxisMargin: 10,
      mainAxisMargin: 0,
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return primaryColor;
        }
        return primaryColor!.withAlpha(122);
      }),
      trackColor: const WidgetStatePropertyAll(Colors.transparent),
      trackBorderColor: const WidgetStatePropertyAll(Colors.transparent),
    ),
  );
}

double calculateScaleFactor(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth >= 1200) {
    return 1.4; // Large screens
  } else if (screenWidth >= 900) {
    return 1.2; // Medium screens
  } else if (screenWidth >= 600) {
    return 1.0; // Default
  } else {
    return 0.9; // Small screens
  }
}
