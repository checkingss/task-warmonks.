import 'package:flutter/material.dart';
import 'package:sample_project_warmonks/Utils/constants.dart';
import 'package:sample_project_warmonks/views/widgets/build_text_widget.dart';

class Savedview extends StatefulWidget {
  const Savedview({super.key});

  @override
  State<Savedview> createState() => _SavedviewState();
}

class _SavedviewState extends State<Savedview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BuildTextWidget(
        text: 'Saved',
        color: Constants.kitGradients[1],
        size: 30,
        fontWeight: FontWeight.bold,
      )),
    );
  }
}
