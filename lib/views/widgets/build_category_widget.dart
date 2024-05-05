import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class BuildFootwareDropdownWidget extends StatefulWidget {
  final String items;
  final Function(String?) selectedValue;
  const BuildFootwareDropdownWidget(
      {super.key, required this.selectedValue, required this.items});

  @override
  State<BuildFootwareDropdownWidget> createState() =>
      _BuildFootwareDropdownWidgetState();
}

class _BuildFootwareDropdownWidgetState
    extends State<BuildFootwareDropdownWidget> {
  @override
  String dropdownValue = '6';
  String footwareSizeValue = '';

  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context, dividedBy: 14.5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          // Step 3.
          value: dropdownValue,
          // Step 4.
          items: <String>[widget.items]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                width: screenWidth(context, dividedBy: 1.3),
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            );
          }).toList(),
          // Step 5.
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              widget.selectedValue(dropdownValue);
            });
          },
        ),
      ),
    );
  }
}
