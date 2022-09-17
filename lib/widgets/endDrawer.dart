import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/DataBase/sqlDB.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  SqlDB sqlDB = SqlDB();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UIColor.white,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: double.maxFinite,
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/3.jpg"),
              fit: BoxFit.cover,
            )),
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: 50,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: Text(
                "بهاء حسين",
                style: TextStyle(
                  fontSize: 25,
                  color: UIColor.white,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () async {
                sqlDB.deleteDB();
              },
              icon: Icon(Icons.delete))
        ],
      )),
    );
  }
}
