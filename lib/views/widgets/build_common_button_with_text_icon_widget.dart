import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project_warmonks/Utils/constants.dart';
import 'package:sample_project_warmonks/utils/utils.dart';
import 'package:sample_project_warmonks/views/widgets/build_icon_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_text_widget.dart';

class BuildCommonButtonWithTextIconWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final double width;
  final String text;
  final IconData icon;
  final Color? iconColor;
  const BuildCommonButtonWithTextIconWidget(
      {super.key,
      required this.onPressed,
      required this.width,
      required this.text,
      required this.icon,
      this.iconColor});

  @override
  State<BuildCommonButtonWithTextIconWidget> createState() =>
      _BuildCommonButtonWithTextIconWidgetState();
}

class _BuildCommonButtonWithTextIconWidgetState
    extends State<BuildCommonButtonWithTextIconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: screenHeight(context, dividedBy: 18),
        width: widget.width,
        decoration: BoxDecoration(
            color: Constants.kitGradients[0],
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Constants.kitGradients[2])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildIconWidget(icon: widget.icon, color: widget.iconColor),
            SizedBox(
              width: 5,
            ),
            BuildTextWidget(
              text: widget.text,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
