import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/router.dart';
import 'package:flutter_design_patterns/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Design Patterns App',
      theme: lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() => runApp(const App());
