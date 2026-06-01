class BallState {
  const BallState({
    this.ballX = 0,
    this.ballY = 0,
    this.rotation = 0,
    this.isMoving = false,
    this.power = 0.5,
    this.useScale = false,
    this.groundY = 0,
    this.ceilingY = 0,
  });

  final double ballX;
  final double ballY;
  final double rotation;
  final bool isMoving;
  final double power;
  final bool useScale;
  final double groundY;
  final double ceilingY;

  BallState copyWith({
    double? ballX,
    double? ballY,
    double? rotation,
    bool? isMoving,
    double? power,
    bool? useScale,
    double? groundY,
    double? ceilingY,
  }) {
    return BallState(
      ballX: ballX ?? this.ballX,
      ballY: ballY ?? this.ballY,
      rotation: rotation ?? this.rotation,
      isMoving: isMoving ?? this.isMoving,
      power: power ?? this.power,
      useScale: useScale ?? this.useScale,
      groundY: groundY ?? this.groundY,
      ceilingY: ceilingY ?? this.ceilingY,
    );
  }
}
