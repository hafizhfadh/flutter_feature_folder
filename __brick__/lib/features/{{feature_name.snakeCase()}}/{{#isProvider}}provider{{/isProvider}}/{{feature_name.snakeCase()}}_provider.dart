import 'package:flutter/material.dart';
import 'package:{{{fullPath}}}/domains/domains.dart';

class {{feature_name.pascalCase()}}Notifier with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
