import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:super_market/Views/outlyPages/editOutly.dart';
import '../Constant/Colors.dart';

class OutlyCard extends StatelessWidget {
  const OutlyCard({Key? key, required this.name}) : super(key: key);
  final String name;

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
                name,
                style: Theme.of(context).textTheme.headline3,
              ),
              const Text(
                "65.000",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EditOutly()));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: UIColor.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  backgroundColor: UIColor.white,
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.warning_rounded,
                                        color: UIColor.red,
                                      ),
                                      const Text(
                                        "تنبيه",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  content: const Text(
                                    "هل انت متأكد من الحذف",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  actionsAlignment: MainAxisAlignment.start,
                                  actions: [
                                    OutlinedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: UIColor.red),
                                        onPressed: () {},
                                        child: Text(
                                          "موافق",
                                          style:
                                              TextStyle(color: UIColor.white),
                                        )),
                                    OutlinedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: UIColor.white),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "الغاء",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ],
                                ));
                      },
                      icon: Icon(
                        Icons.delete,
                        color: UIColor.red,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "07/04/2022",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "10:50 am",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
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
            const Text(
              "تلف 2 بطل حليب و كاسة روبة  تلف 2 بطل حليب و كاسة روب ",
              style: TextStyle(fontSize: 14),
            ),
          ]),
        ));
  }
}
