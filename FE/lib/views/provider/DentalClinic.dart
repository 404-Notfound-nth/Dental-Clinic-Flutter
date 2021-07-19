// // To parse this JSON data, do
// //
// //     final dentistry = dentistryFromJson(jsonString);

// import 'dart:convert';

// List<Dentistry> dentistryFromJson(String str) =>
//     List<Dentistry>.from(json.decode(str).map((x) => Dentistry.fromJson(x)));

// String dentistryToJson(List<Dentistry> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Dentistry {
//   Dentistry({
//     this.address,
//     this.phone,
//     this.name,
//     this.kilometer,
//     this.rating,
//     this.image,
//     this.email,
//   });

//   String address;
//   String phone;
//   String name;
//   int kilometer;
//   double rating;
//   String image;
//   String email;

//   factory Dentistry.fromJson(Map<String, dynamic> json) => Dentistry(
//         address: json["address"],
//         phone: json["phone"],
//         name: json["name"],
//         kilometer: json["kilometer"],
//         rating: json["rating"],
//         image: json["image"],
//         email: json["email"],
//       );

//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "phone": phone,
//         "name": name,
//         "kilometer": kilometer,
//         "rating": rating,
//         "image": image,
//         "email": email,
//       };
// }
