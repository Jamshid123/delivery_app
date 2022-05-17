import 'package:delivery_app/ui/auth_pages/otp_verify_page.dart';
import 'package:delivery_app/ui/auth_pages/phone_number_page.dart';
import 'package:delivery_app/ui/main_page.dart';
import 'package:delivery_app/ui/screens/cart_screen.dart';
import 'package:delivery_app/ui/screens/menu_page.dart';
import 'package:delivery_app/ui/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(home: AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
