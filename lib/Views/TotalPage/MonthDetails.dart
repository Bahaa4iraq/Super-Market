import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/controllers/outlyController.dart';
import 'package:super_market/widgets/custemTextForm.dart';

import '../../controllers/totalController.dart';
import '../../widgets/custemClipper.dart';
import 'DayDetails.dart';

class MonthDetails extends StatefulWidget {
  MonthDetails({Key? key, required this.date}) : super(key: key);
  final String date;
  @override
  State<MonthDetails> createState() => _MonthDetailsState();
}

class _MonthDetailsState extends State<MonthDetails> {
  final TotalController controller = Get.put(TotalController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: UIColor.red,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.date),
              const SizedBox(
                width: 10,
              ),
              const Text("مصاريف الشهر"),
            ],
          ),
          leading: const SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.1,
              child: Stack(
                children: const [CliperAbove()],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              child: FutureBuilder(
                  future: controller.getTotalOfMonth(widget.date),
                  builder: (BuildContext context, AsyncSnapshot snapshot) =>
                      GridView.builder(
                        itemCount: controller.totalOfMonthReport.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 4),
                        itemBuilder: (context, int i) => InkWell(
                          onTap: () {
                            Get.to(() => DayDetails(
                                  date: controller.totalOfMonthReport[i]
                                      ['data'],
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(controller.totalOfMonthReport[i]
                                          ['data']),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(" يوم"),
                                    ],
                                  ),
                                  Text(controller.myFormat.format(controller
                                      .totalOfMonthReport[i]['SUM(amount)'])),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
          ]),
        ),
      ),
    );
  }
}
