import 'package:get/get.dart';

import '../../backend/model/vpn/vpn_model.dart';
import '../../backend/services/api_services.dart';
import '../theme/dark_controller.dart';
import '../../utils/local_storage.dart';
import '../../utils/strings.dart';
import '../dashboard/home_controller.dart';


class VPNLocationController extends GetxController {
  final darkController = Get.put(DarkThemeController());

  final homeController = Get.find<HomeController>();

  RxString selectedLocation = 'United States'.obs;
  RxString selectedLocationIcon = IconPath.usaPath.obs;

  RxInt index = 0.obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    if (vpnList.isEmpty) {
      getVpnData();
    }
  }

  List<VpnModel> vpnList = [];

  Future<List<VpnModel>> getVpnData() async {
    _isLoading.value = true;
    vpnList.clear();
    update();

    await ApiServices.vpnCallingApi().then((value) {
      vpnList = value!;
      if (vpnList.isNotEmpty) {
        LocalStorage.saveVpnList(totalVpnList: vpnList);
      } else {
        LocalStorage.saveVpnList(totalVpnList: <VpnModel>[]);
      }

      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return vpnList;
  }
}
