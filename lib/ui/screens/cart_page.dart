import 'package:delivery_app/ui/screens/widgets/cart_products.dart';
import 'package:delivery_app/ui/screens/widgets/cart_total.dart';
import 'package:flutter/material.dart';
import '../../controllers/cart_controller.dart';
import '../../models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: Column(
        children: [
          CartProducts(),
          CartTotal(),
        ],
      ),
    );
  }
}
