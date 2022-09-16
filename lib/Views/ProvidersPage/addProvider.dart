import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/widgets/custemTextForm.dart';

class AddProvider extends StatelessWidget {
  AddProvider({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

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
          title: const Text("اضافة مورد جدبد"),
          leading: const SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.12,
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: CustemTextForm(
                          hint: "اكتب اسم المورد",
                          type: TextInputType.text,
                          controller: name,
                          icon: Icons.person,
                        ),
                      ),
                      Text(
                        "الاسم",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: CustemTextForm(
                          hint: "رقم هاتف المورد",
                          type: TextInputType.number,
                          controller: phone,
                          icon: Icons.phone,
                        ),
                      ),
                      Text(
                        "رقم الهاتف",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          primary: UIColor.red,
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Text(
                          'أضافة مورد',
                          style: Theme.of(context).textTheme.headline3,
                        )),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
