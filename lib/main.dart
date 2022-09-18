import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:super_market/Bindings/classBindings.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Views/HomePage.dart';
import 'package:super_market/Views/ProvidersPage/addProvider.dart';
import 'package:super_market/Views/customersPages/addcustomer.dart';
import 'package:super_market/Views/outlyPages/addOutly.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: UIColor.red, statusBarIconBrightness: Brightness.dark),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              headline4: const TextStyle(
                shadows: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    color: Colors.grey,
                  )
                ],
                fontSize: 15,
                color: Colors.white,
              ),
              headline3: const TextStyle(
                shadows: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    color: Colors.grey,
                  )
                ],
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black87,
              ),
              headline2: const TextStyle(
                shadows: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    color: Colors.grey,
                  )
                ],
                fontSize: 18,
                color: Colors.black,
              ),
              headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: UIColor.white,
              ))),
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "addCus": (context) => AddCustomer(),
        "addPro": (context) => AddProvider(),
        "addOutly": (context) => AddOutly(),
      },
    );
  }
}
