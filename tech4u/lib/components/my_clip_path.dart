import 'package:flutter/material.dart';

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.3557143);
    path.quadraticBezierTo(size.width * 0.1037500, size.height * 0.5135714,
        size.width * 0.5000000, size.height * 0.2142857);
    path.quadraticBezierTo(size.width * 0.6645833, size.height * 0.1153571,
        size.width, size.height * 0.4285714);

    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
