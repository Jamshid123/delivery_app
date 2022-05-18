import 'package:delivery_app/ui/core/self_color.dart';
import 'package:delivery_app/ui/core/self_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum LangType {
  ru,
  uz,
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  LangType? _langType;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Настройки',
            style: GoogleFonts.mulish(
                textStyle: SelfTextStyle.appBarHeadingTextStyle),
          ),
        ),
        body: Center(
          child: Container(
            height: _screenHeight * 0.45,
            width: _screenWidth * 0.88,
            decoration: BoxDecoration(
              color: SelfColors.whiteLight,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 5),
                  blurRadius: 10,
                  color: const Color(0xFFAEAEC0).withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSettingsButton(title: 'Профиль', onTap: () {}),
                const SizedBox(height: 50),
                buildSettingsButton(title: 'Наш адрес', onTap: () {}),
                const SizedBox(height: 50),
                buildSettingsButton(
                    title: 'Язык',
                    onTap: () {
                      buildChooseLanguageBottomSheet(context);
                    }),
                const SizedBox(height: 50),
                buildSettingsButton(title: 'Выход', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildChooseLanguageBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 280,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Выберите язык',
                    style: GoogleFonts.mulish(
                        textStyle: SelfTextStyle.chooseLangTextStyle),
                  ),
                  const SizedBox(height: 54),
                  buildLanguageButton(
                      activeColor: _langType == LangType.ru
                          ? SelfColors.lightGreen
                          : SelfColors.white,
                      title: 'Русский язык',
                      onTap: () {
                        setState(() {
                          _langType = LangType.ru;
                        });
                      }),
                  const SizedBox(height: 64),
                  buildLanguageButton(
                      activeColor: _langType == LangType.uz
                          ? SelfColors.lightGreen
                          : SelfColors.white,
                      title: 'O\'zbek tili',
                      onTap: () {
                        setState(() {
                          _langType = LangType.uz;
                        });
                      }),
                ],
              ),
            );
          });
        });
  }

  Widget buildLanguageButton(
      {required String title,
      required Color activeColor,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 38, right: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                GoogleFonts.mulish(textStyle: SelfTextStyle.languageTextStyle),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: SelfColors.darkWhite,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: activeColor,
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettingsButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.mulish(
                textStyle: SelfTextStyle.settingsButtonTextStyle),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
