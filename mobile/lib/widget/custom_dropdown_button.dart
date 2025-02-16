import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> list;
  final String title;
  final Function(String?)? onSelect;
  final String dropdownValue;

  CustomDropdownButton({
    super.key,
    required this.list,
    required this.title,
    required this.dropdownValue,
    this.onSelect,
  });

  @override
  State<CustomDropdownButton> createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.dropdownValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 18),
        ),
        if (widget.title != '') const Text('：'),
        DropdownButton<String>(
          value: widget.dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (String? value) {
            // When a button is selected, assign the unit attribute to the corresponding value
            // and call the updateBarGroups method to update the barGroups.
            if (value != null) {
              setState(() {
                dropdownValue = value;
              });
            }
          },
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              onTap: () {
                widget.onSelect?.call(value);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  String getValue() {
    return widget.dropdownValue;
  }
}
