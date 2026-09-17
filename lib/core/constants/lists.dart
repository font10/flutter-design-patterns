import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/core/constants/enums.dart';
import 'package:flutter_design_patterns/data/models/pattern_category_item.dart';
import 'package:flutter_design_patterns/widgets/design-patterns/singleton/singleton_example.dart';

final List<PatternCategoryItem> catalogItems = [
  PatternCategoryItem(
    name: 'Singleton',
    icon: Icons.text_fields,
    category: PatternCategoryType.creational,
    builder: (_) => const SingletonExample(),
  ),
  PatternCategoryItem(
    name: 'Factory',
    icon: Icons.factory,
    category: PatternCategoryType.creational,
    builder: (_) => const SingletonExample(),
  ),
  PatternCategoryItem(
    name: 'Adapter',
    icon: Icons.deck_rounded,
    category: PatternCategoryType.structural,
    builder: (_) => const SingletonExample(),
  ),
  PatternCategoryItem(
    name: 'Flyweight',
    icon: Icons.flaky,
    category: PatternCategoryType.behavioral,
    builder: (_) => const SingletonExample(),
  ),
];