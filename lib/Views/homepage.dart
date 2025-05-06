import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Widgets/Buttons/gradients_buttons.dart';
import 'package:portfolio/Widgets/Icons/padded_icons.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 250, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  // child: Image.asset("assets/images/test.png"),
                ),
                Row(
                  children: [
                    PaddedIcons(
                        ficon: FontAwesomeIcons.facebook, color: Colors.blue),
                    PaddedIcons(
                        ficon: FontAwesomeIcons.twitter, color: Colors.blue),
                    PaddedIcons(
                        ficon: FontAwesomeIcons.instagram,
                        color: Colors.blue),
                    SizedBox(width: 20),
                    GradientButton(
                        title: "Download CV",
                        width: 250,
                        height: 80,
                        clr: [Colors.red, Colors.redAccent],
                        overlayColor: Colors.red,
                        isGradientVertical: false,
                        onPressed: () {})
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
