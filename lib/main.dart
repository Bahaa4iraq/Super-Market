import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Views/HomePage.dart';
import 'package:super_market/Views/ProvidersPage/addProvider.dart';
import 'package:super_market/Views/customersPages/addCreditToCustomer.dart';
import 'package:super_market/Views/customersPages/addcustomer.dart';

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
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
              headline4: TextStyle(
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
              headline3: TextStyle(
                shadows: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    color: Colors.grey,
                  )
                ],
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
              headline2: TextStyle(
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
                color: Colors.black,
              ))),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "addCus": (context) => AddCustomer(),
        "addPro": (context) => AddProvider(),
      },
    );
  }
}
