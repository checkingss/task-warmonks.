import 'package:flutter/cupertino.dart';

class BuildTextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final String? fontFamily;
  const BuildTextWidget(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.fontWeight,
      this.fontFamily});

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          fontSize: widget.size,
          fontWeight: widget.fontWeight,
          fontFamily: widget.fontFamily),
    );
  }
}
