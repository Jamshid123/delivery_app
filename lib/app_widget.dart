import 'package:delivery_app/ui/auth_pages/phone_number_page.dart';
import 'package:flutter/material.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhoneNumber(),
    );
  }
}
