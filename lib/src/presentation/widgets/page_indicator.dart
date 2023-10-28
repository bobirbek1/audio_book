import 'package:audio_book/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final PageController controller;
  const PageIndicator({required this.controller, super.key});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  int currentPage = 0;
  @override
  void initState() {
    widget.controller.addListener(() {
      final q = widget.controller.page! % 1;
      if (q <= 0.2 || q >= 0.8) {
        setState(() {
          currentPage = widget.controller.page!.toInt();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 12,
          height: 12,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentPage == 0 ? ColorName.accent50 : ColorName.primary40,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          width: 12,
          height: 12,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentPage == 1 ? ColorName.accent50 : ColorName.primary40,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          width: 12,
          height: 12,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentPage == 2 ? ColorName.accent50 : ColorName.primary40,
            ),
          ),
        ),
      ],
    );
  }
}
