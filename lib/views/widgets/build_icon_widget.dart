import 'package:flutter/cupertino.dart';

class BuildIconWidget extends StatefulWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  const BuildIconWidget({super.key, required this.icon, this.color, this.size});

  @override
  State<BuildIconWidget> createState() => _BuildIconWidgetState();
}

class _BuildIconWidgetState extends State<BuildIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icon,
      color: widget.color,
      size: widget.size,
    );
  }
}
