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
      mask: '+### (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/png/splash_screen.png'),
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
                        ),
                      ),
                      inputFormatters: [maskFormatter],
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '+998 (',
                          hintStyle: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: SelfColors.lightGrey.withOpacity(0.51),
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(left: 40)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Button(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return OtpVerification(phoneNumber: "+" + maskFormatter.getUnmaskedText());
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  Button({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 23, right: 23),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Получить код',
          style: GoogleFonts.mulish(textStyle: SelfTextStyle.takeCodeTextStyle),
        ),
        style: ElevatedButton.styleFrom(
          primary: SelfColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
