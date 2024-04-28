import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/DataBase/sqlDB.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_market/controllers/totalController.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  SqlDB sqlDB = SqlDB();
  TotalController controller = Get.put(TotalController());
  String appDocPath = "";

  Future getPath() async {
    Directory? appDocDir = await getExternalStorageDirectory();
    setState(() {
      appDocPath = appDocDir!.path;
    });
    print(appDocPath);
  }

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
                appDocPath,
                style: TextStyle(
                  fontSize: 11,
                  color: UIColor.white,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () async {
                await getPath();
                await controller.setVacuBackup(appDocPath);
                // sqlDB.deleteDB();
              },
              icon: Icon(Icons.backup)),
        ],
      )),
    );
  }
}
