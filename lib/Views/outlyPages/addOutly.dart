import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/controllers/outlyController.dart';
import 'package:super_market/widgets/custemTextForm.dart';

import '../../widgets/custemClipper.dart';

class AddOutly extends StatelessWidget {
  AddOutly({Key? key}) : super(key: key);
  final OutlyController controller = Get.find();

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
          title: const Text("اضافة مصاريف "),
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: CustemTextForm(
                          hint: "نوع المصاريف",
                          type: TextInputType.text,
                          controller: controller.title,
                          icon: Icons.title,
                        ),
                      ),
                      Text(
                        "المصاريف",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: CustemTextForm(
                          hint: "اكتب المبلغ هنا",
                          type: TextInputType.number,
                          controller: controller.amount,
                          icon: Icons.attach_money,
                        ),
                      ),
                      Text(
                        "المبلغ",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 150,
                        child: CustemTextForm(
                          hint: "اكتب التفاصيل هنا",
                          type: TextInputType.text,
                          controller: controller.details,
                          icon: Icons.info,
                        ),
                      ),
                      Text(
                        "التفاصيل",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          primary: UIColor.red,
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.addOutly(context);
                        },
                        child: Text(
                          'أضافة ',
                          style: Theme.of(context).textTheme.headline3,
                        )),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
