import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
import 'package:flutter/material.dart';

class RegularElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Size? size;
  final Color? backgroundColor;
  final double? radius;
  final TextStyle? style;
  const RegularElevatedButton(
      {required this.onPressed,
      this.text,
      this.child,
      this.size,
      this.backgroundColor,
      this.radius,
      this.style,
      super.key})
      : assert(text != null && child == null || text == null && child != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorName.primary50,
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 8,
          ),
        ),
      ),
      child: text != null
          ? Text(
              text!,
              style: style ?? TextStyles.medium16.copyWith(
                color: ColorName.white,
              ),
            )
          : child,
    );
  }
}
