import 'package:flutter/material.dart';

import '../Constant/Colors.dart';
import '../widgets/outlyCard.dart';

class OutlyPage extends StatelessWidget {
  OutlyPage({Key? key}) : super(key: key);
  List<String> res = [
    "انترنيت",
    "مولدة",
    "تلف بضاعة",
    "عمال",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: UIColor.red.withOpacity(0.9),
                boxShadow: UIColor.shadow),
            child: Text(
              "اضافة ",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.55,
          child: GridView.builder(
              itemCount: res.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.35, crossAxisCount: 2),
              itemBuilder: (BuildContext context, int i) => OutlyCard(
                    name: res[i],
                  )),
        ),
      ],
    );
  }
}
