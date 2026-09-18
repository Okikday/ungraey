import 'package:flutter/material.dart';

/// Clean typography wrapper with standard defaults and overflow handling.
class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle effectiveStyle = style ?? DefaultTextStyle.of(context).style;
    if (fontSize != null ||
        color != null ||
        fontWeight != null ||
        height != null) {
      effectiveStyle = effectiveStyle.copyWith(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: effectiveStyle,
    );
  }
}
