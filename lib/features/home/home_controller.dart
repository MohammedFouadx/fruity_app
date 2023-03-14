import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../cart/cart_controller.dart';
import 'home_services.dart';

class HomeViewController extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<Product> get product => _product;
  List<Product> _product = [];
  int _quantity = 0;
  int get quantity => _quantity;
  late CartController _cart;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems+quantity;

  HomeViewController (){
    getFruits();
  }


  getFruits() async {
    _loading.value = true;
    HomeService().getFruty().then((value)  {
      for(int i = 0; i< value.length; i++){
        _product.add(Product.fromJason(value[i].data() as Map<String, dynamic>))  ;
        //_loading.value = false;
      }
      loading.value = false;
      print("///////////////$_product");
      update();
    });

  }

  Future queryData(String query) async{
    return FirebaseFirestore.instance.collection('products').where(
      'proName' , isGreaterThanOrEqualTo : query,
    ).get();
  }

  void setQuantity (bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }

  checkQuantity(int quantity){
    if(quantity <0){
      Get.snackbar(
        'Item Count',
        'you can not reduce more!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 12,
        icon: const Icon(Icons.info , color: Colors.white,),
        shouldIconPulse: true,

      );
      return 0;
    }else if(quantity > 20){
      Get.snackbar(
        'Item Count',
        'you can not add more!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 12,
        icon: const Icon(Icons.info , color: Colors.white,),
        shouldIconPulse: true,

      );
      return 20;
    }else {
      return quantity;
    }

  }

  initData(CartController cart){
    _quantity =0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(Product product){
    if(_quantity > 0){
      _cart.addItem(product, _quantity);
    }
    else{
      Get.snackbar(
        'Item Count',
        'you should add at least one item',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 12,
        // dismissDirection: Dis.vertical ,
        duration: const Duration(seconds: 5),
        icon: const Icon(Icons.info , color: Colors.white,),
        shouldIconPulse: true,);
    }

  }

}

// value.docs[i].data())