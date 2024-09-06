import 'dart:async';

import 'package:get/get.dart';

import '../../routes/routes.dart';


class VPNConnectionController extends GetxController{

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  void onInit() {
    timerInit();
    super.onInit();
  }


  timerInit(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {

        secondsRemaining.value++;

        if(secondsRemaining.value == 60){
          secondsRemaining.value = 0;
          minuteRemaining.value ++;

          if(minuteRemaining.value == 60){
            minuteRemaining.value = 0;
            hourRemaining.value ++;
          }

        }

    });
  }


  RxInt secondsRemaining = 0.obs;
  RxInt minuteRemaining = 0.obs;
  RxInt hourRemaining = 0.obs;
  RxBool enableResend = false.obs;
  Timer? timer;

  void vpnLocation() {
    Get.offNamedUntil(Routes.vpnLocationScreen, (route) => true);
  }

  void connectionReport() {
    String data = '${hourRemaining.value.toString()}:${minuteRemaining.value.toString()}:${secondsRemaining.value.toString()}';
    Get.offNamed(Routes.connectionReportScreen , arguments: data);
  }
}