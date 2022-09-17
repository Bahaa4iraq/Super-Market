import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/Views/HomePage.dart';
import 'package:super_market/Views/ProvidersPage/addProvider.dart';
import 'package:super_market/Views/customersPages/addcustomer.dart';
import 'package:super_market/Views/outlyPages/addOutly.dart';

import 'ViewModel/CustomerModelView.dart';
import 'ViewModel/itemsViewModel.dart';
import 'ViewModel/outlyViewModel.dart';
import 'ViewModel/providerViewModel.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => CustomerViewModel())),
        ChangeNotifierProvider(create: ((context) => ProviderViewModel())),
        ChangeNotifierProvider(create: ((context) => ItemViewModel())),
        ChangeNotifierProvider(create: ((context) => OutlyViewModel())),
      ],
      child: MaterialApp(
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
                  fontSize: 20,
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
        initialRoute: "/",
        routes: {
          "/": (context) => Home(),
          "addCus": (context) => AddCustomer(),
          "addPro": (context) => AddProvider(),
          "addOutly": (context) => AddOutly(),
        },
      ),
    );
  }
}
