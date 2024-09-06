import 'dart:convert';

VpnModel vpnModelFromJson(String str) => VpnModel.fromJson(json.decode(str));

String vpnModelToJson(VpnModel data) => json.encode(data.toJson());

class VpnModel {
  String? hostName;
  String? ip;

  // int? score;
  int? ping;
  int? speed;
  String? countryLong;
  String? countryShort;
  int? numVpnSessions;

  // int? uptime;
  // int? totalUsers;
  // int? totalTraffic;
  // String? logType;
  // String? vpnModelOperator;
  // String? message;
  String? openVpnConfigDataBase64;

  VpnModel({
    this.hostName,
    this.ip,
    // this.score,
    this.ping,
    this.speed,
    this.countryLong,
    this.countryShort,
    this.numVpnSessions,
    // this.uptime,
    // this.totalUsers,
    // this.totalTraffic,
    // this.logType,
    // this.vpnModelOperator,
    // this.message,
    this.openVpnConfigDataBase64,
  });

  factory VpnModel.fromJson(Map<String, dynamic> json) => VpnModel(
        hostName: json["HostName"] ?? "",
        ip: json["IP"] ?? "",
        // score: json["Score"] ?? " ",
        ping: json["Ping"] ?? "",
        speed: json["Speed"] ?? "",
        countryLong: json["CountryLong"] ?? "",
        countryShort: json["CountryShort"] ?? "",
        numVpnSessions: json["NumVpnSessions"] ?? "",
        // uptime: json["Uptime"] ?? " ",
        // totalUsers: json["TotalUsers"] ?? " ",
        // totalTraffic: json["TotalTraffic"] ?? " ",
        // logType: json["LogType"] ?? " ",
        // vpnModelOperator: json["Operator"] ?? " ",
        // message: json["Message"] ?? " ",
        openVpnConfigDataBase64: json["OpenVPN_ConfigData_Base64"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "HostName": hostName,
        "IP": ip,
        // "Score": score,
        "Ping": ping,
        "Speed": speed,
        "CountryLong": countryLong,
        "CountryShort": countryShort,
        "NumVpnSessions": numVpnSessions,
        // "Uptime": uptime,
        // "TotalUsers": totalUsers,
        // "TotalTraffic": totalTraffic,
        // "LogType": logType,
        // "Operator": vpnModelOperator,
        // "Message": message,
        "OpenVPN_ConfigData_Base64": openVpnConfigDataBase64,
      };
}
