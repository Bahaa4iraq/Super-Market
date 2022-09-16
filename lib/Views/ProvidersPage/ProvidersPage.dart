import 'package:flutter/material.dart';
import 'package:super_market/widgets/providerCard.dart';

import '../../Constant/Colors.dart';
import '../../widgets/customerCard.dart';

class ProviderPage extends StatefulWidget {
  ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  TextEditingController search = TextEditingController();

  List<String> res = [
    "محلات الانوار",
    "مكتب المتين",
    "محلات الشورجة",
    "مكتب الاخوين"
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
                      Navigator.pushNamed(context, "addPro");
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
                        "اضافة مورد",
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
                        hintText: "بحث عن مورد",
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
                    childAspectRatio: 3, crossAxisCount: 1),
                itemBuilder: (BuildContext context, int i) => ProviderCard(
                      name: search.text.isEmpty ? res[i] : resSearch[i],
                    )),
          ),
        ],
      ),
    );
  }
}
