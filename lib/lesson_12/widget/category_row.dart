import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_12/widget/like_dislike_buttons.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    required this.name,
    required this.value,
    required this.onChanged,
    super.key,
  });
  
  final String name;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF13131E).withValues(alpha: 0.04)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Color.fromRGBO(32, 33, 36, 0.87),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 12),
          LikeDislikeButtons(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
