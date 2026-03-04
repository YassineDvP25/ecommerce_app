import 'package:flutter/material.dart';

class SliverAppBarProduct extends StatefulWidget {
  final int selectedColorIndex;

  const SliverAppBarProduct({
    super.key,
    this.selectedColorIndex = 0,
  });

  @override
  State<SliverAppBarProduct> createState() => _SliverAppBarProductState();
}

class _SliverAppBarProductState extends State<SliverAppBarProduct> {
  double tiltX = 0;
  double tiltY = 0;

  double dragX = 0;
  double dragY = 0;
  @override
  void didUpdateWidget(covariant SliverAppBarProduct oldWidget) {
    super.didUpdateWidget(oldWidget);
    // no-op: build reads widget.selectedColorIndex directly
  }

  final List<String> imagePaths = [
    'assets/images/ChatGPT Image Mar 2, 2026, 11_54_22 AM.png',
    'assets/images/ChatGPT Image Mar 2, 2026, 12_21_43 PM.png',

    'assets/images/ChatGPT Image Mar 2, 2026, 12_18_03 PM.png',
    'assets/images/ChatGPT Image Mar 2, 2026, 12_28_33 PM.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 380,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: GestureDetector(
          onPanUpdate: (d) {
            setState(() {
              tiltX += d.delta.dx * 0.01;
              tiltY += d.delta.dy * 0.01;
            });
          },
          onPanEnd: (_) {
            setState(() {
              tiltX = 0;
              tiltY = 0;
            });
          },
          child: Center(
            child: Transform(
              alignment: Alignment.center,
              transform:
                  Matrix4.identity()
                    ..rotateX(dragY)
                    ..rotateY(dragX),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: Hero(
                  key: ValueKey(widget.selectedColorIndex),
                  tag: "product",
                  child: Image.asset(
                    imagePaths[widget.selectedColorIndex],
                    height: 390,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
