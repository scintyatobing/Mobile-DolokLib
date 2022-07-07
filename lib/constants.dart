import 'package:flutter/material.dart';
import 'package:DolokLib/size_config.dart';

const kPrimaryColor = Color(0xFF1A77F6);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Masukkan email anda...";
const String kInvalidEmailError = "Maaf Email Anda Tidak Valid";
const String kPassNullError = "Masukkan password anda...";
const String kShortPassError = "Password anda terlalu singkat...";
const String kMatchPassError = "Passwords tidak cocok";
const String kNamelNullError = "Masukkan Nama Anda...";
const String kPhoneNumberNullError = "Masukkan Nomor Telepon Anda..";
const String kAddressNullError = "Masukkan Alamat Anda..";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
