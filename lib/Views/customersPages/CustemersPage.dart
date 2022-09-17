import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market/Model/customerModel.dart';
import 'package:super_market/widgets/custemTextForm.dart';
import 'package:super_market/widgets/customerCard.dart';

import '../../Constant/Colors.dart';
import '../../Constant/constant.dart';
import '../../ViewModel/CustomerModelView.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  TextEditingController search = TextEditingController();

  List<String> resSearch = [];

  @override
  Widget build(BuildContext context) {
    Provider.of<CustomerViewModel>(context).getCustomers();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "addCus");
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
                        "اضافة زبون",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: TextFormField(
                      onChanged: (val) {},
                      textDirection: TextDirection.rtl,
                      controller: search,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        contentPadding:
                            const EdgeInsets.only(top: 3, right: 10),
                        filled: true,
                        fillColor: UIColor.red.withOpacity(0.2),
                        hintText: "بحث عن زبون",
                        hintTextDirection: TextDirection.rtl,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: UIColor.red, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: UIColor.red, width: 2)),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Consumer<CustomerViewModel>(
            builder: (context, model, child) => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: GridView.builder(
                  itemCount: model.custList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3, crossAxisCount: 1),
                  itemBuilder: (BuildContext context, int i) => CustomerCard(
                        list: model.custList[i],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
