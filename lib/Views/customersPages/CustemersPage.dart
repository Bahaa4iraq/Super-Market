import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/widgets/customerCard.dart';

import '../../Constant/Colors.dart';
import '../../controllers/CustomerViewModel/CustomerModelView.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  CustomerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
                    child: GetX<CustomerController>(
                      builder: (controller) => TextFormField(
                        onChanged: (val) {
                          controller.search.value.addListener(() {});
                        },
                        textDirection: TextDirection.rtl,
                        controller: controller.search.value,
                        decoration: InputDecoration(
                          hintText: "بحث عن زبون",
                          prefixIcon: IconButton(
                              onPressed: () {
                                controller.search.value.clear();
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              icon:
                                  const Icon(Icons.close, color: Colors.black)),
                          contentPadding:
                              const EdgeInsets.only(top: 3, right: 10),
                          filled: true,
                          fillColor: UIColor.red.withOpacity(0.2),
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
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: GetBuilder<CustomerController>(
              builder: (controller) {
                return FutureBuilder(
                  future: controller.search.value.text.isEmpty
                      ? controller.getCustomers()
                      : controller.getSearchCustomers(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) =>
                      GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: controller.custList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3, crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int i) =>
                              CustomerCard(list: controller.custList[i])),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
