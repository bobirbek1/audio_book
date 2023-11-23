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
    final customStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: size,
      shape:  radius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!,),) : null,
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: customStyle.backgroundColor,
        minimumSize: customStyle.minimumSize,
        shape: customStyle.shape,
      ),
      child: text != null
          ? Text(text!,
              style: style ??
                  Theme.of(context).textStyles.medium16.copyWith(
                        color: ColorName.white,
                      ))
          : child,
    );
  }
}
