import 'package:flutter_design_patterns/core/constants/enums.dart';
import 'package:flutter_design_patterns/data/models/pattern_category.dart';
import 'package:flutter_design_patterns/data/models/pattern_category_item.dart';

class PattersRepository {
  PattersRepository();

  List<PatternCategory> getPatternsByCategory(
    List<PatternCategoryItem> catalogItems,
  ) {
    final Map<PatternCategoryType, List<PatternCategoryItem>>
    patternsByCategory = {};

    for (var item in catalogItems) {
      if (!patternsByCategory.containsKey(item.category)) {
        patternsByCategory[item.category] = [];
      }
      patternsByCategory[item.category]!.add(item);
    }

    return patternsByCategory.entries
        .map(
          (entry) => PatternCategory(name: entry.key.name, items: entry.value),
        )
        .toList();
  }
}
