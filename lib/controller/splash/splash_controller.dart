import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/pref_helper.dart';
import '../../routes/routes.dart';
import '../../utils/local_storage.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    var languageList = LocalStorage.getLanguage();
    var locale = Locale(languageList[0], languageList[1]);
    Get.updateLocale(locale);

    navigate();
  }

  navigate() async {
    Timer(const Duration(seconds: 3), () {
      PrefHelper.isCompleted()
          ? Get.offAllNamed(Routes.homeScreen)
          : Get.offAndToNamed(Routes.welcomeScreen);
    });
  }
}
