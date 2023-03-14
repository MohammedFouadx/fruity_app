
class Product {
  int? id;
  String? name;
  String? desc;
  String? price;
  String? image;

  Product({this.name, this.desc, this.price,  this.image});


  Product.fromJason(Map<String , dynamic> map ){
    if(map != null) {
      id = map['id'];
      name = map["proName"];
      desc = map["proDesc"];
      price = map["proPrice"];
      image = map["proImage"].toString() ;
    }
  }


  toJson() {
    return {
      'proName': name,
      'proDesc': desc,
      'proPrice': price,
      'proImage': image,
    };
  }
}