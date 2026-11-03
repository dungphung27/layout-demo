import 'package:flutter/material.dart';

class LayoutFrame extends StatelessWidget {
  final bool show;
  final Color color;
  final Widget child;

  const LayoutFrame(this.show, this.color, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return child;
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
      ),
      child: child,
    );
  }
}

class SpaceBox extends StatelessWidget {
  final bool show;
  final double width;
  final double height;

  const SpaceBox(this.show, this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return SizedBox(width: width, height: height);
    }
    return SizedBox(
      width: width,
      height: height,
      child: Container(color: Colors.green.shade200),
    );
  }
}
