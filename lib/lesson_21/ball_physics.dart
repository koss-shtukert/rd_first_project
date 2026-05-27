import 'dart:math';

class BallPhysics {
  static const ballSize = 65.0;
  static const _gravity = 1800.0;
  static const _bounceFactor = 0.65;
  static const _minVelocity = 50.0;

  double ballX = 0;
  double ballY = 0;
  double vx = 0;
  double vy = 0;
  double rotation = 0;
  double rotationSpeed = 0;

  late double groundY;
  late double ceilingY;
  late double maxX;

  void initLayout({required double screenWidth, required double screenHeight}) {
    groundY = screenHeight * 0.78 - ballSize * 0.75;
    ceilingY = 0;
    maxX = screenWidth - ballSize;
    ballX = (screenWidth - ballSize) / 2;
    ballY = groundY;
  }

  void applyKick(double power, {double? vxOverride}) {
    final rng = Random();
    vy = -(800 + power * 1500);
    vx = vxOverride ?? (rng.nextDouble() - 0.5) * 1000 * power;
    rotationSpeed = (rng.nextBool() ? 1 : -1) * (3 + power * 10);
  }

  /// Returns true if ball stopped.
  bool update(double dt) {
    vy += _gravity * dt;
    ballX += vx * dt;
    ballY += vy * dt;
    rotation += rotationSpeed * dt;
    rotationSpeed *= 0.998;

    if (ballY >= groundY) {
      ballY = groundY;
      vy = -vy * _bounceFactor;
      vx *= 0.85;
      rotationSpeed = -rotationSpeed * 0.7;

      if (vy.abs() < _minVelocity && vx.abs() < _minVelocity) {
        vy = 0;
        vx = 0;
        rotationSpeed = 0;
        return true;
      }
    }

    if (ballY <= ceilingY) {
      ballY = ceilingY;
      vy = -vy * _bounceFactor;
      rotationSpeed = -rotationSpeed;
    }

    if (ballX <= 0) {
      ballX = 0;
      vx = -vx * 0.8;
      rotationSpeed = -rotationSpeed;
    }

    if (ballX >= maxX) {
      ballX = maxX;
      vx = -vx * 0.8;
      rotationSpeed = -rotationSpeed;
    }

    return false;
  }
}
