import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

void run(HookContext context) async {
  String featureName = context.vars['feature_name'] as String;
  String workingDirectory = Directory.current.path + "/lib/features/";
  Logger logger = context.logger;
  String stateManagement =
      context.vars['state_management'].toString().toLowerCase();
  bool isProvider = stateManagement == 'provider';
  bool isRiverpod = stateManagement == 'riverpod';
  bool isNone = !isProvider && !isRiverpod;

  List<String> folders;

  try {
    if (Platform.isWindows) {
      folders = workingDirectory.split(r'\').toList();
    } else {
      folders = workingDirectory.split('/').toList();
    }
    final libIndex = folders.indexWhere((folder) => folder == 'lib');
    final featurePath = folders.sublist(libIndex + 1, folders.length).join('/');
    final pubSpecFile =
        File('${folders.sublist(0, libIndex).join('/')}/pubspec.yaml');
    final content = await pubSpecFile.readAsString();
    final yamlMap = loadYaml(content);
    final packageName = yamlMap['name'];

    if (packageName == null) {
      throw PubspecNameException();
    }

    context.vars = {
      ...context.vars,
      'fullPath': ('$packageName/$featurePath/${context.vars['feature_name']}')
          .replaceAll('//', '/'),
      'isProvider': isProvider,
      'isRiverpod': isRiverpod,
      'isNone': isNone,
    };
  } on RangeError catch (_) {
    logger.alert(
      'Could not find lib folder in $workingDirectory',
    );
    logger.alert(
      'Re-run this brick inside your lib folder',
    );
    throw Exception();
  } on FileSystemException catch (_) {
    logger.alert(
      'Could not find pubspec.yaml folder in ${workingDirectory.replaceAll('\\lib', '')}',
    );

    throw Exception();
  } on PubspecNameException catch (_) {
    logger.alert(
      'Could not read package name in pubspec.yaml}',
    );
    logger.alert(
      'Does your pubspec have a name: ?',
    );
    throw Exception();
  } on Exception catch (e, s) {
    logger.alert(
      'An error occurred while running this brick: $e',
    );
    logger.alert(
      'Stack trace: $s',
    );
    throw Exception();
  }
}

class PubspecNameException implements Exception {}
