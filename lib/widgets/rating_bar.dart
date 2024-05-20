import 'package:flutter/material.dart';


class StarDisplayWidget extends StatefulWidget {
  final int value;
  final ValueChanged<int>? onValueChanged;
  final Widget filledStar;
  final Widget unfilledStar;
  final List<Color>? starColors;

  const StarDisplayWidget({
    Key? key,
    required this.value,
    this.onValueChanged,
    required this.filledStar,
    required this.unfilledStar,
    this.starColors,
  }) : super(key: key);

  @override
  _StarDisplayWidgetState createState() => _StarDisplayWidgetState();
}

class _StarDisplayWidgetState extends State<StarDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          return GestureDetector(
            onTap: () {
              widget.onValueChanged?.call(index + 1);
            },
            child: widget.starColors != null
                ? Icon(
                    index < widget.value ? Icons.star : Icons.star_border,
                    color: widget.starColors![index],
                  )
                : index < widget.value
                    ? widget.filledStar
                    : widget.unfilledStar,
          );
        },
      ),
    );
  }
}
