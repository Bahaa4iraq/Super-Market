import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Model/customerModel.dart';

class CustomerController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController searchCust = TextEditingController();
  Rx<TextEditingController> search = TextEditingController().obs;

  CustomerModel model = CustomerModel();
  TextEditingController price = TextEditingController();
  TextEditingController details = TextEditingController();

  List custList = [].obs;
  List resSearch = [].obs;
  RxInt total = 0.obs;
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
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
            duration: const Duration(seconds: 1),
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
    update();
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
            duration: const Duration(seconds: 1),
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
    update();
  }

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
            duration: const Duration(seconds: 1),
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
    update();
  }

  Future getCustomers() async {
    List<Map> res = await model.getAllCustomer();
    custList.clear();

    custList.addAll(res);
    update();
  }

  Future getSearchCustomers() async {
    List<Map> res = await model.search(search.value.text.trim());
    custList.clear();

    custList.addAll(res);
    update();
  }

  Future<int> getHitory(int id) async {
    List<Map> res = await model.getMoneyHistoryOfUser(id);
    resSearch.clear();

    resSearch.addAll(res);
    total.value = 0;
    resSearch.forEach(
        (e) => total.value = total.value + int.parse("${e['amount']}"));
    update();

    return total.value;
  }

  Future delPaymentFromUser(BuildContext context, int id) async {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: UIColor.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: UIColor.red,
                  ),
                  const Text(
                    "تنبيه",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              content: const Text(
                "هل انت متأكد من الحذف",
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.black),
              ),
              actionsAlignment: MainAxisAlignment.start,
              actions: [
                OutlinedButton(
                    style: ElevatedButton.styleFrom(primary: UIColor.red),
                    onPressed: () async {
                      int res = await model.deleteFromUserHistory(id);
                      if (res >= 0) {
                        resSearch.removeWhere((element) => element['id'] == id);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: UIColor.red,
                            content: const Text(
                              "تم الحذف نجاح",
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
                      Navigator.pop(context);
                      update();
                    },
                    child: Text(
                      "موافق",
                      style: TextStyle(color: UIColor.white),
                    )),
                OutlinedButton(
                    style: ElevatedButton.styleFrom(primary: UIColor.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "الغاء",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ));
  }

  Future delUser(BuildContext context, int id) async {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: UIColor.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: UIColor.red,
                  ),
                  const Text(
                    "تنبيه",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              content: const Text(
                "هل انت متأكد من الحذف",
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.black),
              ),
              actionsAlignment: MainAxisAlignment.start,
              actions: [
                OutlinedButton(
                    style: ElevatedButton.styleFrom(primary: UIColor.red),
                    onPressed: () async {
                      int res = await model.deleteUser(id);
                      if (res >= 0) {
                        resSearch.removeWhere((element) => element['id'] == id);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: UIColor.red,
                            content: const Text(
                              "تم الحذف نجاح",
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
                      Navigator.pop(context);
                      update();
                    },
                    child: Text(
                      "موافق",
                      style: TextStyle(color: UIColor.white),
                    )),
                OutlinedButton(
                    style: ElevatedButton.styleFrom(primary: UIColor.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "الغاء",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ));
  }

  Future updateUserInfo(BuildContext context, int id) async {
    if (name.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: UIColor.red,
          content: const Text(
            "قم بكتابة الاسم اولا",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          )));
    } else {
      int res =
          await model.editUser(id, {"name": name.text, "phone": phone.text});
      if (res != 0) {
        name.clear();
        phone.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            backgroundColor: UIColor.red,
            content: const Text(
              "تم التعديل نجاح",
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
    update();
  }
}
