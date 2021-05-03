import 'package:get/state_manager.dart';
import 'package:test_getx/models/product.dart';

class ShoppingController extends GetxController {
  var products = List<Product>().obs; // ทำให้ product เป็น observable items.
  // Type products = RxList<Product> นะ

  @override
  void onInit() {
    fetchProducts(); // call API to initial data
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];

    // products.value = productResult;  // แบบนี้ depreciated แล้ว
    products.assignAll(productResult); // เก็บค่าทั้งหมดลงใน products
    
  }
}
