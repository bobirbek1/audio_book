import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:flutter/material.dart';

class RegularOutlineButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? radius;
  final Size? size;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  const RegularOutlineButton(
      {required this.onPressed,
      this.text,
      this.child,
      this.radius,
      this.size,
      this.borderColor,
      this.textStyle,
      this.foregroundColor,
      super.key})
      : assert(text != null && child == null || text == null && child != null);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor ?? ColorName.primary50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 8,
          ),
        ),
        side: BorderSide(
          color: borderColor ?? ColorName.primary50,
          width: 1,
        ),
        minimumSize: size,
      ),
      child: child ??
          Text(
            text ?? "",
            style: textStyle ?? Theme.of(context).textStyles.medium16.copyWith(color: ColorName.primary50,),
          ),
    );
  }
}
