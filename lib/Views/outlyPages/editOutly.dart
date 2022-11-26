import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/controllers/outlyController.dart';
import 'package:super_market/widgets/custemTextForm.dart';

import '../../widgets/custemClipper.dart';

class EditOutly extends StatefulWidget {
  EditOutly({Key? key, required this.outly}) : super(key: key);
  final Map outly;

  @override
  State<EditOutly> createState() => _EditOutlyState();
}

class _EditOutlyState extends State<EditOutly> {
  final OutlyController controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.title.text = widget.outly['title'];
    controller.amount.text = widget.outly['amount'].toString();

    controller.details.text = widget.outly['details'];
  }

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
          title: const Text("تعديل مصاريف "),
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
                          controller.editOutly(context, widget.outly['id']);
                        },
                        child: Text(
                          'تعديل',
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
