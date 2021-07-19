// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  Account({
    this.phone,
    this.fullname,
    this.email,
    this.roleId,
    this.statusId,
    this.password,
    this.birthday,
    this.token,
  });

  String phone;
  String fullname;
  String email;
  String roleId;
  String statusId;
  String password;
  String birthday;
  String token;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        phone: json["phone"],
        fullname: json["fullname"],
        email: json["email"],
        roleId: json["role_id"],
        statusId: json["status_id"],
        password: json["password"],
        birthday: json["birthday"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "fullname": fullname,
        "email": email,
        "role_id": roleId,
        "status_id": statusId,
        "password": password,
        "birthday": birthday,
        "token": token,
      };
}
