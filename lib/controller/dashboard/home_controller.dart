import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/model/vpn/vpn_config.dart';
import '../../backend/model/vpn/vpn_model.dart';
import '../../backend/services/vpn_engine.dart';
import '../../helper/admob_helper.dart';
import '../theme/dark_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/local_storage.dart';

class HomeController extends GetxController {
  final darkController = Get.put(DarkThemeController());

  late RxList<VpnModel> listOfVpn = <VpnModel>[].obs;
  List<VpnModel> singleVpnData = LocalStorage.getVpnSingleData();
  final vpnState = VpnEngine.vpnDisconnected.obs;

  RxString countryName = "".obs;
  RxString countryImage = "".obs;
  RxString msPing = "".obs;
  RxString openVpnConfigDataBase64 = "".obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    countryName.value = singleVpnData.first.countryLong!;
    openVpnConfigDataBase64.value =
        singleVpnData.first.openVpnConfigDataBase64!;
    initializeController(
        openVpnConfigDataBase: openVpnConfigDataBase64.value,
        countryName: countryName.value);
  }

  initializeController({required openVpnConfigDataBase, required countryName}) {
    if (openVpnConfigDataBase.isNotEmpty) {
      _isLoading.value = true;
      if (vpnState.value == VpnEngine.vpnConnected) {
        VpnEngine.stopVpn();
        Future.delayed(
            Duration(seconds: 2),
            () => connectToVpn(
                openVpnConfigDataBase64: openVpnConfigDataBase,
                country: countryName));
        _isLoading.value = false;
      } else {
        connectToVpn(
          country: countryName,
          openVpnConfigDataBase64: openVpnConfigDataBase,
        );
        _isLoading.value = false;
      }
    }
  }

  //vpn buttons color
  Color get getButtonColor {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return CustomColor.primaryColor;

      case VpnEngine.vpnConnected:
        return CustomColor.greenColor;

      default:
        return Colors.orangeAccent;
    }
  }

  /*vpn button text*/
  String get getButtonText {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return "Tap to Connect";

      case VpnEngine.vpnConnected:
        return "Disconnect";

      default:
        return "Connecting...";
    }
  }

  connectToVpn({required openVpnConfigDataBase64, required country}) async {
    print("connect vpn");
    print(openVpnConfigDataBase64);
    print("connect vpn");

    if (openVpnConfigDataBase64.isEmpty) return;

    if (vpnState.value == VpnEngine.vpnDisconnected) {
      final data = base64Decode(openVpnConfigDataBase64);
      final config = Utf8Decoder().convert(data);
      final vpnConfig = VpnConfig(
          country: country.toString(),
          username: 'vpn',
          password: 'vpn',
          config: config);

      // Delay the VPN connection to give the dialog a chance to display
      await Future.delayed(Duration(milliseconds: 100));

      ///Start if stage is disconnected
      await AdMobHelper.getInterstitialAdLoadAndShow(onCompleted: () async {
        await VpnEngine.startVpn(vpnConfig);
      });
    } else {
      ///Stop if stage is "not" disconnected
      VpnEngine.stopVpn();
    }
  }

  noFn() {}
}
