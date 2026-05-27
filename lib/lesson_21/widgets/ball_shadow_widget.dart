import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_21/ball_physics.dart';

class BallShadowWidget extends StatelessWidget {
  const BallShadowWidget({
    required this.ballX,
    required this.ballY,
    required this.groundY,
    required this.ceilingY,
    required this.grassTop,
    super.key,
  });

  final double ballX;
  final double ballY;
  final double groundY;
  final double ceilingY;
  final double grassTop;

  @override
  Widget build(BuildContext context) {
    final maxDist = groundY - ceilingY;
    if (maxDist <= 0) {
      return const Positioned(
        left: 0,
        top: 0,
        child: SizedBox.shrink(),
      );
    }

    final dist = (groundY - ballY).clamp(0.0, maxDist);
    final t = 1 - (dist / maxDist); // 1 on ground, 0 at ceiling

    final shadowWidth = BallPhysics.ballSize * (0.3 + t * 0.7);
    final shadowOpacity = 0.25 * t;
    final shadowHeight = shadowWidth * 0.4;

    return Positioned(
      left: ballX + (BallPhysics.ballSize - shadowWidth) / 2,
      top: grassTop + 8,
      child: Container(
        width: shadowWidth,
        height: shadowHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.elliptical(shadowWidth / 2, shadowHeight / 2),
          ),
          color: Colors.black.withValues(alpha: shadowOpacity),
        ),
      ),
    );
  }
}
