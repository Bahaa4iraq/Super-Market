import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';

class CliperAbove extends StatelessWidget {
  const CliperAbove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustemCilper(),
      child: Container(
        decoration: BoxDecoration(color: UIColor.red),
      ),
    );
  }
}

class MyCustemCilper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var w = size.width;
    var h = size.height;
    path.quadraticBezierTo(w * 0.5, h * 1.95, w, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
