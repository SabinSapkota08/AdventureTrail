// To parse this JSON data, do
//
//     final adTicket = adTicketFromJson(jsonString);

import 'dart:convert';

List<AdTicket> adTicketFromJson(String str) =>
    List<AdTicket>.from(json.decode(str).map((x) => AdTicket.fromJson(x)));

String adTicketToJson(List<AdTicket> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdTicket {
  AdTicket({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.image,
    required this.description_img,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String price;
  int quantity;
  String description;
  String image;
  List? description_img = [];
  int category;
  DateTime createdAt;
  DateTime updatedAt;

  factory AdTicket.fromJson(Map<String, dynamic> json) => AdTicket(
        id: json["id"],
        name: json["name"],
        price: json["price"].toString(),
        quantity: json["quantity"],
        image: json["image"],
        description: json["description"],
        category: json["category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        description_img: json['description_img'] != null
            ? jsonDecode(json['description_img']) as List
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "description": description,
        "image": image,
        "description_img": description_img,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
