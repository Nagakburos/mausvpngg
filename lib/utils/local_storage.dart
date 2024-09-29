import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../backend/model/vpn/vpn_model.dart';

const String idKey = "idKey";

const String nameKey = "nameKey";

const String tokenKey = "tokenKey";

const String emailKey = "emailKey";

const String imageKey = "imageKey";

const String countryCode = "countryCode";
const String country = "country";

const String showAdKey = "showAdKey";
const String splashImgKey = "splashImgKey";
const String isLoggedInKey = "isLoggedInKey";

const String isDataLoadedKey = "isDataLoadedKey";

const String isOnBoardDoneKey = "isOnBoardDoneKey";

const String isScheduleEmptyKey = "isScheduleEmptyKey";

const String language = "language";
const String smallLanguage = "smallLanguage";
const String capitalLanguage = "capitalLanguage";

const String countryName = "countryName";

const String countryImage = "countryImage";

const String msPing = "msPing";

const String openVpnConfigDataBase64 = "openVpnConfigDataBase64";

const String allVpnList = "allVpnList";

const String vpnSingleList = "vpnSingleList";

const String privacyPolicyLinkKey = "privacyPolicyLinkKey";
const String aboutUsLinkKey = "aboutUsLinkKey";
const String contactUsLinkKey = "contactUsLinkKey";

class LocalStorage {
  static Future<void> saveLanguage({
    required String langSmall,
    required String langCap,
  }) async {
    final box1 = GetStorage();
    final box2 = GetStorage();

    var locale = Locale(langSmall, langCap);
    Get.updateLocale(locale);
    await box1.write(smallLanguage, langSmall);
    await box2.write(capitalLanguage, langCap);
  }

  static List getLanguage() {
    String small = GetStorage().read(smallLanguage) ?? 'us';
    String capital = GetStorage().read(capitalLanguage) ?? 'US';
    return [small, capital];
  }

  static Future<void> changeLanguage() async {
    final box = GetStorage();
    await box.remove(language);
  }

  static Future<void> saveSplashImage({required String image}) async {
    final box = GetStorage();

    await box.write(splashImgKey, image);
  }

  static String getSplashImage() {
    return GetStorage().read(splashImgKey);
  }

  static Future<void> saveId({required String id}) async {
    final box = GetStorage();

    await box.write(idKey, id);
  }

  static Future<void> saveName({required String name}) async {
    final box = GetStorage();

    await box.write(nameKey, name);
  }

  static Future<void> saveCountryName({required String country}) async {
    final box = GetStorage();

    await box.write(countryName, country);
  }

  static Future<void> saveCountryImage({required String countryIcon}) async {
    final box = GetStorage();

    await box.write(countryImage, countryIcon);
  }

  static Future<void> saveMsPing({required String ms}) async {
    final box = GetStorage();

    await box.write(msPing, ms);
  }

  static Future<void> saveOpenVpnConfigDataBase64(
      {required String openVpnConfigDataBase}) async {
    final box = GetStorage();

    await box.write(openVpnConfigDataBase64, openVpnConfigDataBase);
  }

  static Future<void> saveVpnSingleData(
      {required List<VpnModel> vpnSingleData}) async {
    final box = GetStorage();

    await box.write(vpnSingleList, vpnSingleData);
  }

  static Future<void> saveVpnList(
      {required List<VpnModel> totalVpnList}) async {
    final box = GetStorage();

    await box.write(allVpnList, totalVpnList);
  }

  static Future<void> saveEmail({required String email}) async {
    final box = GetStorage();

    await box.write(emailKey, email);
  }

  static Future<void> saveToken({required String token}) async {
    final box = GetStorage();

    await box.write(tokenKey, token);
  }

  static Future<void> saveCountryCode(
      {required String countryCodeValue}) async {
    final box = GetStorage();

    await box.write(countryCode, countryCodeValue);
  }

  static Future<void> saveCountry({required String countryValue}) async {
    final box = GetStorage();

    await box.write(country, countryValue);
  }

  static Future<void> saveImage({required String image}) async {
    final box = GetStorage();

    await box.write(imageKey, image);
  }

