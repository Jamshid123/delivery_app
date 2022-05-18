import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/cart_controller.dart';
import 'package:delivery_app/models/product_model.dart';
import '../../core/self_color.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int index;
  final int quantity;
  const CartProductCard(
      {Key? key,
      required this.product,
      required this.controller,
      required this.index,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 328,
            height: 164,
            color: SelfColors.whiteLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  product.image,
                ),
                Text(product.name),
                Text('${product.price}'),
                IconButton(
                    onPressed: () {
                      controller.removeProduct(product);
                    },
                    icon: Icon(Icons.remove_circle)),
                Text('$quantity'),
                IconButton(
                    onPressed: () {
                      controller.addProduct(product);
                    },
                    icon: Icon(Icons.add_circle)),
              ],
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   height: 164,
    //   width: 328,
    //   color: SelfColors.red,
    //   child: Column(
    //     children: [
    //       Image.asset(Product.products[index].image),
    //       Text(Product.products[index].name),
    //       IconButton(
    //           onPressed: () {
    //             controller.removeProduct(product);
    //           },
    //           icon: Icon(Icons.add_circle)),
    //       Text('$quantity'),
    //       IconButton(
    //           onPressed: () {
    //             controller.addProduct(product);
    //           },
    //           icon: Icon(Icons.add_circle)),
    //     ],
    //   ),
    // );
  }
}
