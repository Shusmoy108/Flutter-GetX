import 'package:GetX/src/models/Products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum = sum + item.price);
  int get totalItem => cartItems.fold(0, (count, item) => count = count + 1);
  addToCart(Product product) {
    cartItems.add(product);
  }
}
