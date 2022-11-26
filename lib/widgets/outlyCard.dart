import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';
import 'package:super_market/Views/outlyPages/editOutly.dart';
import 'package:super_market/controllers/outlyController.dart';
import '../Constant/Colors.dart';

class OutlyCard extends StatelessWidget {
  OutlyCard({Key? key, required this.outly}) : super(key: key);
  final Map outly;

  final OutlyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        front: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: UIColor.white,
              border: Border.all(color: Colors.black, width: 0.75),
              boxShadow: UIColor.shadow),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                outly['title'],
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                controller.myFormat.format(outly['amount']),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditOutly(
                                      outly: outly,
                                    )));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: UIColor.blue,
                      )),
                  IconButton(
                      onPressed: () async {
                        await controller.delOutly(context, outly['id']);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: UIColor.red,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    outly['data'],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    outly['time'],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              )
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "التفاصيل",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              outly['details'],
              style: const TextStyle(fontSize: 14),
            ),
          ]),
        ));
  }
}
