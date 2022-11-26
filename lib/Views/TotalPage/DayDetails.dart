import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/controllers/outlyController.dart';
import 'package:super_market/widgets/custemTextForm.dart';

import '../../controllers/totalController.dart';
import '../../widgets/custemClipper.dart';
import '../../widgets/outlyCard.dart';

class DayDetails extends StatefulWidget {
  const DayDetails({Key? key, required this.date}) : super(key: key);
  final String date;
  @override
  State<DayDetails> createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> {
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
              const Text("مصاريف "),
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
                  future: controller.getTotalOfDay(widget.date),
                  builder: (BuildContext context, AsyncSnapshot snapshot) =>
                      GridView.builder(
                          itemCount: controller.totalOfDayReport.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.35, crossAxisCount: 2),
                          itemBuilder: (context, int i) => OutlyCard(
                                outly: controller.totalOfDayReport[i],
                              ))),
            ),
          ]),
        ),
      ),
    );
  }
}
