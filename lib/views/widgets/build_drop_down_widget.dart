import 'package:flutter/material.dart';
import 'package:sample_project_warmonks/utils/utils.dart';

class BuildDropDownButtonFormFieldWidget extends StatelessWidget {
  final List<String> list;
  final Function ontap;
  final String? hindtext;
  final Color? color;
  final String value;
  final Color? fillColor;
  final String? Function(String?)? validator;

  const BuildDropDownButtonFormFieldWidget({
    Key? key,
    required this.list,
    required this.ontap,
    this.hindtext,
    required this.value,
    this.color,
    this.validator,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context, dividedBy: 15),
      color: Colors.green.withOpacity(0.1),
      child: DropdownButtonFormField<String>(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 20)),
        key: UniqueKey(),
        validator: validator,
        items: list.map((value) {
          return DropdownMenuItem(value: value, child: Text(value));
        }).toList(),
        onChanged: (selectedValue) {
          ontap(selectedValue); // Pass the selected value to ontap function
        },
        decoration: InputDecoration(
          fillColor: fillColor,
          hintText: hindtext,
          hintStyle: TextStyle(color: color),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
