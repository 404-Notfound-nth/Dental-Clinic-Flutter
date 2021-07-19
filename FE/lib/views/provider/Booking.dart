// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';
import 'package:clinicbookingapp/views/provider/Service.dart';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  Booking({
    this.id,
    this.createDate,
    this.modifiedDate,
    this.time,
    this.date,
    this.note,
    this.statusId,
    this.accountPhone,
    this.serviceId,
    this.dentistryAddress,
    this.serviceDto,
  });

  String id;
  DateTime createDate;
  String modifiedDate;
  String time;
  String date;
  String note;
  String statusId;
  String accountPhone;
  String serviceId;
  String dentistryAddress;
  Service serviceDto;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        createDate: DateTime.parse(json["createDate"]),
        modifiedDate: json["modifiedDate"],
        time: json["time"],
        date: json["date"],
        note: json["note"],
        statusId: json["status_id"],
        accountPhone: json["account_phone"],
        serviceId: json["service_id"],
        dentistryAddress: json["dentistry_address"],
        serviceDto: json["serviceDTO"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createDate": createDate.toIso8601String(),
        "modifiedDate": modifiedDate,
        "time": time,
        "date": date,
        "note": note,
        "status_id": statusId,
        "account_phone": accountPhone,
        "service_id": serviceId,
        "dentistry_address": dentistryAddress,
        "serviceDTO": serviceDto,
      };
}
