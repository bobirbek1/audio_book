import 'package:audio_book/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final double rating;
  final void Function(int rating)? onRating;
  final double? size;
  const RatingBar({required this.rating, this.size, this.onRating, super.key});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double _rating = 0;

  @override
  void initState() {
    _rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Expanded(
          child: IconButton(
            onPressed: widget.onRating != null
                ? () {
                    setState(() {
                      _rating = index + 1;
                      widget.onRating!(_rating.toInt());
                    });
                  }
                : null,
            iconSize: widget.size ?? 24,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
                minWidth: widget.size ?? 24, minHeight: widget.size ?? 24),
            icon: index < _rating
                ? Assets.icons.starFilled.svg()
                : Assets.icons.starOutlined.svg(),
          ),
        ),
      ),
    );
  }
}
