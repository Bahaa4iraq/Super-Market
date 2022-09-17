import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Model/customerModel.dart';

class CustomerViewModel extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController searchCust = TextEditingController();

  CustomerModel model = CustomerModel();
  List custList = [];
  List resSearch = [];
  List totalList = [];
  int total = 0;

  Future addNewCustomer(BuildContext context) async {
    if (name.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: UIColor.red,
          content: const Text(
            "قم بكتابة الاسم اولا",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          )));
    } else {
      int res = await model.addNewCustomer({
        "name": name.text,
        "phone": phone.text,
        "type": "customer",
      });
      if (res != 0) {
        name.clear();
        phone.clear();
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

  Future getCustomers() async {
    List<Map> res = await model.getAllCustomer();
    custList.clear();

    custList.addAll(res);
    notifyListeners();
  }

  Future getHitory(int id) async {
    List<Map> res = await model.getMoneyHistoryOfUser(id);
    custList.clear();
    totalList.clear();
    totalList.addAll(res);
    custList.addAll(res);
    total = 0;
    totalList.forEach((e) => total = total + int.parse("${e['amount']}"));
    print(total);
    notifyListeners();
  }
}
