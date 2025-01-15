import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final List<Color> clr;
  final Color overlayColor;
  final bool isGradientVertical;
  final Function() onPressed;

  GradientButton(
      {required this.title,
      required this.width,
      required this.height,
      required this.clr,
      required this.overlayColor,
      required this.isGradientVertical,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: clr,
                    begin: isGradientVertical
                        ? Alignment.topCenter
                        : Alignment.centerLeft,
                    end: isGradientVertical
                        ? Alignment.bottomCenter
                        : Alignment.centerRight),
                borderRadius: BorderRadius.circular(5)),
            child: ElevatedButton(onPressed: onPressed, child: Text(title)),
          ),
        ),
      ),
    );
  }
}
