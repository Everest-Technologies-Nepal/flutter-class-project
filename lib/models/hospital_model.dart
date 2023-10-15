// To parse this JSON data, do
//
//     final Hospital = HospitalFromJson(jsonString);

import 'dart:convert';

List<Hospital> HospitalFromJson(String str) => List<Hospital>.from(json.decode(str).map((x) => Hospital.fromJson(x)));

String HospitalToJson(List<Hospital> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hospital {
    String id;
    String name;
    String city;
    String address;
    String image;

    Hospital({
        required this.id,
        required this.name,
        required this.city,
        required this.address,
        required this.image,
    });

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        address: json["address"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "address": address,
        "image": image,
    };
}
