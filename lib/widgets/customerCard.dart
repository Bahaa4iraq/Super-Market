import 'package:flutter/material.dart';
import 'package:super_market/Views/customersPages/DtailesOfCustomerPage.dart';
import 'package:super_market/Views/customersPages/addCreditToCustomer.dart';
import 'package:super_market/Views/customersPages/getcreditFromCustomer.dart';

import '../Constant/Colors.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: UIColor.white,
          border: Border.all(color: Colors.black, width: 0.75),
          boxShadow: UIColor.shadow),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "65.000",
                style: Theme.of(context).textTheme.headline3,
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const Text(
                    "07717825119",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
              child: Row(
            children: [
              buttonCard(context, UIColor.moore.withOpacity(0.9), "السجل", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HistoryPage(name: name)));
              }),
              buttonCard(context, UIColor.blue.withOpacity(0.9), "قبض", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GetCreditFromCustomer(name: name)));
              }),
              buttonCard(context, UIColor.red.withOpacity(0.9), "صرف", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddCreditToCustomer(name: name)));
              }),
            ],
          )),
        ],
      ),
    );
  }

  buttonCard(
      BuildContext context, Color color, String txt, void Function()? fun) {
    return Expanded(
        child: InkWell(
      onTap: fun,
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: UIColor.shadow),
        child: Text(
          txt,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    ));
  }
}
