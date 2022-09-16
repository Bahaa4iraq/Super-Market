import 'package:flutter/material.dart';

import '../Constant/Colors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.context,
    required this.title,
    required this.active,
  }) : super(key: key);
  final BuildContext context;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      width: active ? size.width * 0.25 : size.width * 0.18,
      height: 50,
      decoration: BoxDecoration(
          boxShadow: UIColor.shadow,
          borderRadius: BorderRadius.circular(10),
          color: active ? UIColor.red : UIColor.white),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: active ? 17 : 14),
      ),
    );
  }
}
