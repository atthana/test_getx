import 'package:get/state_manager.dart';
import 'package:test_getx/models/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs; // ทำให้ cartItems เป็น observable เช่นกัน

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  // เมื่อ cartItems มีการเปลี่ยน จะเข้ามา update ใน totalPrice ด้วยทันที และ return ออกไปเป็น double 

  int get count => cartItems.length;  //เมื่อ cartItems เปลี่ยนก็จะ upate ค่าและ return ออกไปเป็น int

  addToCart(Product product) {
    cartItems.add(product); // เมื่อมีเรียก addToCart ก็จะรับ product เข้ามาเพิ่มใน cartItems
  }
}
