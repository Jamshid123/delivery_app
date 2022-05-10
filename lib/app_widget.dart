import 'package:delivery_app/ui/auth_pages/otp_verify_page.dart';
import 'package:delivery_app/ui/auth_pages/phone_number_page.dart';
import 'package:delivery_app/ui/settings_page.dart';
import 'package:flutter/material.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SettingsPage(),
    );
  }
}
