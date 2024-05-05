import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project_warmonks/Utils/constants.dart';
import 'package:sample_project_warmonks/utils/utils.dart';

import 'build_text_widget.dart';

class BuildCommonButton extends StatefulWidget {
  final String Text;
  final Function? onPressed;
  const BuildCommonButton({super.key, this.onPressed, required this.Text});

  @override
  State<BuildCommonButton> createState() => _BuildCommonButtonState();
}

class _BuildCommonButtonState extends State<BuildCommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed!();
      },
      child: Container(
        width: screenWidth(context, dividedBy: 1.3),
        height: screenHeight(context, dividedBy: 13),
        decoration: BoxDecoration(
            color: Constants.kitGradients[2],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: BuildTextWidget(
              text: widget.Text, color: Constants.kitGradients[0]),
        ),
      ),
    );
  }
}
