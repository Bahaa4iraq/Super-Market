import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_market/Constant/Colors.dart';

import '../controllers/LoginController.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 0, top: 50),
                    width: 300,
                    height: 300,
                    child: const Image(
                      image: AssetImage(
                        'images/3.jpg',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 0, bottom: 20),
                    child: Text(
                      "تسجيل دخول",
                      style: TextStyle(
                          fontSize: 25,
                          color: UIColor.red,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      controller: controller.userNameController,
                      decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          filled: true,
                          fillColor: const Color.fromARGB(44, 255, 255, 255),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: UIColor.red)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(width: 3, color: UIColor.red)),
                          hintStyle:
                              TextStyle(fontSize: 14, color: UIColor.red),
                          hintText: "اسم المستخدم",
                          prefixIcon: Icon(
                            Icons.person,
                            color: UIColor.red,
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: 400,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      controller: controller.passWordController,
                      decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          filled: true,
                          fillColor: const Color.fromARGB(44, 255, 255, 255),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(width: 3, color: UIColor.red)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: UIColor.red)),
                          hintStyle:
                              TextStyle(fontSize: 14, color: UIColor.red),
                          hintText: "كلمة المرور",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: UIColor.red,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(60)),
                          fixedSize: const Size(200, 60),
                          primary: UIColor.red),
                      onPressed: () {
                        var res = controller.login();
                        if (res) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text("تم تسجيل الدخول بنجاح ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 25))));
                          Get.off(() => Home());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text("المعلومات غير صحيحة",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 25))));
                        }
                      },
                      child: const Text(
                        "دخول",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
