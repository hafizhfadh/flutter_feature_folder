import 'package:{{{fullPath}}}/domains/services/i{{feature_name.snakeCase()}}.dart';

class {{feature_name.pascalCase()}}Service implements I{{feature_name.pascalCase()}} {

  @override
  Future<int?> someFunctionName({required String s}) async {
    // TODO: implement function
    throw UnimplementedError();
  }
}