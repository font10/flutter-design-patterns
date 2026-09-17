import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/core/constants/enums.dart';

class PatternCategoryItem {
  final String name;
  final IconData icon;
  final PatternCategoryType category;
  final Widget Function(BuildContext) builder;

  const PatternCategoryItem({
    required this.name,
    required this.icon,
    required this.category,
    required this.builder,
  });
}