import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/core/constants/lists.dart';
import 'package:flutter_design_patterns/core/extensions/string_extension.dart';
import 'package:flutter_design_patterns/data/models/pattern_category.dart';
import 'package:flutter_design_patterns/data/models/pattern_category_item.dart';
import 'package:flutter_design_patterns/data/repository/patterns_repository.dart';
import 'package:flutter_design_patterns/dotted_border_painter.dart';
import 'package:flutter_design_patterns/screens/pattern_example_screen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final PattersRepository _patternsRepository = PattersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<PatternCategory>>(
          future: Future.value(
            _patternsRepository.getPatternsByCategory(catalogItems),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No patterns available.'));
            }

            final patternsByCategory = snapshot.data!;

            return ListView.builder(
              itemCount: patternsByCategory.length,
              itemBuilder: (context, index) {
                final category = patternsByCategory[index];
                return ExpansionTile(
                  title: Text(category.name.capitalize, style: Theme.of(context).textTheme.titleLarge),
                  backgroundColor: Colors.grey[200],
                  iconColor: Colors.black,
                  initiallyExpanded: true,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                          ),
                      itemCount: category.items.length,
                      itemBuilder: (context, itemIndex) {
                        final item = category.items[itemIndex];
                        return _CatalogCard(item: item);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _CatalogCard extends StatelessWidget {
  final PatternCategoryItem item;

  const _CatalogCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WidgetShowcaseScreen(
              title: item.name,
              icon: item.icon,
              builder: item.builder,
            ),
          ),
        );
      },
      child: CustomPaint(
        painter: DottedBorderPainter(
          color: Colors.grey,
          strokeWidth: 1,
          dashWidth: 1,
          gapWidth: 1,
        ),
        child: Card(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.all(2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 36, color: theme.colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                item.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
