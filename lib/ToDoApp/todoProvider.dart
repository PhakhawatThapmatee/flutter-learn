import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String title, String content) {
    _items.add("$title: $content");
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
