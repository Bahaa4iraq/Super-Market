import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/widgets/custemTextForm.dart';

import '../../controllers/CustomerViewModel/CustomerModelView.dart';
import '../../widgets/custemClipper.dart';

class GetCreditFromCustomer extends StatelessWidget {
  GetCreditFromCustomer({Key? key, required this.user}) : super(key: key);
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
          titleTextStyle: const TextStyle(fontSize: 16),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${user['name']}"),
              const SizedBox(
                width: 10,
              ),
              const Text("قبض مبلغ من "),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: CustemTextForm(
                          hint: "اكتب المبلغ",
                          type: TextInputType.number,
                          controller: controller.price,
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
                        height: 200,
                        child: CustemTextForm(
                          hint: "التفاصيل",
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
                          controller.getMoneyCustomer(context, user['id']);
                        },
                        child: Text(
                          'أضافة وصل قبض',
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
