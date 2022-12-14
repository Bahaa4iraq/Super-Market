import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Views/ProvidersPage/addCreditToProvider.dart';
import 'package:super_market/Views/ProvidersPage/editProvider.dart';
import 'package:super_market/Views/customersPages/DtailesOfCustomerPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constant/Colors.dart';
import '../Views/ProvidersPage/getCreditFromProvider.dart';
import '../controllers/ProviderViewModel/providerViewModel.dart';

class ProviderCard extends StatefulWidget {
  const ProviderCard({Key? key, required this.list}) : super(key: key);
  final Map list;

  @override
  State<ProviderCard> createState() => _ProviderCardState();
}

class _ProviderCardState extends State<ProviderCard> {
  ProviderController controller = Get.find();
  int t = 0;

  getTotal() async {
    t = await controller.getHitory(widget.list['id']);
  }

  @override
  void initState() {
    super.initState();
    getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => HistoryPage(user: widget.list)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: UIColor.white,
            border: Border.all(color: Colors.black, width: 0.75),
            boxShadow: UIColor.shadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buttonCard(UIColor.red.withOpacity(0.9), "صرف", () {
                    Get.to(() => AddCreditToProvider(user: widget.list));
                  }),
                  buttonCard(UIColor.blue.withOpacity(0.9), "قبض", () {
                    Get.to(() => GetCreditFromProvider(
                          user: widget.list,
                        ));
                  }),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.list['name']}",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    "${widget.list['phone']}",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconCard(Colors.greenAccent, Icons.call, () async {
                        var url = "tel:${widget.list['phone']}";
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        }
                      }),
                      iconCard(UIColor.grey.withOpacity(0.9), Icons.edit, () {
                        Get.to(() => EditProvider(
                              user: widget.list,
                            ));
                      }),
                      iconCard(UIColor.red.withOpacity(0.9), Icons.delete, () {
                        controller.delUser(context, widget.list['id']);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buttonCard(Color color, String title, void Function()? fun) {
    return InkWell(
      onTap: fun,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: UIColor.shadow,
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }

  iconCard(Color color, IconData icon, void Function()? fun) {
    return IconButton(
      onPressed: fun,
      icon: Icon(icon),
      color: color,
    );
  }
}
