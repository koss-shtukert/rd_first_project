import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_21/ball_physics.dart';

class BallWidget extends StatelessWidget {
  const BallWidget({
    required this.ballX,
    required this.ballY,
    required this.rotation,
    required this.useScale,
    required this.onTap,
    required this.onPanEnd,
    super.key,
  });

  final double ballX;
  final double ballY;
  final double rotation;
  final bool useScale;
  final VoidCallback onTap;
  final GestureDragEndCallback onPanEnd;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ballX,
      top: ballY,
      child: GestureDetector(
        onTap: useScale ? onTap : null,
        onPanEnd: useScale ? null : onPanEnd,
        child: Transform.rotate(
          angle: rotation,
          child: Image.asset(
            'assets/icons/hw21/ball.png',
            width: BallPhysics.ballSize,
            height: BallPhysics.ballSize,
          ),
        ),
      ),
    );
  }
}
