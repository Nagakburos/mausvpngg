import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;


import '../../utils/logger.dart';
import '../../widgets/snackbar/custom_snackbar.dart';
import '../model/location/ip_address_model.dart';
import '../model/vpn/vpn_model.dart';


final log = logger(ApiServices);

class ApiServices {
  static var client = http.Client();

// vpn list Api
  static Future<List<VpnModel>?> vpnCallingApi() async {
    try {
      final List<VpnModel> vpnList = [];
      final res =
          await client.get(Uri.parse("https://www.vpngate.net/api/iphone/"));

      final csvString = res.body.split("#")[1].replaceAll('*', '');

      List<List<dynamic>> list = const CsvToListConverter().convert(csvString);

      final header = list[0];
      for (int i = 1; i < header.length - 1; ++i) {
        final Map<String, dynamic> tempJson = {};

        tempJson.addAll({header[i]: list[1][i]});
        for (int j = 0; j < header.length; ++j) {
          tempJson.addAll({header[j].toString(): list[i][j]});
        }

        vpnList.add(VpnModel.fromJson(tempJson));
      }

      vpnList.shuffle();

      return vpnList;
    } catch (e) {
      log.e('🐞🐞🐞 err from vpn calling Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! Please Reload Again');
      return null;
    }
  }

  // ip address Api
  static Future<IpAddressModel?> ipAddressApi() async {
    try {
      final response = await client.get(Uri.parse("http://ip-api.com/json/"));

      IpAddressModel ipAddressModel =
          IpAddressModel.fromJson(jsonDecode(response.body.toString()));

      return ipAddressModel;
    } catch (e) {
      log.e('🐞🐞🐞 err from ip address Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! Please Reload Again');
      return null;
    }
  }
}
