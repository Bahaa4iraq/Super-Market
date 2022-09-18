import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';

import '../../controllers/CustomerViewModel/CustomerModelView.dart';
import '../../widgets/custemClipper.dart';
import '../../widgets/historyCard.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key, required this.user}) : super(key: key);
  final Map user;
  CustomerController controller = Get.find();
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
                Text("${user['name']}"),
                const SizedBox(
                  width: 10,
                ),
                const Text("سجل"),
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
          body: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.1,
                child: Stack(
                  children: const [CliperAbove()],
                ),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GetX<CustomerController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            controller.myFormat.format(controller.total.value)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("المبلغ الكلي")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.71,
                child: GetBuilder<CustomerController>(
                  builder: (controller) => FutureBuilder(
                    future: controller.getHitory(user['id']),
                    builder: (context, snapshot) => GridView.builder(
                        itemCount: controller.resSearch.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 5, crossAxisCount: 1),
                        itemBuilder: (BuildContext context, int i) =>
                            HistoryCard(
                              list: controller.resSearch[i],
                            )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
