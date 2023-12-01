import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:flutter/material.dart';

class RegularElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Size? size;
  final Color? backgroundColor;
  final double? radius;
  final TextStyle? style;
  final double? elevation;
  final EdgeInsets? padding;
  const RegularElevatedButton(
      {required this.onPressed,
      this.text,
      this.child,
      this.size,
      this.backgroundColor,
      this.radius,
      this.style,
      this.elevation,
      this.padding,
      super.key})
      : assert(text != null && child == null || text == null && child != null);

  @override
  Widget build(BuildContext context) {
    final customStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: size,
      elevation: elevation,
      shadowColor: elevation == 0 ? Colors.transparent : null,
      padding: padding,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                radius!,
              ),
            )
          : null,
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: customStyle.backgroundColor,
            minimumSize: customStyle.minimumSize,
            shape: customStyle.shape,
            elevation: customStyle.elevation,
            shadowColor: customStyle.shadowColor,
            padding: customStyle.padding,
          ),
      child: text != null
          ? Text(
              text!,
              style: style ??
                  Theme.of(context).textStyles.medium16.copyWith(
                        color: ColorName.white,
                      ),
            )
          : child,
    );
  }
}
