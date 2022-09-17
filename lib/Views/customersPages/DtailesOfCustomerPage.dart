import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market/Constant/Colors.dart';

import '../../ViewModel/CustomerModelView.dart';
import '../../widgets/custemClipper.dart';
import '../../widgets/historyCard.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key, required this.user}) : super(key: key);
  final Map user;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (context) => CustomerViewModel(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: UIColor.red,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${user['name']}"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("سجل"),
                ],
              ),
              leading: const SizedBox(),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_forward_ios))
              ],
            ),
            body: Consumer<CustomerViewModel>(
                builder: (context, model, child) => Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.1,
                          child: Stack(
                            children: const [CliperAbove()],
                          ),
                        ),
                        DefaultTextStyle(
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${model.total}"),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("المبلغ الكلي")
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.71,
                          child: FutureBuilder(
                            future: model.getHitory(user['id']),
                            builder: (context, snapshot) => GridView.builder(
                                itemCount: model.custList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 4, crossAxisCount: 1),
                                itemBuilder: (BuildContext context, int i) =>
                                    HistoryCard(
                                      list: model.custList[i],
                                    )),
                          ),
                        ),
                      ],
                    )),
          ),
        ));
  }
}
