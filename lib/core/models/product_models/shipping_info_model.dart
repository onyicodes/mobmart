import 'dart:convert';
class ShippingInfo {
  final String? shippingFrom;
  final String? shippingFee;
  final String? arrivalDate;

  ShippingInfo({
    this.shippingFrom,
    this.shippingFee,
    this.arrivalDate,
  });

  ShippingInfo copyWith({
    String? shippingFrom,
    String? shippingFee,
    String? arrivalDate,
  }) =>
      ShippingInfo(
        shippingFrom: shippingFrom ?? this.shippingFrom,
        shippingFee: shippingFee ?? this.shippingFee,
        arrivalDate: arrivalDate ?? this.arrivalDate,
      );

  factory ShippingInfo.fromRawJson(String str) =>
      ShippingInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
        shippingFrom: json["shippingFrom"],
        shippingFee: json["ShippingFee"],
        arrivalDate: json["ArrivalDate"],
      );

  Map<String, dynamic> toJson() => {
        "shippingFrom": shippingFrom,
        "ShippingFee": shippingFee,
        "ArrivalDate": arrivalDate,
      };
}
