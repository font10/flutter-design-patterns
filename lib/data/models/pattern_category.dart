import 'package:flutter_design_patterns/data/models/pattern_category_item.dart';

class PatternCategory {
  final String name;
  final List<PatternCategoryItem> items;

  PatternCategory({required this.name, required this.items});
}