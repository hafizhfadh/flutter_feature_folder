import 'package:flutter/material.dart';{{#isProvider}}
import 'package:{{{fullPath}}}/provider/providers.dart';{{/isProvider}}{{#isRiverpod}}
import 'package:{{{fullPath}}}/provider/providers.dart';{{/isRiverpod}}

/// {@template {{feature_name.snakeCase()}}_body}
/// Body of the {{feature_name.pascalCase()}}Page.
///
/// Add what it does
/// {@endtemplate}
class {{feature_name.pascalCase()}}Widget {{#isProvider}}extends StatelessWidget{{/isProvider}}{{#isNone}}extends StatelessWidget{{/isNone}}{{#isRiverpod}}extends ConsumerWidget{{/isRiverpod}} {
  /// {@macro {{feature_name.snakeCase()}}_widget}
  const {{feature_name.pascalCase()}}Widget({super.key});
  {{#isProvider}}
  @override
  Widget build(BuildContext context) {
    return Consumer<{{feature_name.pascalCase()}}Notifier>(
      builder: (context, state, child) {
        return Center(child: Text(state.count.toString()));
      },
    );
  }
  {{/isProvider}}
  {{#isRiverpod}}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch({{feature_name.camelCase()}}Provider);
    return Text(count.toString());
  }
  {{/isRiverpod}}
  {{#isNone}}
  @override
  Widget build(BuildContext context) {
    return const Center(child:Text('{{feature_name.pascalCase()}}Widget'));
  }
  {{/isNone}}
}
