import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

class BuildTexFormFieldWidget extends StatefulWidget {
  final String? Function(String?)? validation;
  final TextEditingController controller;
  final bool? obscure;
  final String hintText;
  final Widget? suffix;
  final double? radius;
  final TextInputType? keyBoardType;
  const BuildTexFormFieldWidget(
      {super.key,
      this.validation,
      required this.controller,
      this.obscure,
      required this.hintText,
      this.suffix,
      this.radius,
      this.keyBoardType});

  @override
  State<BuildTexFormFieldWidget> createState() =>
      _BuildTexFormFieldWidgetState();
}

class _BuildTexFormFieldWidgetState extends State<BuildTexFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyBoardType,
      cursorColor: Constants.kitGradients[1],
      validator: (value) => widget.validation!(value),
      controller: widget.controller,
      onTap: () {},
      style: TextStyle(
        height: 2.1,
        color: Constants.kitGradients[1],
      ),
      obscureText: widget.obscure ?? false,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(10),
        fillColor: Colors.green.withOpacity(0.1),
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Constants.kitGradients[1],
        ),
        suffixIcon: widget.suffix,
      ),
    );
  }
}
