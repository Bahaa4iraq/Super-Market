import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class LoginController extends GetxController {
  String userName = "ahmed622";
  String passWord = "Aa123123";
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  bool login() {
    if (userNameController.text == userName &&
        passWordController.text == passWord) {
      sharePref.setString("name", userName);

      return true;
    } else {
      return false;
    }
  }
}
