
import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/core/constants/consts.dart';
import 'package:flutter_map/presentation/core/constants/image_path.dart';
import 'package:flutter_map/presentation/core/theme/style.dart';

class AuthenticationAppBar extends AppBar {
  AuthenticationAppBar(
      {Key key, bool isAutomaticallyImplyLeading, List<Widget> actions})
      : super(
          key: key,
          elevation: 0,
          automaticallyImplyLeading: isAutomaticallyImplyLeading ?? false,
          title: Container(
            width: 75,
            height: 60,
            //color: Colors.black,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Positioned(
                  top: 10.0,
                  left: 0.0,
                  height: 20.0,
                  width: 100.0,
                  child: Text(
                    appName,
                    style: logoTextSmall,
                  ),
                ),
                Positioned(
                  top: 25.0,
                  left: -12.0,
                  height: 20.0,
                  //width: 100.0,
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(ImagePath.logoImagePath),
                  ),
                ),
              ],
            ),
          ),
          actions: actions,
        );
}
