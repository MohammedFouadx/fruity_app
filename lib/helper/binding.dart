import 'package:get/get.dart';
import '../features/cart/cart_controller.dart';
import '../features/home/home_controller.dart';


class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewController());
    Get.lazyPut(() => CartController(cartRepository: Get.find()));

  }

}