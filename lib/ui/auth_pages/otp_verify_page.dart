import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class OtpVerification extends StatefulWidget {
  final phoneNumber;
  OtpVerification({Key? key ,required this.phoneNumber}) :super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState(phoneNumber);
}

class _OtpVerificationState extends State<OtpVerification> {
  final phoneNumber;
  var _verificationId;
  var _otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  _OtpVerificationState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  Future _verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phonesAuthCredentials) async {},
        verificationFailed: (verificationFailed) async {},
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            this._verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  Future _sendCodeToFirebase({String? code}) async {
    if (this._verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code!);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
        print('GOTOVO!');
      });
    }
  }
  var currentText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/png/splash_screen.png'),
            Form(
              child: PinCodeTextField(appContext: context, length: 5, onChanged: (String value) {  },

              ),
            ),


          ],
        ),
      ),
    );
  }
}

