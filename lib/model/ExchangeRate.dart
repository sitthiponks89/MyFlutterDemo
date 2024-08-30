import 'dart:convert';

ExchangeRate exchangeRateFromJson(String str) =>
    ExchangeRate.fromJson(json.decode(str));

String exchangeRateToJson(ExchangeRate data) => json.encode(data.toJson());

class ExchangeRate {
  Map<String, double> rates;
  String base;
  String date;

  ExchangeRate({
    required this.rates,
    required this.base,
    required this.date,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        base: json["base"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "base": base,
        "date": date,
      };
}
