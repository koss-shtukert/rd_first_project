import 'package:rd_first_project/lesson_12/entity/category_rating.dart';

class DepartmentRating {
  DepartmentRating({required this.name, required this.categories});

  final String name;
  final List<CategoryRating> categories;
}
