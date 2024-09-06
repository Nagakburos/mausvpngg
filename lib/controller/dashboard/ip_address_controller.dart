import 'package:get/get.dart';

import '../../backend/model/location/ip_address_model.dart';
import '../../backend/services/api_services.dart';
import '../theme/dark_controller.dart';

class IpAddressController extends GetxController {
  final darkController = Get.put(DarkThemeController());

  @override
  void onInit() {
    super.onInit();
    getIpAddressData();
    // ApiServices.ipAddressApi();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late IpAddressModel _ipAddressModel;

  IpAddressModel get ipAddressModel => _ipAddressModel;

  Future<IpAddressModel> getIpAddressData() async {
    _isLoading.value = true;
    update();

    await ApiServices.ipAddressApi().then((value) {
      _ipAddressModel = value!;

      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return ipAddressModel;
  }
}
