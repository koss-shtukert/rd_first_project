import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_12/constants/assets.dart';

class StarRating extends StatelessWidget {
  const StarRating({required this.rating, required this.onChanged, super.key});

  final int rating;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () => onChanged(index + 1),
            child: AnimatedScale(
              scale: index < rating ? 1.0 : 0.9,
              duration: const Duration(milliseconds: 200),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: SizedBox(
                  key: ValueKey(index < rating),
                  width: 48,
                  height: 48,
                  child: Image.asset(
                    index < rating
                        ? Lesson12Assets.ratingFilled
                        : Lesson12Assets.ratingEmpty,
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
