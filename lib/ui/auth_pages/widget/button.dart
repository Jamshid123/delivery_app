import 'package:delivery_app/ui/core/self_color.dart';
import 'package:delivery_app/ui/core/self_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  Button({required this.onPressed,  required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 23, right: 23),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
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
