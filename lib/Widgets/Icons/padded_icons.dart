import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Widgets/Cursor/animated_circle_cursor.dart';

class PaddedIcons extends StatelessWidget {
  final IconData ficon;
  final double? padding;
  final Color color;

  PaddedIcons({required this.ficon, this.padding, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedCircleCursorMouseRegion(
      child: Padding(
        padding:
            padding != null ? EdgeInsets.all(padding!) : EdgeInsets.all(8.0),
        child: Icon(
          ficon,
          color: color,
        ),
      ),
    );
  }
}
