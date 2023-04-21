import 'dart:convert';

import 'package:flutter/foundation.dart';

class Products {
  int? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;
  List? description_img = [];

  Products(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? desc;
  String? shortDescription;
  String? image;
  String? offerTo;
  String? offerFrom;
  int? offerPrice;
  int? mrp;
  int? selectedQuantity;
  DateTime? rentFrom;
  DateTime? rentTo;
  int? quantity;
  Category? category;
  List? description_img = [];
  String? createdAt;
  String? type;
  String? updatedAt;
  Vendor? vendor;

  Product(
      {this.id,
      this.name,
      this.desc,
      this.shortDescription,
      this.selectedQuantity = 1,
      this.image,
      this.rentFrom,
      this.rentTo,
      this.offerTo,
      this.offerFrom,
      this.offerPrice,
      this.mrp,
      this.quantity,
      this.category,
      this.description_img,
      this.createdAt,
      this.vendor,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    shortDescription = json['short_description'];
    image = json['image'];
    offerTo = json['offer_to'];
       vendor =
        json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    offerFrom = json['offer_from'];
    offerPrice = json['offer_price'];
    rentFrom = json['rent_from'];
    rentTo = json['rent_to'];
    description_img = json['description_img'] != null
        ? jsonDecode(json['description_img']) as List
        : null;
    ;

    mrp = json['mrp'];
    quantity = json['quantity'];
    type = json['type'];
    category = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    selectedQuantity = 1;
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['short_description'] = this.shortDescription;
    data['image'] = this.image;
    data['offer_to'] = this.offerTo;
    data['offer_from'] = this.offerFrom;
    data['offer_price'] = this.offerPrice;
    data['rent_from'] = this.rentFrom?.toIso8601String();
    data['rent_to'] = this.rentTo?.toIso8601String();
    data['description_img'] = this.description_img;

    data['product_amount'] = this.mrp;

    data['quantity'] = this.quantity;
    data['category'] = null;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_quantity'] = this.selectedQuantity;
    data['product_amount'] = this.mrp;

    return data;
  }
}



class Vendor {
  int? id;
  String? name;
  String? email;
  String? profilePic;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Vendor(
      {this.id,
      this.name,
      this.email,
      this.profilePic,
      this.active,
      this.createdAt,
      this.updatedAt});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePic = json['profile_pic'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_pic'] = this.profilePic;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}