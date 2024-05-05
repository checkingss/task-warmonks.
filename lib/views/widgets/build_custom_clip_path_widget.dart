import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ClipTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();

    // center top point
    path.lineTo(width * 1.0, 0);

    // bottom right point
    path.lineTo(width, height);

    // bottom left point
    path.lineTo(0, height);

    // close to center top point
    path.lineTo(width * 1.0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
