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
      mask: '(##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var snackBar = SnackBar(
    backgroundColor: SelfColors.white,
    duration: const Duration(milliseconds: 700),
    content: Text(
      'Введите номер телефона!',
      style: GoogleFonts.mulish(
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: SelfColors.red),
      ),
    ),
  );
  var snackBarErrorLength = SnackBar(
      backgroundColor: SelfColors.white,
      duration: const Duration(milliseconds: 700),
      content: Text(
        'Номер телефона введен неверно!',
        style: GoogleFonts.mulish(
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: SelfColors.red)),
      ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
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
                      margin: const EdgeInsets.only(left: 23, right: 23),
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
                            color: SelfColors.black
                          ),
                        ),
                        inputFormatters: [maskFormatter],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefix: Text('+998', style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: SelfColors.black
                            ),
                          ),),
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
                    if (maskFormatter.getUnmaskedText().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (maskFormatter.getUnmaskedText().length < 9) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBarErrorLength);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return OtpVerification(
                              phoneNumber: "+998" + maskFormatter.getUnmaskedText());
                        }),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
