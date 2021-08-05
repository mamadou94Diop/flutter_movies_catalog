import 'package:flutter/material.dart';

class ChipFiltersWidget extends StatefulWidget {
  final List<String> filters;

 final void Function(List<String> value) onFilterChanged  ;


  const ChipFiltersWidget({Key key, this.filters, this.onFilterChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChipFiltersState();
  }
}

class _ChipFiltersState extends State<ChipFiltersWidget> {
  List<String> _selectedFilters = [];

  onChipTapped(int index, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedFilters.add(widget.filters[index]);
        print(_selectedFilters);
      } else {
        int indexOf = _selectedFilters.indexOf(widget.filters[index]);
        _selectedFilters.removeAt(indexOf);
      }
      widget.onFilterChanged(_selectedFilters);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true, // use it
        scrollDirection: Axis.horizontal,
        children: _buildChipFilters(widget.filters));
  }

  List<Widget> _buildChipFilters(List<String> filters) {
    List<Widget> chips = new List();

    for (int index = 0; index < filters.length; index++) {
      FilterChip filterChip = FilterChip(
        label: Text(
          filters[index],
          style: TextStyle(color: Colors.black),
        ),
        selected: _selectedFilters.any((element) => filters[index] == element),
        selectedColor: Colors.yellowAccent,
        showCheckmark: false,
        shadowColor: Colors.black26,
        elevation: 10,
        pressElevation: 5,
        onSelected: (bool isSelected) {
          onChipTapped(index, isSelected);
        },
      );

      chips.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: filterChip,
      ));
    }
    return chips;
  }
}
