import 'package:delivery_app/ui/core/self_color.dart';
import 'package:delivery_app/ui/screens/cart_page.dart';
import 'package:delivery_app/ui/screens/menu_page.dart';
import 'package:delivery_app/ui/screens/settings_page.dart';
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
  final List<Widget> _pages = [
    const MenuPage(),
    const CartScreen(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        height: 86,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(color: SelfColors.whiteLight, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: SelfColors.whiteLight,
            selectedItemColor: SelfColors.mainGreen,
            selectedFontSize: 15,
            iconSize: 24,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.food_bank_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          ),
        ),
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

/*
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
// ), // This trailing comma makes auto-formatting nicer for build methods

 */
