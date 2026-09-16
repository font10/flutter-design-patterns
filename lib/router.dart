import 'package:go_router/go_router.dart';

import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern.dart';
import 'package:flutter_design_patterns/data/models/design_pattern_category.dart';
import 'package:flutter_design_patterns/screens/category/category.dart';
import 'package:flutter_design_patterns/screens/design_pattern_details/design_pattern_details.dart';
import 'package:flutter_design_patterns/screens/main_menu/main_menu.dart';
import 'package:flutter_design_patterns/widgets/introduction/introduction.dart';

final GoRouter router = GoRouter(
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: initialRoute,
      builder: (context, state) => const MainMenu(),
    ),
    GoRoute(
      path: '$categoryRoute/:id',
      builder: (context, state) {
        final category = state.extra as DesignPatternCategory;
        return Category(category: category);
      },
    ),
    GoRoute(
      path: '/introduction/:id',
      builder: (context, state) {
        final designPattern = state.extra as DesignPattern;
        return DesignPatternDetails(
          designPattern: designPattern,
          example: const Introduction(),
        );
      },
    ),
  ],
);
