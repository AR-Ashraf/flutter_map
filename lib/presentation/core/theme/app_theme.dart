
import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/core/theme/style.dart';
import 'package:flutter_map/presentation/core/utils/size_config.dart';

enum AppTheme {
  Light,
  Dark,
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: colorWhite,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.blueAccent),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: robotoFontFamilyName,
        color: Colors.blueAccent,
        fontSize: 20.0,
      ),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: textColor),
    bodyText2: TextStyle(color: textColor),
  );
}

ButtonThemeData buttonTheme() {
  return ButtonThemeData(
    buttonColor: Colors.blueAccent,
    textTheme: ButtonTextTheme.primary,
  );
}

InputDecorationTheme borderInputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: textColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: unfocusedUnderlineInputBorder(),
  focusedBorder: focusedUnderlineInputBorder(),
  enabledBorder: focusedUnderlineInputBorder(),
);

InputDecorationTheme flatInputDecorationTheme() {
  return InputDecorationTheme(
    labelStyle: bigTextFieldLabelStyle,
    focusedBorder: focusedUnderlineInputBorder(),
  );
}

UnderlineInputBorder focusedUnderlineInputBorder() {
  return UnderlineInputBorder(
      borderSide: BorderSide(
    color: textFieldHighlightBorderColor,
    width: 2.0,
  ));
}

UnderlineInputBorder unfocusedUnderlineInputBorder() {
  return UnderlineInputBorder(
      borderSide: BorderSide(
    width: 1.0,
  ));
}

getTheme(BuildContext context) => {
      AppTheme.Light: ThemeData(
        scaffoldBackgroundColor: colorWhite,
        //fontFamily: "Noto Sans JP",
        //fontFamily: "Open Sans",
        fontFamily: robotoFontFamilyName,
        //fontFamily: "Baskerville Old Face",
        //fontFamily: "Bookman Old Style Regular",
        //fontFamily: "Muli-Regular",
        appBarTheme: appBarTheme(),
        textTheme: textTheme(),
        inputDecorationTheme: flatInputDecorationTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: colorWhite,
        buttonTheme: buttonTheme(),
      ),
      AppTheme.Dark: ThemeData(
        brightness: Brightness.dark,
      ),
    };
