import 'dart:async';
import 'dart:convert';
import 'dart:ui';


import 'package:flutter/material.dart';


int maxFileSizeInBytes = 50 * 1024; // 50 KB

abstract final class AppUtils {
  static DialogHelper get dialog => const DialogHelper._();
}

final class DialogHelper {
  const DialogHelper._();

  Future<T?> showCustomDialog<T>(
      BuildContext context, {
        required bool barrierDismissible,
        required Widget Function(BuildContext context) builder,
        Color? barrierColor = Colors.transparent,
      }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: builder,
    );
  }
}




String prettyJson(Map<String, dynamic> input) =>
    JsonEncoder.withIndent('  ').convert(input);



abstract class UiUtils {
  const UiUtils._();

  static Size measureText(
      String text,
      TextStyle style,
      double maxWidth, {
        int? maxLines,
      }) {
    final painter = TextPainter(
      textAlign: TextAlign.center,
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    )..layout(maxWidth: maxWidth);

    return painter.size;
  }

  static String formatNumberMax2Decimals(num value) {
    String s = value.toStringAsFixed(2);
    s = s.replaceAll(RegExp(r'0+$'), '');
    s = s.replaceAll(RegExp(r'\.$'), '');
    return s;
  }
}