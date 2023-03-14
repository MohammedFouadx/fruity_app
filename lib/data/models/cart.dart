
import 'package:flutter/material.dart';


class CartModel {
  int? id;
  String? name;
  String? image;
  String? price;
  int? quantity;
  bool? isExist;
  String? time;


  CartModel(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.quantity,
        this.isExist,
        this.time
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['proName'];
    image = json['proImage'];
    price = json['proPrice'].toString() ;
    quantity = json['quantity'] ;
    isExist = json['isExist'] ;
    time = json['time'];
  }
}
