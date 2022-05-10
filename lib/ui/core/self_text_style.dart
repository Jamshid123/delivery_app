import 'package:delivery_app/ui/core/self_color.dart';
import 'package:flutter/material.dart';

class SelfTextStyle{
  static const TextStyle enterYourNumberTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: SelfColors.lightGrey,
  );
  static const TextStyle takeCodeTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: SelfColors.white,
  );
  static const TextStyle numberHintTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static const TextStyle sendCodeRetryTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: SelfColors.black
  );
  static const TextStyle appBarHeadingTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: SelfColors.black
  );
  static const TextStyle settingsButtonTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: SelfColors.blackSettingPageText
  );
  static const TextStyle chooseLangTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: SelfColors.blackChooseLang
  );
}