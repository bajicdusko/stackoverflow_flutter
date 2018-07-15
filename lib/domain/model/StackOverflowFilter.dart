import 'package:flutter/material.dart';

class StackOverflowFilter {
  final String name;
  final bool isSelected;
  final Color _defaultColor;
  Color backgroundColor;
  Color selectedColor;

  StackOverflowFilter(this.name, this._defaultColor,
      [this.isSelected = false]) {
    backgroundColor = _defaultColor.withAlpha(64);
    selectedColor = _defaultColor;
  }

  static List<StackOverflowFilter> getFilters() {
    return [
      StackOverflowFilter("java", Colors.brown),
      StackOverflowFilter("swift", Colors.orange),
      StackOverflowFilter("kotlin", Colors.deepOrange),
      StackOverflowFilter("android", Colors.green, true),
      StackOverflowFilter("flutter", Colors.blue),
      StackOverflowFilter("csharp", Colors.purple),
    ];
  }
}