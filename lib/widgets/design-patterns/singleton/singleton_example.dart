import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/core/constants/constants.dart' as LayoutConstants;
import 'package:flutter_design_patterns/design-patterns/singleton/example_state_base.dart';
import 'package:flutter_design_patterns/design-patterns/singleton/example_state_by_definition.dart';
import 'package:flutter_design_patterns/design-patterns/singleton/example_state_without_singleton.dart';
import 'package:flutter_design_patterns/widgets/design-patterns/singleton/singleton_example_card.dart';

class SingletonExample extends StatefulWidget {
  const SingletonExample({super.key});

  @override
  _SingletonExampleState createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  final List<ExampleStateBase> stateList = [
    ExampleStateByDefinition.getState(),
    ExampleStateWithoutSingleton()
  ];

  void _setTextValues([String text = 'Singleton']) {
    for (final state in stateList) {
      state.setStateText(text);
    }
    setState(() {});
  }

  void _reset() {
    for (final state in stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          children: <Widget>[
            for (var state in stateList)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: LayoutConstants.paddingL,
                ),
                child: SingletonExampleCard(
                  text: state.currentText,
                ),
              ),
            const SizedBox(height: LayoutConstants.spaceL),
            ElevatedButton(
              onPressed: _setTextValues,
              child: const Text("Change states' text to 'Singleton'"),
            ),
            ElevatedButton(
              onPressed: () => _reset(),
              child: const Text('Reset'),
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            const Text(
              "Note: change states' text and navigate the application (e.g. go to main menu, then go back to this example) to see how the Singleton state behaves!",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}