import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget{

  @override
  State createState() {
    return FilterState();
  }
}

List<String> activeFilters = List();

class FilterState extends State<FilterWidget>{

  final List<StackOverflowFilter> filterTags = StackOverflowFilter.getFilters();

  FilterState(){
    if(activeFilters.isEmpty) {
      activeFilters.add(filterTags
          .elementAt(3)
          .name);
    }
  }

  Iterable<Widget> filterWidgets() sync* {
    for (StackOverflowFilter tag in filterTags) {
      yield Padding(
        padding: EdgeInsets.all(8.0),
        child: FilterChip(
          label: Text(tag.name),
          selected: activeFilters.contains(tag.name),
          backgroundColor: tag.backgroundColor,
          selectedColor: tag.selectedColor,
          onSelected: (isSelected) {
            setState(() {
              if (isSelected) {
                activeFilters.clear();
                activeFilters.add(tag.name);
              } else {
                activeFilters.remove(tag.name);
              }
              print(activeFilters);
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Filter"),
        elevation: 0.0,
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: filterWidgets().toList(),
        ),
      ),
    );
  }
}


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
