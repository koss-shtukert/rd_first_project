import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_21/bloc/ball_bloc.dart';
import 'package:rd_first_project/lesson_21/bloc/ball_event.dart';
import 'package:rd_first_project/lesson_21/bloc/ball_state.dart';
import 'package:rd_first_project/lesson_21/widgets/ball_controls_widget.dart';
import 'package:rd_first_project/lesson_21/widgets/ball_shadow_widget.dart';
import 'package:rd_first_project/lesson_21/widgets/ball_widget.dart';
import 'package:rd_first_project/lesson_21/widgets/grass_widget.dart';
import 'package:rd_first_project/lesson_21/widgets/sky_widget.dart';

class Hw21Task1Screen extends StatelessWidget {
  const Hw21Task1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BallBloc(),
      child: const _Hw21Task1View(),
    );
  }
}

class _Hw21Task1View extends StatefulWidget {
  const _Hw21Task1View();

  @override
  State<_Hw21Task1View> createState() => _Hw21Task1ViewState();
}

class _Hw21Task1ViewState extends State<_Hw21Task1View>
    with TickerProviderStateMixin {
  late Ticker _ticker;
  Duration _lastTick = Duration.zero;

  late AnimationController _controlsController;
  late Animation<double> _controlsOpacity;
  late Animation<Offset> _controlsSlide;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);

    _controlsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controlsOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controlsController, curve: Curves.easeOut),
    );
    _controlsSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0.3)).animate(
          CurvedAnimation(parent: _controlsController, curve: Curves.easeOut),
        );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.sizeOf(context);

    context.read<BallBloc>().add(
      BallInitEvent(screenWidth: size.width, screenHeight: size.height),
    );
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _lastTick).inMicroseconds / 1000000.0;
    _lastTick = elapsed;
    if (dt <= 0 || dt > 0.1) return;
    context.read<BallBloc>().add(BallTickEvent(dt));
  }

  void _kick(double power, {double? vxOverride}) {
    final bloc = context.read<BallBloc>();
    if (bloc.state.isMoving) return;
    bloc.add(BallKickEvent(power: power, vxOverride: vxOverride));
    _controlsController.forward();
    _lastTick = Duration.zero;
    _ticker.start();
  }

  void _onBallTap() {
    final state = context.read<BallBloc>().state;
    if (state.useScale) _kick(state.power);
  }

  void _onPanEnd(DragEndDetails details) {
    final bloc = context.read<BallBloc>();
    if (bloc.state.isMoving) return;
    final velocity = details.velocity.pixelsPerSecond;
    final power = (velocity.distance / 3000).clamp(0.2, 1.0);
    _kick(power, vxOverride: velocity.dx * 0.5);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _controlsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final grassTop = size.height * 0.78;

    return Scaffold(
      body: BlocListener<BallBloc, BallState>(
        listenWhen: (prev, curr) => prev.isMoving && !curr.isMoving,
        listener: (context, state) {
          _ticker.stop();
          _controlsController.reverse();
        },
        child: Stack(
          children: [
            const SkyWidget(),
            GrassWidget(grassTop: grassTop),
            BlocBuilder<BallBloc, BallState>(
              buildWhen: (prev, curr) =>
                  prev.ballX != curr.ballX ||
                  prev.ballY != curr.ballY ||
                  prev.rotation != curr.rotation,
              builder: (context, state) {
                return BallShadowWidget(
                  ballX: state.ballX,
                  ballY: state.ballY,
                  groundY: state.groundY,
                  ceilingY: state.ceilingY,
                  grassTop: grassTop,
                );
              },
            ),
            BlocBuilder<BallBloc, BallState>(
              buildWhen: (prev, curr) =>
                  prev.ballX != curr.ballX ||
                  prev.ballY != curr.ballY ||
                  prev.rotation != curr.rotation ||
                  prev.useScale != curr.useScale,
              builder: (context, state) {
                return BallWidget(
                  ballX: state.ballX,
                  ballY: state.ballY,
                  rotation: state.rotation,
                  useScale: state.useScale,
                  onTap: _onBallTap,
                  onPanEnd: _onPanEnd,
                );
              },
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: size.height * 0.02,
              child: AnimatedBuilder(
                animation: _controlsController,
                builder: (context, child) {
                  return FractionalTranslation(
                    translation: _controlsSlide.value,
                    child: Opacity(
                      opacity: _controlsOpacity.value,
                      child: child,
                    ),
                  );
                },
                child: BlocBuilder<BallBloc, BallState>(
                  buildWhen: (prev, curr) =>
                      prev.useScale != curr.useScale ||
                      prev.power != curr.power ||
                      prev.isMoving != curr.isMoving,
                  builder: (context, state) {
                    return IgnorePointer(
                      ignoring: state.isMoving,
                      child: BallControlsWidget(
                        useScale: state.useScale,
                        power: state.power,
                        onModeChanged: (v) => context.read<BallBloc>().add(
                          BallToggleModeEvent(v),
                        ),
                        onPowerChanged: state.useScale
                            ? (v) => context.read<BallBloc>().add(
                                BallSetPowerEvent(v),
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.paddingOf(context).top + 8,
              left: 8,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
