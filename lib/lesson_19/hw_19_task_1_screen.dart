import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_event.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_state.dart';
import 'package:rd_first_project/lesson_19/widgets/action_buttons.dart';
import 'package:rd_first_project/lesson_19/widgets/animated_phone.dart';
import 'package:rd_first_project/lesson_19/widgets/comment_field.dart';
import 'package:rd_first_project/lesson_19/widgets/rating_success_snack_bar.dart';
import 'package:rd_first_project/lesson_19/widgets/star_rating.dart';

class Hw19Task1Screen extends StatefulWidget {
  const Hw19Task1Screen({super.key});

  @override
  State<Hw19Task1Screen> createState() => _Hw19Task1ScreenState();
}

class _Hw19Task1ScreenState extends State<Hw19Task1Screen> {
  late final RatingBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<RatingBloc>();

    if (_bloc.state.status != RatingStatus.success) {
      _bloc.add(RatingReset());
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  @override
  void dispose() {
    if (_bloc.state.status != RatingStatus.success) {
      _bloc.add(RatingReset());
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const _RatingView();
  }
}

class _RatingView extends StatelessWidget {
  const _RatingView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingBloc, RatingState>(
      listenWhen: (prev, curr) =>
          prev.status != RatingStatus.success &&
          curr.status == RatingStatus.success,
      listener: (context, state) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const RatingSuccessSnackBar());
      },
      child: Theme(
        data: Theme.of(context),
        child: Scaffold(
          backgroundColor: const Color(0xFF9AD1EF),
          appBar: AppBar(
            backgroundColor: const Color(0xFF1B3D70),
            title: const Text(
              'Flutter lab',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 32, 16, 44),
                    decoration: BoxDecoration(
                      color: const Color(0xFF60BAFF).withValues(alpha: 0.70),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        BlocBuilder<RatingBloc, RatingState>(
                          buildWhen: (prev, curr) => prev.status != curr.status,
                          builder: (context, state) {
                            final title = state.status == RatingStatus.success
                                ? 'Ви оцінили додаток'
                                : 'Як ви оціните додаток?';
                            return Text(
                              title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1B3D70),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        const StarRating(),
                        const SizedBox(height: 24),
                        const CommentField(),
                        const SizedBox(height: 24),
                        const ActionButtons(),
                      ],
                    ),
                  ),
                ),
                const AnimatedPhone(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
