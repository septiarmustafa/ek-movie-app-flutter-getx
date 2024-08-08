import 'package:flutter/material.dart';

class AppColor {
  // PRIMARY COLOR
  static const Color blueColor = Color(0xff003780);
  static const Color blueColor5p = Color(0xFF2195F3);
  static const Color backgroundColor = Color(0xFF15141F);
  static const Color dark = Color(0xFF0E121A);
  static const Color redColor = Color(0xffFF0000);
  static const Color brownColor = Color(0xffF08519);
  static const Color errorColor = Color(0xffFF0000); //Danger - Use for errors
  static const Color successColor = Color(0xff0B9444); //Succes - Use for Succes
  static const Color successColor2 =
      Color(0xff1EEB4B); //Succes 2 - Use for Succes
  static const Color warningColor = Color(0xffFFB715);

  // BASE COLOR
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color whiteColor2 = Color(0xffF9F9F9);

  // SECONDARY COLOR
  static const Color secondaryColor = Color(0xff6C6C6C);
  static const Color secondaryColor2 = Color(0xff838383);

  // TEXT COLOR
  static const Color textBlackColor = Color(0xff292929);
  static const Color textWhiteColor = Color(0xffF8F8F8);

  static const Color weakColor =
      Color(0xFFBDBDBD); //Weak - Use for secondary text
  static const Color weak2Color =
      Color(0xFFF6F4F4); //Weak - Use for secondary text
  static const Color bgForm = Color(0xfff9f9f9);

  static const Color bluePrimary2 = Color(0xff29B7E8);

  static const Color greyColor = Color(0xff777777);

  static const Color blueAccent = Color(0xff1171EB);

  //GRADIENT
  static const LinearGradient gradientPrimary = LinearGradient(colors: [
    Color(0xff1171EB),
    Color(0xff003780),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static const LinearGradient gradientPurple = LinearGradient(colors: [
    Color(0xFF7F2AA8),
    Color(0XFFE1A3FF),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static const LinearGradient gradientRed = LinearGradient(colors: [
    Color(0xffFF0000),
    Color(0xff751111),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static const LinearGradient gradientBrown = LinearGradient(colors: [
    Color(0xffF08519),
    Color(0xffFFB162),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static BoxShadow shadow = BoxShadow(
    color: Colors.black.withOpacity(0.055),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(3, 5),
  );
}
