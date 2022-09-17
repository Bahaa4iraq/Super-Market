import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Constant/constant.dart';
import 'package:super_market/widgets/endDrawer.dart';
import 'package:super_market/widgets/homeButton.dart';

import '../widgets/custemClipper.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

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
            title: Text(
              "سوبرماركت الانور",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          endDrawer: MyDrawer(),
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.1,
                  child: Stack(
                    children: const [CliperAbove()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "شنو تحب تسوي اليوم",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "بهاء",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "مرحبا",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: title.length,
                      itemBuilder: (BuildContext context, int i) => InkWell(
                            onTap: () {
                              setState(() {
                                index = i;
                              });
                            },
                            child: HomeButton(
                              active: index == i ? true : false,
                              context: context,
                              title: title[i],
                            ),
                          )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: size.width,
                    height: size.height * 0.62,
                    child: SingleChildScrollView(child: pages[index])),
              ],
            )),
          )),
    );
  }
}
