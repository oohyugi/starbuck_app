import 'package:flutter/material.dart';

class SingleSelectChip extends StatefulWidget {
  final List<String> itemList;
  final bool autoSelectFirstItem;
  final Function(String) onSelectionChanged; // +added
  SingleSelectChip(this.itemList,
      {this.onSelectionChanged, this.autoSelectFirstItem = false} // +added
      );

  @override
  _SingleSelectChipState createState() => _SingleSelectChipState();
}

class _SingleSelectChipState extends State<SingleSelectChip> {
  String selectedChoice = "";

  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.itemList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          backgroundColor: Colors.grey[200],
          label: Text(item),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              widget.onSelectionChanged(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  void initState() {
    if (widget.autoSelectFirstItem) {
      selectedChoice = widget.itemList[0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
