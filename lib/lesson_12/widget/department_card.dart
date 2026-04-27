import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_12/entity/category_rating.dart';
import 'package:rd_first_project/lesson_12/entity/department_rating.dart';
import 'package:rd_first_project/lesson_12/widget/category_row.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({
    required this.department,
    required this.commentController,
    required this.onCategoryChanged,
    super.key,
  });

  final DepartmentRating department;
  final TextEditingController commentController;
  final void Function(CategoryRating category, bool? newValue)
  onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              department.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF13131E),
              ),
            ),
          ),
          ...department.categories.map(
            (cat) => CategoryRow(
              name: cat.name,
              value: cat.isLiked,
              onChanged: (newValue) => onCategoryChanged(cat, newValue),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: TextField(
              controller: commentController,
              style: TextStyle(color: Color(0xFF202124)),
              decoration: InputDecoration(
                hintText: 'Розкажіть докладніше',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(32, 33, 36, 0.54),
                  fontSize: 16,
                ),
                contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
