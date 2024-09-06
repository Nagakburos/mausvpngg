import 'package:get/get.dart';

import '../controller/dashboard/home_controller.dart';
import '../controller/drawer/drawer_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(CustomDrawerController());
  }
}
