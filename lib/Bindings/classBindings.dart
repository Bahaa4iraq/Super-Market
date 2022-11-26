import 'package:get/get.dart';

import '../controllers/CustomerViewModel/CustomerModelView.dart';
import '../controllers/ProviderViewModel/providerViewModel.dart';
import '../controllers/totalController.dart';
import '../controllers/outlyController.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomerController());
    Get.put(ProviderController());
    Get.put(OutlyController());
    Get.put(TotalController());
  }
}
