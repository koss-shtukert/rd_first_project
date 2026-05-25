import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_state.dart';

class AnimatedPhone extends StatefulWidget {
  const AnimatedPhone({super.key});

  @override
  State<AnimatedPhone> createState() => _AnimatedPhoneState();
}

class _AnimatedPhoneState extends State<AnimatedPhone> {
  int _currentRating = 0;
  int _displayedRating = 0;
  bool _animating = false;

  @override
  void initState() {
    super.initState();
    _currentRating = context.read<RatingBloc>().state.rating;
    _displayedRating = 0;

    if (_currentRating > 0) {
      _animateToRating(_currentRating);
    }
  }

  void _animateToRating(int target) async {
    if (_animating) return;
    _animating = true;

    final step = target > _displayedRating ? 1 : -1;

    while (_displayedRating != target) {
      await Future<void>.delayed(const Duration(milliseconds: 150));

      if (!mounted) return;

      _displayedRating += step;

      (context as Element).markNeedsBuild();
    }

    _animating = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingBloc, RatingState>(
      listenWhen: (prev, curr) => prev.rating != curr.rating,
      listener: (context, state) {
        _currentRating = state.rating;
        _animateToRating(_currentRating);
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Image.asset(
          key: ValueKey(_displayedRating),
          'assets/icons/hw19/phone_$_displayedRating.png',
          width: 96,
          height: 124,
        ),
      ),
    );
  }
}
