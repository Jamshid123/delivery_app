import 'package:delivery_app/ui/core/self_color.dart';
import 'package:delivery_app/ui/core/self_text_style.dart';
import 'package:delivery_app/ui/screens/widgets/catalog_products.dart';
import 'package:flutter/material.dart';

// enum FoodType { big, small }
typedef VoidCallback = void Function();

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // FoodType? type;
  // bool _pressBigButton = false;
  // bool _pressSmallButton = false;
  // int quantity = 0;
  // int part = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFE5E5E5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFE5E5E5),
          centerTitle: true,
          title: Text('Добро пожаловать!',
              style: SelfTextStyle.textAppBarMenuTextStyle),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/png/btn_back_menu.png'),
            )),
            child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.arrow_back_ios,
                      color: SelfColors.greyBackButton),
                )),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                height: 132,
                width: 347,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/menu_picture.png'),
                  ),
                ),
              ),
            ),
            CatalogProducts()
          ],
        ),
      ),
    );
  }

  // Row cartFood() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         height: 247,
  //         width: 154,
  //         color: SelfColors.whiteLight,
  //         child: Column(
  //           children: [
  //             Image.asset('assets/png/food_picture.png'),
  //             Text('Чучвара', style: SelfTextStyle.textFoodNameTextStyle),
  //             SizedBox(height: 20),
  //             Container(
  //               width: 136,
  //               height: 22,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(50),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     height: 18,
  //                     width: 65,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(50),
  //                     ),
  //                     child: RaisedButton(
  //                       onPressed: () => setState(() {
  //                         _pressBigButton = !_pressBigButton;
  //                       }),
  //                       child: Text(
  //                         'Big',
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                           fontFamily: 'Mulish',
  //                           fontWeight: FontWeight.w400,
  //                           color: _pressBigButton
  //                               ? SelfColors.white
  //                               : SelfColors.lightGrey,
  //                         ),
  //                       ),
  //                       color: _pressBigButton
  //                           ? SelfColors.mainGreen
  //                           : SelfColors.whiteLight,
  //                     ),
  //                   ),
  //                   Container(
  //                     height: 18,
  //                     width: 65,
  //                     child: RaisedButton(
  //                       onPressed: () => setState(() {
  //                         _pressSmallButton = !_pressSmallButton;
  //                       }),
  //                       child: Text(
  //                         'Small',
  //                         style: TextStyle(
  //                             fontSize: 12,
  //                             fontFamily: 'Mulish',
  //                             fontWeight: FontWeight.w400,
  //                             color: _pressSmallButton
  //                                 ? SelfColors.white
  //                                 : SelfColors.lightGrey),
  //                       ),
  //                       color: _pressSmallButton
  //                           ? SelfColors.mainGreen
  //                           : SelfColors.whiteLight,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('239.80', style: SelfTextStyle.textFoodPriceTextStyle),
  //                 TextButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       quantity++;
  //                     });
  //                   },
  //                   child: Container(
  //                     width: 29,
  //                     height: 29,
  //                     child: Icon(
  //                       Icons.add,
  //                       color: SelfColors.white,
  //                     ),
  //                     margin: EdgeInsets.all(15),
  //                     decoration: BoxDecoration(
  //                         color: SelfColors.darkYellow,
  //                         borderRadius: BorderRadius.circular(32)),
  //                   ),
  //                 ),
  //                 Text(
  //                   quantity.toString(),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(width: 20),
  //       Container(
  //         height: 247,
  //         width: 154,
  //         color: SelfColors.whiteLight,
  //         child: Column(
  //           children: [
  //             Image.asset('assets/png/food_picture.png'),
  //             Text('Чучвара', style: SelfTextStyle.textFoodNameTextStyle),
  //             SizedBox(height: 55),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('239.80', style: SelfTextStyle.textFoodPriceTextStyle),
  //                 TextButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       part++;
  //                     });
  //                   },
  //                   child: Container(
  //                     width: 29,
  //                     height: 29,
  //                     child: Icon(
  //                       Icons.add,
  //                       color: SelfColors.white,
  //                     ),
  //                     // margin: EdgeInsets.all(15),
  //                     decoration: BoxDecoration(
  //                         color: SelfColors.darkYellow,
  //                         borderRadius: BorderRadius.circular(32)),
  //                   ),
  //                 ),
  //                 Text(
  //                   part.toString(),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
