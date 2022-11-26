import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/controllers/outlyController.dart';

import '../../Constant/Colors.dart';
import '../../widgets/outlyCard.dart';

class OutlyPage extends StatefulWidget {
  OutlyPage({Key? key}) : super(key: key);

  @override
  State<OutlyPage> createState() => _OutlyPageState();
}

class _OutlyPageState extends State<OutlyPage> {
  OutlyController controller = Get.find();
  Future<void> setNewSteate() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "addOutly");
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: UIColor.red.withOpacity(0.9),
                boxShadow: UIColor.shadow),
            child: Text(
              "اضافة ",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          child: GetX<OutlyController>(
              builder: (controller) => DefaultTextStyle(
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(controller.myFormat
                              .format(controller.total.value)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("مجموع مصاريف هذا الشهر"),
                        ],
                      )))),
        ),
        RefreshIndicator(
            onRefresh: setNewSteate,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.59,
              child: FutureBuilder(
                future: controller.getOutlys(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (controller.outlyList.isNotEmpty) {
                    return GridView.builder(
                        itemCount: controller.outlyList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.35, crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int i) => OutlyCard(
                              outly: controller.outlyList[i],
                            ));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )),
      ],
    );
  }
}
