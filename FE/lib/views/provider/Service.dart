// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.id,
    this.serviceName,
    this.price,
  });

  String id;
  String serviceName;
  int price;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        serviceName: json["serviceName"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serviceName": serviceName,
        "price": price,
      };
}
