import 'package:flutter/material.dart';
import 'package:super_market/Constant/Colors.dart';
import 'package:super_market/widgets/custemTextForm.dart';

class GetCreditFromProvider extends StatelessWidget {
  GetCreditFromProvider({Key? key, required this.name}) : super(key: key);
  final String name;
  TextEditingController price = TextEditingController();
  TextEditingController details = TextEditingController();

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
          title: Text("قبض مبلغ من $name"),
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: CustemTextForm(
                          hint: "اكتب المبلغ",
                          type: TextInputType.number,
                          controller: price,
                          icon: Icons.attach_money,
                        ),
                      ),
                      Text(
                        "المبلغ",
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
                        height: 200,
                        child: CustemTextForm(
                          hint: "التفاصيل",
                          type: TextInputType.text,
                          controller: details,
                          icon: Icons.info,
                        ),
                      ),
                      Text(
                        "التفاصيل",
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
                          'أضافة وصل قبض',
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
