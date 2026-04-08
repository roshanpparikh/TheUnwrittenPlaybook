import 'package:flutter/material.dart';

class GradientActionButton extends StatelessWidget {
  const GradientActionButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.ember,
    required this.deepEmber,
    this.textColor = Colors.white,
    this.borderRadius = 14,
    this.verticalPadding = 18,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.letterSpacing = 0.3,
    this.blurRadius = 24,
    this.shadowOpacity = 0.4,
    this.shadowOffset = const Offset(0, 8),
    this.disabledOpacity = 0.5,
  });

  final String title;
  final VoidCallback? onTap;

  final Color ember;
  final Color deepEmber;
  final Color textColor;

  final double borderRadius;
  final double verticalPadding;

  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;

  final double blurRadius;
  final double shadowOpacity;
  final Offset shadowOffset;
  final double disabledOpacity;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final isEnabled = onTap != null;

    return Opacity(
      opacity: isEnabled ? 1 : disabledOpacity,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ember, deepEmber],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: ember.withOpacity(
                isEnabled ? shadowOpacity : shadowOpacity * disabledOpacity,
              ),
              blurRadius: blurRadius,
              offset: shadowOffset,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: radius,
          child: InkWell(
            borderRadius: radius,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  letterSpacing: letterSpacing,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
