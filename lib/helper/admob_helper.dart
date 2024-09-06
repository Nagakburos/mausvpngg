import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../widgets/dialogs/custom_dialog_loading.dart';
import 'admob_unit_id_helper.dart';

class AdMobHelper {
  InterstitialAd? interstitialAd;
  int numOfAttemptLoad = 0;

  static initialization() {
    // ignore: unnecessary_null_comparison
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  //banner ad
  static BannerAd getBannerAd() {
    BannerAd bAd = BannerAd(
      adUnitId: UnitIdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        // isBannerAdReady = true;
        debugPrint('BannerAd has been initialized}');
      }, onAdFailedToLoad: (ad, error) {
        debugPrint('BannerAd has been crushed ${error.message}');
        // isBannerAdReady = false;
        ad.dispose();
      }, onAdOpened: (Ad ad) {
        debugPrint('BannerAd has been opened}');
      }),
    );

    return bAd;
  }

  //InterstitialAd load
  static Future<void> getInterstitialAdLoadAndShow(
      {required VoidCallback onCompleted}) {
    CustomDialogLoading.show();
    debugPrint('------------ InterstitialAd Load ----------');
    late InterstitialAd interstitialAd;
    return InterstitialAd.load(
      adUnitId: UnitIdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
        debugPrint('------------ InterstitialAd Started ----------');
        interstitialAd = ad;

        ad.fullScreenContentCallback = FullScreenContentCallback(
            //     onAdFailedToShowFullScreenContent: ((ad, error) {
            //   ad.dispose();
            //   debugPrint(error.message);
            // }),

            onAdDismissedFullScreenContent: (ad) {
          //function calling
          onCompleted();
          //ads dispose
          ad.dispose();
          interstitialAd.dispose();
          debugPrint('------------ InterstitialAd dispose ----------');
        });
        Get.back();
        debugPrint('------------ InterstitialAd Show ----------');
        //ads show
        ad.show();
      }, onAdFailedToLoad: (error) {
        Get.back();
        debugPrint('interstitial ad is not done $error');
        onCompleted();
      }),
    );
  }
}
