import 'dart:io';

import '../config/app_config.dart';


class UnitIdHelper {
  ///ios info.plist ca-app-pub-1925891541922617~5842010385
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return '${AppConfig.bannerAdUnitId}';
      // return 'ca-app-pub-1925891541922617/6763112330';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-1925891541922617/5271164749';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return '${AppConfig.interstitialAdUnitId}';
      // return 'ca-app-pub-1925891541922617/4971781840';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-1925891541922617/4953855571';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
