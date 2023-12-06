import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:flutter/material.dart';

class RegularTextButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final double? radius;
  final Size? size;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  const RegularTextButton(
      {required this.onPressed,
      this.text,
      this.child,
      this.radius,
      this.size,
      this.foregroundColor,
      this.textStyle,
      super.key})
      : assert(text != null && child == null || child != null && text == null);

  @override
  Widget build(BuildContext context) {
    final customStyle = TextButton.styleFrom(
      shape: radius != null ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
      ) : null,
      minimumSize: size,
      foregroundColor: foregroundColor,
    );
    return TextButton(
      onPressed: onPressed,
      style: Theme.of(context).textButtonTheme.style?.copyWith(
        shape: customStyle.shape,
        minimumSize: customStyle.minimumSize,
        foregroundColor: customStyle.foregroundColor,
      ),
      child: child ??
          Text(
            text ?? "",
            style: textStyle ??
                Theme.of(context).textStyles.medium16.copyWith(
                      color: foregroundColor ?? ColorName.primary50,
                    ),
          ),
    );
  }
}
