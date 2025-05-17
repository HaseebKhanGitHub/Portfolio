import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Widgets/Buttons/gradients_buttons.dart';
import 'package:portfolio/Widgets/Buttons/haptic_circle.dart';
import 'package:portfolio/Widgets/Cursor/animated_circle_cursor.dart';
import 'package:portfolio/Widgets/Icons/padded_icons.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1400,
                minHeight: 1000, // 👈 Force height to ensure scroll
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 160, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedCircleCursorMouseRegion(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child:
                                Image.asset("assets/images/flutterLogo.webp"),
                          ),
                        ),
                        Row(
                          children: [
                            PaddedIcons(
                                ficon: FontAwesomeIcons.facebook,
                                color: Colors.blue),
                            PaddedIcons(
                                ficon: FontAwesomeIcons.twitter,
                                color: Colors.blue),
                            PaddedIcons(
                                ficon: FontAwesomeIcons.instagram,
                                color: Colors.blue),
                            const SizedBox(width: 20),
                            GradientButton(
                              title: "Download CV",
                              width: 250,
                              height: 80,
                              clr: [Colors.red, Colors.redAccent],
                              overlayColor: Colors.red,
                              isGradientVertical: false,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),

                    // Content Area
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "I'm",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Haseeb Khan",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "A passionate flutter developer with a hands on experience of one year",
                                    style: TextStyle(
                                        color: Colors.black.withAlpha(100),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedCircleCursorMouseRegion(
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: HapticCircle()),
                                          SizedBox(width: 30),
                                          Text(
                                            "Play Video",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 800,
                            color: Colors.blue,
                            child: const Column(
                              children: [Text("data")],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
