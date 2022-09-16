import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Constant/constant.dart';
import 'package:super_market/widgets/homeButton.dart';

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
          body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.17,
              child: Stack(
                children: [
                  Positioned(
                    top: -size.height * 0.82,
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
                      child: Text(
                        "سوبرماركت الانور",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ],
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
