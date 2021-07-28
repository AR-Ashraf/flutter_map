import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

const String colorWhiteString = "#FCFCFC";
const String colorBlueString = "#2B8FDA";
const Color colorBlue = Colors.blue;
const Color colorWhite = Colors.white;
const Color textColor = Color(0xFF757575);
const Color snackbarColor = Color(0xffffae88);
const Color logoTextColor = Color.fromRGBO(0, 61, 105, 1);
const Color headerTextColor = Color.fromRGBO(26, 26, 26, 1);
const Color snackbarIconColor = colorWhite;
const Color textFieldHighlightBorderColor = Color.fromRGBO(236, 178, 107, 1);
const Color itemCounterColor = Color.fromRGBO(236, 178, 107, 1);
const Color errorColor = Colors.red;
const Color eyeIconColor = Colors.grey;
const Color clickableTextColor = colorBlue;
const Color checkboxActiveColor = colorBlue;
const Color toolbarWidgetColor = colorBlue;
const Color toolbarColor = colorWhite;
const Color modalDialogBackgroundColor = Colors.grey;

const double clickableTextFontSize = 14;

const String baskervilleFontFamilyName = 'Baskerville Old Face';
const String bookmanOldStyleFontFamilyName = 'Bookman Old Style Regular';
const String muliFontFamilyName = 'Muli-Regular';
const String robotoFontFamilyName = 'Roboto-Regular';
const String openSansFontFamilyName = 'OpenSans-Regular';

final EdgeInsets mainBodyPadding =
    const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);

final TextStyle logoTextBig = TextStyle(
  fontFamily: baskervilleFontFamilyName,
  fontSize: 60,
  color: logoTextColor,
);

final TextStyle logoTextSmall = TextStyle(
  fontFamily: baskervilleFontFamilyName,
  fontSize: 20,
  color: logoTextColor,
);

final TextStyle companyText = TextStyle(
  fontFamily: bookmanOldStyleFontFamilyName,
  fontSize: 18,
  color: logoTextColor,
);

final TextStyle headerBig = TextStyle(
  fontFamily: bookmanOldStyleFontFamilyName,
  fontSize: 28,
  color: headerTextColor,
);

final TextStyle bigTextFieldLabelStyle = TextStyle(
  fontFamily: robotoFontFamilyName,
  color: Colors.grey,
  fontSize: 16,
);

final TextStyle clickableTextStyle = TextStyle(
  fontFamily: robotoFontFamilyName,
  color: clickableTextColor,
  fontSize: 16,
);

final TextStyle footerQuestionText = TextStyle(
  fontFamily: robotoFontFamilyName,
  color: headerTextColor,
  fontSize: 22,
);
final TextStyle footerAnswerText = TextStyle(
  fontFamily: robotoFontFamilyName,
  color: clickableTextColor,
  fontSize: 24,
);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  //fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Map Page Styles -------------- Start
const Color confirm_pharmacy_back_arrowColor = Colors.black;
const Color confirm_pharmacy_containerColor = Colors.white;
const Color confirm_pharmacy_textColor = Colors.black;
const Color pharmacy_textColor = Colors.black;
const Color name_textColor = Colors.black;
const Color name_valueColor = Colors.grey;
const Color address_textColor = Colors.black;
const Color address_valueColor = Colors.grey;
const Color price_textColor = Colors.black;
const Color price_valueColor = Colors.red;
const Color another_pharmacy_buttonColor = Colors.white;
const Color another_pharmacy_textColor = Colors.blue;
const Color bottom_sheet_bgColor = Colors.white;
const Color bottom_sheet_nameColor = Colors.black;
const Color bottom_sheet_addressColor = Colors.black;
const Color bottom_sheet_address_valueColor = Colors.grey;
const Color bottom_sheet_open_textColor = Colors.black;
const Color bottom_sheet_open_valueColor = Colors.grey;
const Color bottom_sheet_rate_textColor = Colors.black;
const Color bottom_sheet_rate_ValueColor = Colors.red;
const Color select_pharmacy_buttonColor = Colors.blue;
const Color select_pharmacy_button_textColor = Colors.white;
const Color map_page_back_arrowColor = Colors.black;
const Color map_page_search_bgColor = Colors.white;
const Color thank_textColor = Colors.lightBlue;
const Color thank_description_textColor = Colors.grey;



