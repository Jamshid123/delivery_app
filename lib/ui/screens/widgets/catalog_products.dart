import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/ui/core/self_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

enum FoodType { big, small }

typedef VoidCallback = void Function();

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: Product.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogProductCard(index: index);
            }));
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;

  FoodType? type;
  bool _pressBigButton = false;
  bool _pressSmallButton = false;
  int quantity = 0;
  int part = 0;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
      child: Row(
        children: [
          Container(
            height: 240,
            width: 154,
            color: SelfColors.whiteLight,
            child: Column(
              children: [
                Image.asset(
                  Product.products[index].image,
                  fit: BoxFit.cover,
                ),
                Text(Product.products[index].name),
                Text('${Product.products[index].price}'),
                IconButton(
                  onPressed: () {
                    cartController.addProduct(Product.products[index]);
                  },
                  icon: Icon(Icons.add_circle),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 240,
            width: 154,
            color: SelfColors.whiteLight,
            child: Column(
              children: [
                Image.asset(Product.products[index].image, fit: BoxFit.fill),
                Text(Product.products[index].name),
                // Text('${Product.products[index].price}'),
                Container(
                  width: 136,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 18,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            _pressBigButton = !_pressBigButton;
                          },
                          child: Text(
                            'Big',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w400,
                                color: _pressBigButton
                                    ? SelfColors.white
                                    : SelfColors.lightGrey),
                          ),
                          color: _pressBigButton
                              ? SelfColors.mainGreen
                              : SelfColors.whiteLight,
                        ),
                      ),
                      Container(
                        height: 18,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            _pressSmallButton = !_pressSmallButton;
                          },
                          child: Text(
                            'Small',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w400,
                                color: _pressBigButton
                                    ? SelfColors.white
                                    : SelfColors.lightGrey),
                          ),
                          color: _pressSmallButton
                              ? SelfColors.mainGreen
                              : SelfColors.whiteLight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${Product.products[index].price}'),
                    IconButton(
                      onPressed: () {
                        cartController.addProduct(Product.products[index]);
                      },
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
