import 'package:flutter/material.dart';{{#isProvider}}
import 'package:{{{fullPath}}}/provider/provider.dart';{{/isProvider}}
import 'package:{{{fullPath}}}/widgets/widgets.dart';

/// {@template {{feature_name.snakeCase()}}_screen}
/// A description for {{feature_name.pascalCase()}}Screen
/// {@endtemplate}
class {{feature_name.pascalCase()}}Screen extends StatelessWidget {
  /// {@macro {{feature_name.snakeCase()}}_screen}
  const {{feature_name.pascalCase()}}Screen({super.key});

  /// The static route for {{feature_name.pascalCase()}}Screen
  static String routeName = '/{{feature_name.snakeCase()}}';

  {{#isProvider}}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => {{feature_name.pascalCase()}}Notifier(),
      child: const Scaffold(
        body: {{feature_name.pascalCase()}}View(),
      ),
    );
  }
  {{/isProvider}}
  {{#isRiverpod}}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: {{feature_name.pascalCase()}}View(),
    );
  }
  {{/isRiverpod}}
  {{#isNone}}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: {{feature_name.pascalCase()}}View(),
    );
  }
  {{/isNone}}
}

/// {@template {{feature_name.snakeCase()}}_view}
/// Displays the Body of {{feature_name.pascalCase()}}View
/// {@endtemplate}
class {{feature_name.pascalCase()}}View extends StatelessWidget {
  /// {@macro {{feature_name.snakeCase()}}_view}
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return const {{feature_name.pascalCase()}}Widget();
  }
}
