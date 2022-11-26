import 'package:flutter/cupertino.dart';
import 'package:super_market/Views/TotalPage/totalPage.dart';
import 'package:super_market/Views/ProvidersPage/ProvidersPage.dart';
import 'package:super_market/Views/outlyPages/outlyPage.dart';

import '../Views/customersPages/CustemersPage.dart';

List<Widget> pages = [CustomerPage(), ProviderPage(), OutlyPage(), TotalPage()];

List<String> title = ["الزبائن", "الشركات", "المصاريف", "ملخص"];
