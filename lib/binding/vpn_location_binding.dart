import 'package:get/get.dart';
import '../controller/vpn/vpn_location_controller.dart';

class VpnLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VPNLocationController());
  }
}
