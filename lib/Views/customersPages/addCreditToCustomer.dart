import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/widgets/custemTextForm.dart';

import '../../ViewModel/addMoneyViewModel.dart';
import '../../widgets/custemClipper.dart';

class AddCreditToCustomer extends StatelessWidget {
  AddCreditToCustomer({Key? key, required this.user}) : super(key: key);
  final Map user;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => AddMoneyCustomer(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: UIColor.red,
            centerTitle: true,
            title: Text("${user['name']}صرف مبلغ لـ"),
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
                child: Consumer<AddMoneyCustomer>(
                  builder: ((context, model, child) => Column(
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
                                  controller: model.price,
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
                                  controller: model.details,
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
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  model.addMoneyCustomer(context, user['id']);
                                },
                                child: Text(
                                  'أضافة وصل الصرف',
                                  style: Theme.of(context).textTheme.headline3,
                                )),
                          )
                        ],
                      )),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
