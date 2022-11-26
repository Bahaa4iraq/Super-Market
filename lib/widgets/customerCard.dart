import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Views/customersPages/DtailesOfCustomerPage.dart';
import 'package:super_market/Views/customersPages/addCreditToCustomer.dart';
import 'package:super_market/Views/customersPages/getcreditFromCustomer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constant/Colors.dart';
import '../Model/customerModel.dart';
import '../Views/customersPages/editCustomer.dart';
import '../controllers/CustomerViewModel/CustomerModelView.dart';

class CustomerCard extends StatefulWidget {
  const CustomerCard({Key? key, required this.list}) : super(key: key);
  final Map list;

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  CustomerModel model = CustomerModel();
  int tot = 0;
  CustomerController controller = Get.put(CustomerController());
  getTotalOF() async {
    List<Map> res = await model.getTotal(widget.list['id']);

    tot = res[0]['SUM(amount)'] == null ? 0 : res[0]['SUM(amount)'];
  }

  @override
  Widget build(BuildContext context) {
    getTotalOF();

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
            //border: Border.all(color: Colors.black, width: 0.75),
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
                  buttonCard(UIColor.red.withOpacity(0.9), "بيع", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                AddCreditToCustomer(user: widget.list)));
                  }),
                  buttonCard(UIColor.blue.withOpacity(0.9), "تسديد", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                GetCreditFromCustomer(user: widget.list)));
                  }),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.myFormat.format(tot),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Column(
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
                          ],
                        ),
                      ],
                    ),
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
                        Get.to(() => EditCustomer(
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
