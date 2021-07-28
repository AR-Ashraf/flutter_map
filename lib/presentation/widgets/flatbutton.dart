import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/core/theme/style.dart';

class BigFlatButton extends FlatButton {
  BigFlatButton(
      {Key key,
      String buttonText,
      double fontSize,
      IconData icon,
      @required VoidCallback onPressed})
      : super(
          key: key,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: colorBlue,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: icon == null ? false : true,
                child: Icon(
                  icon,
                  color: colorWhite,
                ),
              ),
              Visibility(
                visible: icon == null ? false : true,
                child: SizedBox(
                  width: 8.0,
                ),
              ),
              Text(
                buttonText,
                style: TextStyle(
                  fontFamily: robotoFontFamilyName,
                  color: colorWhite,
                  fontSize: fontSize ?? 18.0,
                ),
              )
            ],
          ),
        );
}
