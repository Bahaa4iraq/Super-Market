import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';

import '../../widgets/custemClipper.dart';

class HistoryOfProviderPage extends StatelessWidget {
  HistoryOfProviderPage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: UIColor.red,
            centerTitle: true,
            title: Text("سجل $name  "),
            leading: const SizedBox(),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.1,
                child: Stack(
                  children: const [CliperAbove()],
                ),
              ),
            ],
          )),
    );
  }
}
