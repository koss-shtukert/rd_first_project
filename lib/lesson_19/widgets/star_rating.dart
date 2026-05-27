import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_event.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_state.dart';

class StarRating extends StatefulWidget {
  const StarRating({super.key});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _displayedRating = 0;
  bool _animating = false;

  @override
  void initState() {
    super.initState();
    final currentRating = context.read<RatingBloc>().state.rating;

    if (currentRating > 0) {
      _animateToRating(currentRating);
    }
  }

  void _animateToRating(int target) async {
    if (_animating) return;
    _animating = true;
    final step = target > _displayedRating ? 1 : -1;

    while (_displayedRating != target) {
      await Future<void>.delayed(const Duration(milliseconds: 150));
      if (!mounted) return;

      setState(() {
        _displayedRating += step;
      });
    }

    _animating = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingBloc, RatingState>(
      listenWhen: (prev, curr) => prev.rating != curr.rating,
      listener: (context, state) {
        _animateToRating(state.rating);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          final starIndex = index + 1;
          final isSelected = starIndex <= _displayedRating;
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
            child: GestureDetector(
              onTap: () {
                if (context.read<RatingBloc>().state.status !=
                    RatingStatus.success) {
                  context.read<RatingBloc>().add(RatingSelected(starIndex));
                }
              },
              child: _AnimatedStar(isSelected: isSelected, index: index),
            ),
          );
        }),
      ),
    );
  }
}

class _AnimatedStar extends StatefulWidget {
  const _AnimatedStar({required this.isSelected, required this.index});

  final bool isSelected;
  final int index;

  @override
  State<_AnimatedStar> createState() => _AnimatedStarState();
}

class _AnimatedStarState extends State<_AnimatedStar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(_controller);
    if (widget.isSelected) _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(_AnimatedStar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Image.asset(
          key: ValueKey(widget.isSelected),
          widget.isSelected
              ? 'assets/icons/hw19/star_filled.png'
              : 'assets/icons/hw19/star_empty.png',
          width: 34,
          height: 32,
        ),
      ),
    );
  }
}
