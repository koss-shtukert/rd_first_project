import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_21/ball_physics.dart';
import 'package:rd_first_project/lesson_21/bloc/ball_event.dart';
import 'package:rd_first_project/lesson_21/bloc/ball_state.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  BallBloc() : super(const BallState()) {
    on<BallInitEvent>(_onInit);
    on<BallKickEvent>(_onKick);
    on<BallTickEvent>(_onTick);
    on<BallSetPowerEvent>(_onSetPower);
    on<BallToggleModeEvent>(_onToggleMode);
  }

  final BallPhysics _physics = BallPhysics();

  void _onInit(BallInitEvent event, Emitter<BallState> emit) {
    _physics.initLayout(
      screenWidth: event.screenWidth,
      screenHeight: event.screenHeight,
    );
    emit(
      state.copyWith(
        ballX: _physics.ballX,
        ballY: _physics.ballY,
        groundY: _physics.groundY,
        ceilingY: _physics.ceilingY,
      ),
    );
  }

  void _onKick(BallKickEvent event, Emitter<BallState> emit) {
    if (state.isMoving) return;
    _physics.applyKick(event.power, vxOverride: event.vxOverride);
    emit(state.copyWith(isMoving: true));
  }

  void _onTick(BallTickEvent event, Emitter<BallState> emit) {
    final stopped = _physics.update(event.dt);
    emit(
      state.copyWith(
        ballX: _physics.ballX,
        ballY: _physics.ballY,
        rotation: _physics.rotation,
        isMoving: !stopped,
      ),
    );
  }

  void _onSetPower(BallSetPowerEvent event, Emitter<BallState> emit) {
    emit(state.copyWith(power: event.power));
  }

  void _onToggleMode(BallToggleModeEvent event, Emitter<BallState> emit) {
    emit(state.copyWith(useScale: event.useScale));
  }
}
