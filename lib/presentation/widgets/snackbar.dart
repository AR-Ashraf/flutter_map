import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/core/theme/style.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({Key key, String snackBarMessage, IconData icon})
      : super(
          key: key,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(snackBarMessage),
              Icon(icon, color: snackbarIconColor),
            ],
          ),
          backgroundColor: snackbarColor,
        );
}
