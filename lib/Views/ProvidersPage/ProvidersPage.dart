import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Views/ProvidersPage/addProvider.dart';
import '../../Constant/Colors.dart';
import '../../controllers/ProviderViewModel/providerViewModel.dart';
import '../../widgets/providerCard.dart';

class ProviderPage extends StatefulWidget {
  ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPage();
}

class _ProviderPage extends State<ProviderPage> {
  ProviderController controller = Get.find();

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
                      Get.to(() => AddProvider());
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
                        "اضافة شركة",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: GetX<ProviderController>(
                      builder: (controller) => TextFormField(
                        onChanged: (val) {
                          controller.search.value.addListener(() {});
                        },
                        textDirection: TextDirection.rtl,
                        controller: controller.search.value,
                        decoration: InputDecoration(
                          hintText: "بحث عن شركة",
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
            height: MediaQuery.of(context).size.height * 0.59,
            child: GetBuilder<ProviderController>(
              builder: (controller) {
                return FutureBuilder(
                  future: controller.search.value.text.isEmpty
                      ? controller.getProviders()
                      : controller.getSearchProviders(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) =>
                      GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: controller.proviList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3, crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int i) =>
                              ProviderCard(list: controller.proviList[i])),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
