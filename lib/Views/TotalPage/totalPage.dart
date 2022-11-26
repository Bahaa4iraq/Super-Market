import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Views/TotalPage/MonthDetails.dart';
import 'package:super_market/controllers/totalController.dart';

class TotalPage extends StatelessWidget {
  TotalPage({Key? key}) : super(key: key);
  final TotalController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.67,
      child: FutureBuilder(
          future: controller.getTotal(),
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              GridView.builder(
                itemCount: controller.outlyReport.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 4),
                itemBuilder: (context, int i) => InkWell(
                  onTap: () {
                    Get.to(() => MonthDetails(
                        date: controller.outlyReport[i]['total_date']));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: UIColor.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: UIColor.shadow),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(controller.outlyReport[i]['total_date']),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("مصاريف الشهر"),
                            ],
                          ),
                          Text(controller.myFormat.format(
                              controller.outlyReport[i]['SUM(amount)'])),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
