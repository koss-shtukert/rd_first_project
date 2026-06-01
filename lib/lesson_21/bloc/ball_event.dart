sealed class BallEvent {}

class BallInitEvent extends BallEvent {
  BallInitEvent({required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;
}

class BallKickEvent extends BallEvent {
  BallKickEvent({required this.power, this.vxOverride});

  final double power;
  final double? vxOverride;
}

class BallTickEvent extends BallEvent {
  BallTickEvent(this.dt);

  final double dt;
}

class BallSetPowerEvent extends BallEvent {
  BallSetPowerEvent(this.power);

  final double power;
}

class BallToggleModeEvent extends BallEvent {
  BallToggleModeEvent(this.useScale);
  
  final bool useScale;
}
