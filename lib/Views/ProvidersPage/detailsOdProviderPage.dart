import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';

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
                height: size.height * 0.17,
                child: Stack(
                  children: [
                    Positioned(
                      top: -size.height * 0.87,
                      left: -size.width * 0.37,
                      child: Container(
                        padding: EdgeInsets.only(bottom: size.height * 0.10),
                        alignment: Alignment.bottomCenter,
                        width: size.width * 1.8,
                        height: size.height,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              offset: Offset(0, 1),
                            )
                          ],
                          shape: BoxShape.circle,
                          color: UIColor.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
