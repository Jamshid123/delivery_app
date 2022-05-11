import 'package:delivery_app/ui/auth_pages/widget/button.dart';
import 'package:delivery_app/ui/core/self_color.dart';
import 'package:delivery_app/ui/core/self_text_style.dart';
import 'package:delivery_app/ui/settings_page/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  final phoneNumber;
  OtpVerification({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState(phoneNumber);
}

class _OtpVerificationState extends State<OtpVerification> {
  final String phoneNumber;
  var _verificationId;
  // var _otpController = TextEditingController();
  var currentText;
  FirebaseAuth _auth = FirebaseAuth.instance;
  _OtpVerificationState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left, color: Colors.black,),
          ),
          centerTitle: true,
          title: Text(
            'Верификация',
            style: GoogleFonts.mulish(
                textStyle: SelfTextStyle.appBarHeadingTextStyle),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/png/logo.png'),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Введите код, отправленный на ваш номер ',
                      style: GoogleFonts.mulish(
                          textStyle: SelfTextStyle.enterYourNumberTextStyle),
                    ),
                  ),
                  const SizedBox(height: 12),
                  buildOTPField(context),
                ],
              ),
              const SizedBox(height: 20),
              Button(
                  onPressed: () {
                    _sendCodeToFirebase(code: currentText);
                  },
                  title: 'Войти'),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  _verifyPhoneNumber();
                },
                child: Text(
                  'Отправить код повторно',
                  style: GoogleFonts.mulish(
                      textStyle: SelfTextStyle.sendCodeRetryTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PinCodeTextField buildOTPField(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      appContext: context,
      showCursor: true,
      cursorColor: SelfColors.black,
      cursorHeight: 25,
      pinTheme: PinTheme(
        fieldHeight: 50,
        fieldWidth: 50,
        activeColor: SelfColors.green,
        inactiveColor: SelfColors.green,
        activeFillColor: SelfColors.green,
        inactiveFillColor: SelfColors.green,
        disabledColor: SelfColors.green,
        selectedColor: SelfColors.green,
        shape: PinCodeFieldShape.box,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      length: 6,
      onChanged: (String value) {
        setState(() {
          currentText = value;
        });
      },
    );
  }

  Future _verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phonesAuthCredentials) async {},
        verificationFailed: (verificationFailed) async {},
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            _verificationId = verificationId;
          });
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  Future _sendCodeToFirebase({String? code}) async {
    if (_verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code!);

      await _auth.signInWithCredential(credential).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SettingsPage();
        }));
      });
    }
  }
}
