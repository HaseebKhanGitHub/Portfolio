import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/Cursor/constants.dart';
import 'package:provider/provider.dart';

class AnimatedCursorState {
  final BoxDecoration? decoration;
  final Offset offset1;
  final Offset offset2;
  final Size size1;
  final Size size2;

  static const Size circle1size = Size(30, 30);
  static const Size circle2size = Size(5, 5);

  AnimatedCursorState({
    this.decoration,
    this.offset1 = Offset.zero,
    this.offset2 = Offset.zero,
    this.size1 = circle1size,
    this.size2 = circle2size,
  });
}

class AnimatedCursorProvider extends ChangeNotifier {
  AnimatedCursorProvider();

  AnimatedCursorState state = AnimatedCursorState();

  void changeCursor({
    required GlobalKey key,
    required BoxDecoration boxDecoration,
  }) {
    final renderObject = key.currentContext?.findRenderObject();
    if (renderObject is! RenderBox) return;

    state = AnimatedCursorState(
      size1: const Size(60, 60),
      offset1: state.offset1,
      offset2: state.offset2,
      decoration: boxDecoration,
    );
    notifyListeners();
  }

  void resetCursor() {
    state = AnimatedCursorState();
    notifyListeners();
  }

  void updateCursorPosition(Offset position) {
    state = AnimatedCursorState(
      offset1: position,
      offset2: position,
      decoration: state.decoration,
    );
    notifyListeners();
  }
}

class AnimatedCircleCursor extends StatelessWidget {
  const AnimatedCircleCursor({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimatedCursorProvider(),
      child: Consumer<AnimatedCursorProvider>(
        builder: (context, value, _) {
          final state = value.state;
          return Stack(
            children: [
              child,
              Positioned.fill(
                child: MouseRegion(
                  opaque: false,
                  onHover: (event) => context
                      .read<AnimatedCursorProvider>()
                      .updateCursorPosition(event.position),
                ),
              ),
              if (state.offset1 != Offset.zero) ...[
                // Larger circle
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  top: state.offset1.dy - state.size1.height / 2,
                  left: state.offset1.dx - state.size1.width / 2,
                  width: state.size1.width,
                  height: state.size1.height,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutExpo,
                    decoration:
                        state.decoration ?? CursorConstants.boxDecorationOne,
                  ),
                ),
                // Smaller circle (dot)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 50),
                  top: state.offset2.dy - state.size2.height / 2,
                  left: state.offset2.dx - state.size2.width / 2,
                  width: state.size2.width,
                  height: state.size2.height,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutExpo,
                    decoration: CursorConstants.boxDecorationTwo,
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class AnimatedCircleCursorMouseRegion extends StatefulWidget {
  final Widget? child;

  const AnimatedCircleCursorMouseRegion({super.key, this.child});

  @override
  State<AnimatedCircleCursorMouseRegion> createState() =>
      _AnimatedCircleCursorMouseRegionState();
}

class _AnimatedCircleCursorMouseRegionState
    extends State<AnimatedCircleCursorMouseRegion> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AnimatedCursorProvider>();
    return MouseRegion(
      key: _key,
      opaque: false,
      onExit: (_) => cubit.resetCursor(),
      onHover: (_) => cubit.changeCursor(
          key: _key, boxDecoration: CursorConstants.boxDecorationHovered),
      child: widget.child,
    );
  }
}
