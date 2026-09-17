import 'package:flutter/material.dart';

class WidgetShowcaseScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget Function(BuildContext) builder;

  const WidgetShowcaseScreen({
    required this.title,
    required this.icon,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: builder(context),
      ),
    );
  }
}
