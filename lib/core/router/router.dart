import 'package:go_router/go_router.dart';

import 'package:flutter_design_patterns/core/constants/constants.dart';
import 'package:flutter_design_patterns/screens/main_menu/main_menu.dart';

final GoRouter router = GoRouter(
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: initialRoute,
      builder: (context, state) => const MainMenu(),
    ),
    /*GoRoute(
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
    ),*/
  ],
);
