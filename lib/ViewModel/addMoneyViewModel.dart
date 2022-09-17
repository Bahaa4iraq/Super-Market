import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constant/Colors.dart';
import '../Model/customerModel.dart';

class AddMoneyCustomer extends ChangeNotifier {
  TextEditingController price = TextEditingController();
  TextEditingController details = TextEditingController();
  CustomerModel model = CustomerModel();
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String time = DateFormat("hh:mm a").format(DateTime.now());

  Future addMoneyCustomer(BuildContext context, int id) async {
    if (price.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: UIColor.red,
          content: const Text(
            "قم بكتابة المبلغ اولا",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          )));
    } else {
      int res = await model.addMoneyToUser({
        "amount": int.parse(price.text) * -1,
        "details": details.text,
        "user_id": id,
        "type": "صرف",
        "data": date,
        "time": time
      });
      if (res != 0) {
        price.clear();
        details.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: UIColor.red,
            content: const Text(
              "تمت الاضافة نجاح",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: UIColor.red,
            content: const Text(
              "هناك خطا ما",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )));
      }
    }
    notifyListeners();
  }

  Future getMoneyCustomer(BuildContext context, int id) async {
    if (price.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: UIColor.red,
          content: const Text(
            "قم بكتابة المبلغ اولا",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          )));
    } else {
      int res = await model.addMoneyToUser({
        "amount": int.parse(price.text),
        "details": details.text,
        "user_id": id,
        "type": "قبض",
        "data": date,
        "time": time
      });
      if (res != 0) {
        price.clear();
        details.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: UIColor.red,
            content: const Text(
              "تمت الاضافة نجاح",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: UIColor.red,
            content: const Text(
              "هناك خطا ما",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )));
      }
    }
    notifyListeners();
  }
}
