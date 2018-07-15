import 'package:first_flutter_app/domain/model/StackOverflowFilter.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  @override
  State createState() {
    return FilterState();
  }
}

List<String> activeFilters = List();

class FilterState extends State<FilterWidget> with SingleTickerProviderStateMixin {
  final List<StackOverflowFilter> filterTags = StackOverflowFilter.getFilters();

  FilterState() {
    if (activeFilters.isEmpty) {
      activeFilters.add(filterTags.elementAt(3).name);
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