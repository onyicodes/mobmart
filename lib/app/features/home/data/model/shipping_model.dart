class ShippingInfoModel {
  final String delivery;
  final String shipping;
  final String arrive;

  ShippingInfoModel({
    required this.delivery,
    required this.shipping,
    required this.arrive,
  });

  factory ShippingInfoModel.fromMap(Map<String, dynamic> json) =>
      ShippingInfoModel(
        delivery: json["delivery"],
        shipping: json["Shipping"],
        arrive: json["Arrive"],
      );

  Map<String, dynamic> toMap() => {
        "delivery": delivery,
        "Shipping": shipping,
        "Arrive": arrive,
      };
}
