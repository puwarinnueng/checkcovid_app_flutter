// To parse this JSON data, do
//
//     final getData = getDataFromJson(jsonString);

import 'dart:convert';

GetData getDataFromJson(String str) => GetData.fromJson(json.decode(str));

String getDataToJson(GetData data) => json.encode(data.toJson());

class GetData {
    GetData({
        required this.provider,
        required this.warningUpgradeToV6,
        required this.terms,
        required this.base,
        required this.date,
        required this.timeLastUpdated,
        required this.rates,
    });

    String provider;
    String warningUpgradeToV6;
    String terms;
    String base;
    DateTime date;
    int timeLastUpdated;
    Map<String, double> rates;

    factory GetData.fromJson(Map<String, dynamic> json) => GetData(
        provider: json["provider"],
        warningUpgradeToV6: json["WARNING_UPGRADE_TO_V6"],
        terms: json["terms"],
        base: json["base"],
        date: DateTime.parse(json["date"]),
        timeLastUpdated: json["time_last_updated"],
        rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "provider": provider,
        "WARNING_UPGRADE_TO_V6": warningUpgradeToV6,
        "terms": terms,
        "base": base,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_last_updated": timeLastUpdated,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
