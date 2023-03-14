import 'package:get/get.dart';
import '../../data/models/cart.dart';
import '../../data/models/product.dart';
import 'cart_repo.dart';

class CartController extends GetxController{
  final CartRepository cartRepository;
  CartController({required this.cartRepository});

  Map<int , CartModel> _items = {};

  void addItem(Product product ,  int quantity){

    if(_items.containsKey(product.id)){
      _items.update(product.id!, (value) {

        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            image: value.image,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString()

        );
      });
    }else {

      _items.putIfAbsent(product.id!, () {
        print(product.id.toString()  + "quantity " + quantity.toString()  );
        return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            image: product.image,
            // category: product.category,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString()

        );
      } );
    }


  }
}