  static Future<void> isLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isLoggedInKey, isLoggedIn);
  }

  static Future<void> dataLoaded({required bool isDataLoad}) async {
    final box = GetStorage();

    await box.write(isDataLoadedKey, isDataLoad);
  }

  static Future<void> scheduleEmpty({required bool isScheduleEmpty}) async {
    final box = GetStorage();

    await box.write(isScheduleEmptyKey, isScheduleEmpty);
  }

  static Future<void> showAdYes({required bool isShowAdYes}) async {
    final box = GetStorage();

    await box.write(showAdKey, isShowAdYes);
  }

  static Future<void> saveOnboardDoneOrNot(
      {required bool isOnBoardDone}) async {
    final box = GetStorage();

    await box.write(isOnBoardDoneKey, isOnBoardDone);
  }

  // save url link
  static Future<void> savePrivacyPolicyLink({required String link}) async {
    final box = GetStorage();

    await box.write(privacyPolicyLinkKey, link);
  }

  static Future<void> saveAboutUsLink({required String link}) async {
    final box = GetStorage();

    await box.write(aboutUsLinkKey, link);
  }

  static Future<void> saveContactUs({required String link}) async {
    final box = GetStorage();

    await box.write(contactUsLinkKey, link);
  }

  static String? getId() {
    return GetStorage().read(idKey);
  }

  static String? getName() {
    return GetStorage().read(nameKey);
  }

  static String getCountryName() {
    return GetStorage().read(countryName) ?? "";
  }

  static String getCountryImage() {
    return GetStorage().read(countryImage) ?? "";
  }

  static String getMsPing() {
    return GetStorage().read(msPing) ?? "";
  }

  static String getOpenVpnConfigDataBase64() {
    return GetStorage().read(openVpnConfigDataBase64) ?? "";
  }

  static List<VpnModel> getVpnList() {
    return GetStorage().read(allVpnList) ?? [];
  }

  static List<VpnModel> getVpnSingleData() {
    // VpnModel data = VpnModel(
    //   hostName: "",
    //   ip: "",
    //   ping: 0,
    //   speed: 0,
    //   countryLong: "",
    //   countryShort: "",
    //   numVpnSessions: 0,
    //   openVpnConfigDataBase64: "",
    // );

    List<dynamic> dynamicList = GetStorage().read(vpnSingleList) ?? [];

    print(dynamicList);
    List<VpnModel> convertedList = [];

    try{
      convertedList = dynamicList.map((item){
        return item as VpnModel;
      }).toList();
    }catch(e){
      convertedList = dynamicList.map((item){
        return VpnModel.fromJson(item);
      }).toList();
    }

    return convertedList;
  }

  static String? getEmail() {
    return GetStorage().read(emailKey);
  }

  static String? getToken() {
    var rtrn = GetStorage().read(tokenKey);

    debugPrint(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }

  static String? getCountryCode() {
    var rtrn = GetStorage().read(countryCode);

    debugPrint(rtrn == null ? "##Country Code is null###" : "");

    return rtrn ?? "234";
  }

  static String? getCountry() {
    var rtrn = GetStorage().read(country);

    debugPrint(rtrn == null ? "##Country is null###" : "");

    return rtrn ?? "";
  }

  static String? getImage() {
    return GetStorage().read(imageKey);
  }

  // ! ************************************

//link section
  static String getPrivacyPolicy() {
    return GetStorage().read(privacyPolicyLinkKey) ?? '';
  }

  static String getAboutUs() {
    return GetStorage().read(aboutUsLinkKey) ?? '';
  }

  static String getContactUs() {
    return GetStorage().read(contactUsLinkKey) ?? '';
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static bool isDataLoaded() {
    return GetStorage().read(isDataLoadedKey) ?? false;
  }

  static bool isScheduleEmpty() {
    return GetStorage().read(isScheduleEmptyKey) ?? false;
  }

  static bool isOnBoardDone() {
    return GetStorage().read(isOnBoardDoneKey) ?? false;
  }

  static bool showAdPermission() {
    return GetStorage().read(showAdKey) ?? true;
  }

  static Future<void> logout() async {
    final box = GetStorage();

    await box.remove(idKey);

    await box.remove(nameKey);

    await box.remove(emailKey);

    await box.remove(imageKey);

    await box.remove(isLoggedInKey);

    await box.remove(isOnBoardDoneKey);
  }

  static Future<void> vpnSingleDataRemove() async {
    final box = GetStorage();

    await box.remove(vpnSingleList);
    await box.remove(countryName);
    await box.remove(countryImage);
    await box.remove(openVpnConfigDataBase64);
    await box.remove(msPing);
  }
}
