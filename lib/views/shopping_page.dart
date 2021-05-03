import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/controllers/cart_controller.dart';
import 'package:test_getx/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController()); // Create controller (shoppingController) and put it in the dependency (Get.put)
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                print('Add to Cart');
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),  // ตรงไหนที่ต้องการ update ก็ wrap ด้วย GetX เท่านั้นเอง
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, 
          label: GetX<CartController>(
            builder: (controller) {
              return Text(controller.count.toString(), style: TextStyle(color: Colors.white, fontSize: 28),);
            }
          ),
          icon: Icon(Icons.add_shopping_cart_outlined, color: Colors.white,),),
    );
  }
}
