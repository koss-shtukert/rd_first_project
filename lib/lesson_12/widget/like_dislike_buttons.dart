import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_12/constants/assets.dart';

class LikeDislikeButtons extends StatelessWidget {
  const LikeDislikeButtons({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool? value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _RatingButton(
          isActive: value == false,
          activeIcon: Lesson12Assets.dislikeActive,
          defaultIcon: Lesson12Assets.dislikeDefault,
          onTap: () => onChanged(value == false ? null : false),
        ),
        const SizedBox(width: 12),
        _RatingButton(
          isActive: value == true,
          activeIcon: Lesson12Assets.likeActive,
          defaultIcon: Lesson12Assets.likeDefault,
          onTap: () => onChanged(value == true ? null : true),
        ),
      ],
    );
  }
}

class _RatingButton extends StatefulWidget {
  const _RatingButton({
    required this.isActive,
    required this.activeIcon,
    required this.defaultIcon,
    required this.onTap,
  });

  final bool isActive;
  final String activeIcon;
  final String defaultIcon;
  final VoidCallback onTap;

  @override
  State<_RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<_RatingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_RatingButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isActive != widget.isActive) {
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.isActive
                ? Color(0xFF2358D1)
                : Color.fromRGBO(19, 19, 30, 0.04),
            borderRadius: BorderRadius.circular(32),
            boxShadow: widget.isActive
                ? null
                : [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 1),
                    ),
                  ],
          ),
          child: Image.asset(
            widget.isActive ? widget.activeIcon : widget.defaultIcon,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
