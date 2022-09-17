import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market/Views/customersPages/DtailesOfCustomerPage.dart';
import 'package:super_market/Views/customersPages/addCreditToCustomer.dart';
import 'package:super_market/Views/customersPages/getcreditFromCustomer.dart';

import '../Constant/Colors.dart';
import '../ViewModel/CustomerModelView.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({Key? key, required this.list}) : super(key: key);
  final Map list;

  @override
  Widget build(BuildContext context) {
    //Provider.of<CustomerViewModel>(context).getHitory(list['id']);

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
                "${list['id']}",
                style: Theme.of(context).textTheme.headline3,
              ),
              Column(
                children: [
                  Text(
                    "${list['name']}",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    "${list['phone']}",
                    style: const TextStyle(
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
                    MaterialPageRoute(builder: (_) => HistoryPage(user: list)));
              }),
              buttonCard(context, UIColor.blue.withOpacity(0.9), "قبض", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GetCreditFromCustomer(user: list)));
              }),
              buttonCard(context, UIColor.red.withOpacity(0.9), "صرف", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddCreditToCustomer(user: list)));
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
