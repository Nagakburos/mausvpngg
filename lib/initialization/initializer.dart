import '../helper/admob_helper.dart';

class Initializer {
  static Future<void> adMobInitialize() async {
    await AdMobHelper.initialization();
  }
}
