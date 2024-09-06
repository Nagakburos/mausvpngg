import 'dart:convert';

class IpAddressModel {
  String status;
  String country;
  String countryCode;
  String region;
  String regionName;
  String city;
  String zip;
  double lat;
  double lon;
  String timezone;
  String isp;
  String org;
  String ipAddressModelAs;
  String query;

  IpAddressModel({
    required this.status,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.ipAddressModelAs,
    required this.query,
  });

  factory IpAddressModel.fromRawJson(String str) =>
      IpAddressModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IpAddressModel.fromJson(Map<String, dynamic> json) => IpAddressModel(
        status: json["status"] ?? '',
        country: json["country"] ?? '',
        countryCode: json["countryCode"] ?? 'Unknown',
        region: json["region"] ?? 'Unknown',
        regionName: json["regionName"] ?? '',
        city: json["city"] ?? '',
        zip: json["zip"] ?? '- - - -',
        lat: json["lat"]?.toDouble() ?? 0.0,
        lon: json["lon"]?.toDouble() ?? 0.0,
        timezone: json["timezone"] ?? 'Unknown',
        isp: json["isp"] ?? 'Unknown',
        org: json["org"] ?? 'Unknown',
        ipAddressModelAs: json["as"] ?? 'Unknown',
        query: json["query"] ?? 'Unknown',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "country": country,
        "countryCode": countryCode,
        "region": region,
        "regionName": regionName,
        "city": city,
        "zip": zip,
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "isp": isp,
        "org": org,
        "as": ipAddressModelAs,
        "query": query,
      };
}
