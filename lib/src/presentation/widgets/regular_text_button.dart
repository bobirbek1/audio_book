import 'package:audio_book/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class RegularTextButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final double radius;
  final Size? size;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  const RegularTextButton(
      {required this.onPressed,
      this.text,
      this.child,
      this.radius = 8,
      this.size,
      this.foregroundColor,
      this.textStyle,
      super.key})
      : assert(text != null && child == null || child != null && text == null);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        minimumSize: size,
        foregroundColor: foregroundColor ?? ColorName.primary50,
      ),
      child: child ??
          Text(
            text ?? "",
            style: textStyle,
          ),
    );
  }
}