final TextStyle confirm_pharmacyText = GoogleFonts.notoSerif(
    textStyle: TextStyle(
        fontSize: 36.0,
        color: confirm_pharmacy_textColor,
        fontWeight: FontWeight.bold),
);
final TextStyle pharmacyText = GoogleFonts.notoSerif(
  textStyle: TextStyle(
      fontSize: 36.0,
      color: pharmacy_textColor,
      fontWeight: FontWeight.bold),
);
final TextStyle nameText = GoogleFonts.didactGothic(
  textStyle: TextStyle(
      fontSize: 24.0,
      color: name_textColor,
      fontWeight: FontWeight.bold),
);
final TextStyle nameValue = GoogleFonts.didactGothic(
  textStyle: TextStyle(
      fontSize: 24.0,
      color: name_valueColor,
      fontWeight: FontWeight.normal),
);
final TextStyle addressText = GoogleFonts.didactGothic(
  textStyle: TextStyle(
      fontSize: 24.0,
      color: address_textColor,
      fontWeight: FontWeight.bold),
);
final TextStyle addressValue = GoogleFonts.didactGothic(
  textStyle: TextStyle(
      fontSize: 24.0,
      color: address_valueColor,
      fontWeight: FontWeight.normal),
);
final TextStyle priceText = GoogleFonts.didactGothic(
  textStyle: TextStyle(
      fontSize: 24.0,
      color: price_textColor,
      fontWeight: FontWeight.bold),
);
final TextStyle priceValue = GoogleFonts.didactGothic(
  textStyle: TextStyle(
      fontSize: 24.0,
      color: price_valueColor,
      fontWeight: FontWeight.normal),
);
final TextStyle another_pharmacyText = TextStyle(
    fontSize: 18.0,
    color: another_pharmacy_textColor,
    fontWeight: FontWeight.normal
);
final TextStyle bottom_sheet_nameText = TextStyle(
    fontSize: 24.0,
    color: bottom_sheet_nameColor,
    fontWeight: FontWeight.bold,
);
final TextStyle bottom_sheet_addressText = TextStyle(
    fontSize: 20.0,
    color: bottom_sheet_addressColor,
    fontWeight: FontWeight.bold,
);
final TextStyle bottom_sheet_addressValue = TextStyle(
    fontSize: 20.0,
    color: bottom_sheet_address_valueColor,
    fontWeight: FontWeight.normal
);
final TextStyle bottom_sheet_openText = TextStyle(
    fontSize: 20.0,
    color: bottom_sheet_open_textColor,
    fontWeight: FontWeight.bold
);
final TextStyle bottom_sheet_openValue = TextStyle(
    fontSize: 20.0,
    color: bottom_sheet_open_valueColor,
    fontWeight: FontWeight.normal
);
final TextStyle bottom_sheet_rateText = TextStyle(
    fontSize: 20.0,
    color: bottom_sheet_rate_textColor,
    fontWeight: FontWeight.bold
);
final TextStyle bottom_sheet_rateValue = TextStyle(
    fontSize: 20.0,
    color: bottom_sheet_rate_ValueColor,
    fontWeight: FontWeight.normal
);
final TextStyle select_pharmacy_buttonText = TextStyle(
    fontSize: 18.0,
    color: select_pharmacy_button_textColor,
    fontWeight: FontWeight.bold
);

final TextStyle thank_text = TextStyle(
    fontFamily: openSansFontFamilyName,
    color: thank_textColor,
    fontSize: 22.0,
    fontWeight: FontWeight.bold
);
final TextStyle thank_description_text = TextStyle(
    fontFamily: openSansFontFamilyName,
    color: thank_description_textColor,
    fontSize: 18.0,
    fontWeight: FontWeight.normal
);

// Map Page Styles ------------- End
