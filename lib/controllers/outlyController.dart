import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Model/outlyModel.dart';

class OutlyController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController details = TextEditingController();

  OutlyModel model = OutlyModel();

  List outlyList = [].obs;
  List totalList = [].obs;

  RxInt total = 0.obs;
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String totalDate = DateFormat("yyyy-MM").format(DateTime.now());
  String time = DateFormat("hh:mm a").format(DateTime.now());

  Future addOutly(BuildContext context) async {
    if (title.text.isEmpty || amount.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: UIColor.red,
          content: const Text(
            "قم بملئ الحقول اولا",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          )));
    } else {
      int res = await model.addNewOutly({
        "title": title.text,
        "amount": int.parse(amount.text),
        "details": details.text,
        "data": date,
        "total_date": totalDate,
        "time": time
      });
      if (res != 0) {
        title.clear();
        amount.clear();

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

  Future getOutlys() async {
    List<Map> res = await model.getAllOutly(totalDate);
    outlyList.clear();
    outlyList.addAll(res);
    getTotalOutlys();
    update();
  }

  Future getTotalOutlys() async {
    List<Map> res = await model.getTotal(totalDate);
    totalList.clear();
    totalList.addAll(res);
    total.value =
        totalList[0]['SUM(amount)'] == null ? 0 : totalList[0]['SUM(amount)'];
    update();
  }

  Future editOutly(BuildContext context, int id) async {
    if (title.text.isEmpty || amount.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: UIColor.red,
          content: const Text(
            "قم بملئ كافة البيانات اولا",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          )));
    } else {
      int res = await model.editOutly(id, {
        "title": title.text,
        "amount": amount.text,
        "details": details.text
      });
      if (res != 0) {
        title.clear();
        amount.clear();
        details.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: UIColor.red,
            content: const Text(
              "تم التعديل بنجاح",
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
  }

  Future delOutly(BuildContext context, int id) async {
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
                      int res = await model.deleteOutly(id);
                      if (res >= 0) {
                        outlyList.removeWhere((element) => element['id'] == id);

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
}
