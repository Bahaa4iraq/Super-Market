import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/Colors.dart';
import '../controllers/CustomerViewModel/CustomerModelView.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({Key? key, required this.list}) : super(key: key);
  final Map list;
  CustomerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    bool isPay = list['type'] == "صرف" ? true : false;

    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: UIColor.white,
            border: Border.all(color: Colors.black, width: 0.75),
            boxShadow: UIColor.shadow),
        child: Stack(
          children: [
            Positioned(
                top: -90,
                right: 125,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isPay
                          ? UIColor.red.withOpacity(0.6)
                          : UIColor.blue.withOpacity(0.6)),
                )),
            Positioned(
                bottom: -100,
                right: -100,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isPay
                          ? UIColor.red.withOpacity(0.6)
                          : UIColor.blue.withOpacity(0.6)),
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      controller.delPaymentFromUser(context, list['id']);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: UIColor.red.withOpacity(0.8),
                    )),
                Text(
                  controller.myFormat.format(list['amount']),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${list['type']}",
                  style: TextStyle(
                    color: isPay ? UIColor.red : UIColor.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      back: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: UIColor.white,
            border: Border.all(color: Colors.black, width: 0.75),
            boxShadow: UIColor.shadow),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${list['details']}",
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${list['data']}",
                  ),
                  Text(
                    "${list['time']}",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
