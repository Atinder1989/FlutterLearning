import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/card_controller.dart';
import 'package:flutter_getx/controllers/shopping_controller.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print("======= build ============= ");
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return getCard(controller, index);
                  });
            })),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total Amount: \$ ${controller.totalPrice}",
                style: TextStyle(color: Colors.white, fontSize: 32),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text("${controller.count}");
        }),
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.shopping_basket_rounded,
          color: Colors.black,
        ),
      ),
    );
  }

  Card getCard(ShoppingController controller, int index) {
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
                    Text('${controller.products[index].productDescription}'),
                  ],
                ),
                Text('\$${controller.products[index].price}',
                    style: TextStyle(fontSize: 24)),
              ],
            ),

            RaisedButton(
              onPressed: () {
                cartController.addToCart(controller.products[index]);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Add to Cart'),
            ),

            // Obx(() => IconButton(
            //   icon: controller
            //       .products[index].isFavorite.value
            //       ? Icon(Icons.check_box_rounded)
            //       : Icon(Icons
            //       .check_box_outline_blank_outlined),
            //   onPressed: () {
            //     controller.products[index].isFavorite
            //         .toggle();
            //   },
            // ))
          ],
        ),
      ),
    );
  }
}
