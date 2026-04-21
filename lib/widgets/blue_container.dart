import 'package:flutter/material.dart';

class BlueContainer extends StatelessWidget {
  const BlueContainer({
    super.key,
    this.alignment = Alignment.bottomRight,
    this.color = Colors.blue,
    this.height = 150,
    this.child,
  });

  final Alignment alignment;
  final Color color;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: height,
      padding: const EdgeInsets.all(10),
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
