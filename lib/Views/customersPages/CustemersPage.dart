import 'package:flutter/material.dart';
import 'package:super_market/widgets/custemTextForm.dart';
import 'package:super_market/widgets/customerCard.dart';

import '../../Constant/Colors.dart';
import '../../Constant/constant.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  TextEditingController search = TextEditingController();

  List<String> res = [
    "ahmed ali",
    "bahaa hussien",
    "sajad bahaa",
    "Rokia hussien"
  ];
  List<String> resSearch = [];

  @override
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
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          resSearch = res
                              .where((element) => element
                                  .toLowerCase()
                                  .contains(val.toLowerCase()))
                              .toList();
                        });
                      },
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: GridView.builder(
                itemCount: search.text.isEmpty ? res.length : resSearch.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3.5, crossAxisCount: 1),
                itemBuilder: (BuildContext context, int i) => CustomerCard(
                      name: search.text.isEmpty ? res[i] : resSearch[i],
                    )),
          ),
        ],
      ),
    );
  }
}
