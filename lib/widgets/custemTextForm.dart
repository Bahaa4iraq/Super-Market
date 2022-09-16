import 'package:flutter/material.dart';

import '../Constant/Colors.dart';

class CustemTextForm extends StatelessWidget {
  const CustemTextForm(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.type,
      required this.hint})
      : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      expands: true,
      minLines: null,
      maxLines: null,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: UIColor.red,
        ),
        contentPadding: const EdgeInsets.only(top: 3, right: 10),
        filled: true,
        fillColor: UIColor.red.withOpacity(0.2),
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: UIColor.red, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: UIColor.red, width: 2)),
      ),
    );
  }
}
