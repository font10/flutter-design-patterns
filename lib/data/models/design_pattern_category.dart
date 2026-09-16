import 'package:flutter_design_patterns/data/models/design_pattern.dart';

class DesignPatternCategory {
  final String id;
  final String title;
  final int color;
  final List<DesignPattern> patterns;

  const DesignPatternCategory({
    required this.id,
    required this.title,
    required this.color,
    required this.patterns,
  });

  factory DesignPatternCategory.fromJson(Map<String, dynamic> json) {
    var designPatternJsonList = json['patterns'] as List;
    var designPatternList = designPatternJsonList
        .map((designPatternJson) =>
            DesignPattern.fromJson(designPatternJson as Map<String, dynamic>))
        .toList();

    return DesignPatternCategory(
      id: json['id'] as String,
      title: json['title'] as String,
      color: int.parse(json['color'] as String),
      patterns: designPatternList,
    );
  }
}
