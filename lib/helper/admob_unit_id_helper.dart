import 'dart:io';

import '../config/app_config.dart';


class UnitIdHelper {
  ///ios info.plist ca-app-pub-xxxxxxxxxxxxxxxxxx
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return '${AppConfig.bannerAdUnitId}';
      // return 'ca-app-pub-xxxxxxxxxxxxx';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-9932971012663465/5424418423'; //bannermausvpnios
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return '${AppConfig.interstitialAdUnitId}';
      // return 'ca-app-pub-xxxxxxxxxxx';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-9932971012663465/5595808819'; //Intersticialmausvpnios
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
