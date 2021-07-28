
import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/core/constants/image_path.dart';
import 'package:flutter_map/presentation/core/theme/style.dart';
import 'package:flutter_map/presentation/pages/map/strings/map_page_strings.dart';

import 'flatbutton.dart';

class ThankDialogue extends Dialog {
  ThankDialogue({Key key,  @required VoidCallback onPressed, @required BuildContext context})
      : super(
    key: key,
    elevation: 10,
    child: Container(
      height: MediaQuery.of(context).size.height * (0.5),
      width: MediaQuery.of(context).size.width * (0.8),
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:  Image(
              height: MediaQuery.of(context).size.height * (0.25),
              width: MediaQuery.of(context).size.width * (0.5),
              image: AssetImage(ImagePath.thankImagePath),
            ),
          ),
          Text(
            MapPageStrings.thank_text,
            textAlign: TextAlign.center,
            style: thank_text,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              MapPageStrings.thank_description_text,

              textAlign: TextAlign.left,
              style: thank_description_text,
            ),
          ),
          BigFlatButton(
            buttonText: "Ok",
              onPressed: onPressed,
          ),
        ],
      ),
    ),
  );
}