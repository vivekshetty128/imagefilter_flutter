//Textstyle
import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 0, 139, 21);

const TextStyle fontFamilyPoppinsBold = TextStyle(fontFamily: 'Poppins-Bold');
const TextStyle fontFamilyPoppinsRegular =
    TextStyle(fontFamily: 'Poppins-Regular');
const TextStyle fontFamilyPoppinsLight = TextStyle(fontFamily: 'Poppins-Light');
const TextStyle fontFamilyPoppinsMedium =
    TextStyle(fontFamily: 'Poppins-Medium');

extension TextStyleHelpers on TextStyle {
  TextStyle get size13 => copyWith(fontSize: 13);

  TextStyle get size14 => copyWith(fontSize: 14);

  TextStyle get size15 => copyWith(fontSize: 15);

  TextStyle get size16 => copyWith(fontSize: 16);

  TextStyle get size17 => copyWith(fontSize: 17);

  TextStyle get size18 => copyWith(fontSize: 18);

  TextStyle get size24 => copyWith(fontSize: 24);

  TextStyle get colorGrey => copyWith(color: Colors.grey);

  TextStyle get colorBlack => copyWith(color: Colors.black);

  TextStyle get primaryTextColor => copyWith(color: primaryColor);
}
