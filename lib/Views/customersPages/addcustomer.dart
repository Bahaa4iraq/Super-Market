import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/ViewModel/CustomerModelView.dart';
import 'package:super_market/widgets/custemTextForm.dart';

import '../../widgets/custemClipper.dart';

class AddCustomer extends StatelessWidget {
  AddCustomer({Key? key}) : super(key: key);

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
          title: const Text("اضافة زبون جدبد"),
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
              child: Consumer<CustomerViewModel>(
                builder: ((context, model, child) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50,
                            child: CustemTextForm(
                              hint: "اكتب اسم الزبون",
                              type: TextInputType.text,
                              controller: model.name,
                              icon: Icons.person,
                            ),
                          ),
                          Text(
                            "الاسم",
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
                              hint: "رقم هاتف الزبون",
                              type: TextInputType.number,
                              controller: model.phone,
                              icon: Icons.phone,
                            ),
                          ),
                          Text(
                            "رقم الهاتف",
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
                              model.addNewCustomer(context);
                            },
                            child: Text(
                              'أضافة زبون',
                              style: Theme.of(context).textTheme.headline3,
                            )),
                      )
                    ],
                  );
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
