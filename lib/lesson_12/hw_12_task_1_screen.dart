import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_12/entity/category_rating.dart';
import 'package:rd_first_project/lesson_12/entity/department_rating.dart';
import 'package:rd_first_project/lesson_12/widget/department_card.dart';
import 'package:rd_first_project/lesson_12/widget/general_comment_section.dart';
import 'package:rd_first_project/lesson_12/widget/section_title.dart';
import 'package:rd_first_project/lesson_12/widget/star_rating.dart';
import 'package:rd_first_project/lesson_12/widget/submit_button.dart';

class Hw12Task1Screen extends StatefulWidget {
  const Hw12Task1Screen({super.key});

  @override
  State<Hw12Task1Screen> createState() => _Hw12Task1ScreenState();
}

class _Hw12Task1ScreenState extends State<Hw12Task1Screen> {
  int _starRating = 4;
  final _departments = [
    DepartmentRating(
      name: 'Випічка',
      categories: [
        CategoryRating(name: 'Обслуговування', isLiked: false),
        CategoryRating(name: 'Асортимент', isLiked: true),
      ],
    ),
    DepartmentRating(
      name: 'Лавка традицій',
      categories: [
        CategoryRating(name: 'Обслуговування', isLiked: true),
        CategoryRating(name: 'Асортимент'),
      ],
    ),
  ];
  final _departmentComments = <String, TextEditingController>{};
  final _generalComment = TextEditingController();

  @override
  void initState() {
    super.initState();

    for (final dept in _departments) {
      _departmentComments[dept.name] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final c in _departmentComments.values) {
      c.dispose();
    }

    _generalComment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 242, 252, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF202124),
        title: Text(
          'Оцінка візиту до магазину',
          style: TextStyle(
            color: Color(0xFF202124),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  StarRating(
                    rating: _starRating,
                    onChanged: (value) => setState(() => _starRating = value),
                  ),
                  SectionTitle(text: 'Яку оціночку поставите відділам?'),
                  ..._departments.map(
                    (dept) => DepartmentCard(
                      department: dept,
                      commentController: _departmentComments[dept.name]!,
                      onCategoryChanged: (category, newValue) => setState(() {
                        category.isLiked = newValue;
                      }),
                    ),
                  ),
                  GeneralCommentSection(controller: _generalComment),
                ],
              ),
            ),
          ),
          SubmitButton(onPressed: () {}),
        ],
      ),
    );
  }
}
