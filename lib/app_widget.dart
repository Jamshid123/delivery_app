import 'dart:collection';

import 'package:delivery_app/ui/auth_pages/otp_verify_page.dart';
import 'package:delivery_app/ui/auth_pages/phone_number_page.dart';
import 'package:delivery_app/ui/main_page.dart';
import 'package:delivery_app/ui/screens/address_page.dart';
import 'package:delivery_app/ui/screens/cart_page.dart';
import 'package:delivery_app/ui/screens/map.dart';
import 'package:delivery_app/ui/screens/menu_page.dart';
import 'package:delivery_app/ui/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(home: AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapSample(),
    );
  }
}
