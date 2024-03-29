import 'package:delivery_app/ui/auth_pages/widget/button.dart';
import 'package:delivery_app/ui/core/self_color.dart';
import 'package:delivery_app/ui/core/self_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'otp_verify_page.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  var maskFormatter = MaskTextInputFormatter(
      mask: ' (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/png/logo.png'),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Введите ваш номер телефона ',
                        style: GoogleFonts.mulish(
                            textStyle: SelfTextStyle.enterYourNumberTextStyle),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 23),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: SelfColors.green),
                      ),
                      child: TextFormField(
                        cursorColor: SelfColors.black,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: SelfColors.black),
                        ),
                        inputFormatters: [maskFormatter],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefix: Text(
                            '+998',
                            style: GoogleFonts.nunito(
                              textStyle: SelfTextStyle.phoneNumberTextStyle,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(left: 40),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Button(
                  title: 'Получить код',
                  onPressed: () {
                   validator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void validator(){
    if (maskFormatter.getUnmaskedText().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 800),
        content: CustomContent(
          errorText:
          'Поле ввода пустое. Введите номер телефона',
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
    } else if (maskFormatter.getUnmaskedText().length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 800),
        content: CustomContent(
          errorText: 'Введен неверный номер телефона',
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return OtpVerification(
              phoneNumber:
              "+998" + maskFormatter.getUnmaskedText());
        }),
      );
    }
  }
}

class CustomContent extends StatelessWidget {
  final String errorText;
  CustomContent({required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.redAccent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Упс! Что-то пошло не так',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Text(
            errorText,
            maxLines: 2,
            style: GoogleFonts.mulish(textStyle: SelfTextStyle.errorTextStyle),
          ),
        ],
      ),
    );
  }
}
