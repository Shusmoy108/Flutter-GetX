import 'package:GetX/src/controllers/CartController.dart';
import 'package:GetX/src/controllers/ShoppingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${controller.products[index].productName}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Text(
                                              '${controller.products[index].productDescription}'),
                                        ],
                                      ),
                                      Text(
                                          '\$${controller.products[index].price}',
                                          style: TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      cartController.addToCart(
                                          controller.products[index]);
                                    },
                                    // color: Colors.blue,
                                    // textColor: Colors.white,
                                    child: Text('Add to Cart'),
                                  )
                                ])));
                  });
            })),
            GetX<CartController>(builder: (controller) {
              return Text("Total Amount: \$ ${controller.totalPrice}");
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            label: Obx(() {
              return Text("${cartController.totalItem}");
            })));
  }
}
