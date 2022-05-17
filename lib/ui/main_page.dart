import 'package:delivery_app/ui/core/self_color.dart';
import 'package:delivery_app/ui/screens/cart_screen.dart';
import 'package:delivery_app/ui/screens/menu_page.dart';
import 'package:delivery_app/ui/screens/order_page.dart';
import 'package:delivery_app/ui/screens/widgets/cart_products.dart';
import 'package:delivery_app/ui/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // int _counter = 0;
  // final TelegramClient telegramClient = new TelegramClient(
  //   chatId: "@flutter_oshxona",
  //   botToken: "5359979166:AAFKSaTkL5uVXTVhIzl2METPdP6E-tIC4Ss",
  // );
  //
  // Future<void> _incrementCounter() async {
  //   setState(() {
  //     _counter++;
  //   });
  //   final String message = "Заказ N600: Гарнир 600 порции, 600 компотов";
  //   final response = await telegramClient.sendMessage(message);
  //   print(response.statusCode);
  // }

  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    MenuPage(),
    CartScreen(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 86,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(color: SelfColors.whiteLight, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          child: BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,

            currentIndex: this._selectedIndex,

            backgroundColor: SelfColors.whiteLight,
            selectedItemColor: SelfColors.mainGreen,
            selectedFontSize: 15,
            iconSize: 24,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.food_bank_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          ),
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
