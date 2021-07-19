//this model

class Dental {
  final String nameDental;
  final String addressDental;
  final double rating;
  final String email;
  final String phone;
  final String kilometer;
  final String image;

  const Dental(
      {this.nameDental,
      this.addressDental,
      this.rating,
      this.email,
      this.phone,
      this.kilometer,
      this.image});

  factory Dental.fromJson(Map<String, dynamic> json) => Dental(
      nameDental: json['name'],
      addressDental: json['address'],
      rating: json["rating"].toDouble(),
      email: json["email"],
      phone: json["phone"],
      kilometer: json["kilometer"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        'name': nameDental,
        'address': addressDental,
        'rating': rating,
        'email': email,
        'phone': phone,
        'kilometer': kilometer,
        'image': image
      };
}
