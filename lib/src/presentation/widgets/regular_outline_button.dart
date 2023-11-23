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
    final customStyle = OutlinedButton.styleFrom(
      foregroundColor: foregroundColor,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                radius!,
              ),
            )
          : null,
      side: borderColor != null
          ? BorderSide(
              color: borderColor!,
              width: 1,
            )
          : null,
      minimumSize: size,
    );
    return OutlinedButton(
      onPressed: onPressed,
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            foregroundColor: customStyle.foregroundColor,
            shape: customStyle.shape,
            side: customStyle.side,
            minimumSize: customStyle.maximumSize,
          ),
      child: child ??
          Text(
            text ?? "",
            style: textStyle ??
                Theme.of(context).textStyles.medium16.copyWith(
                      color: ColorName.primary50,
                    ),
          ),
    );
  }
}
