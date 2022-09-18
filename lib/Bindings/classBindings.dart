import 'package:get/get.dart';

import '../controllers/CustomerViewModel/CustomerModelView.dart';
import '../controllers/ProviderViewModel/providerViewModel.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomerController());
    Get.put(ProviderController());
  }
}
