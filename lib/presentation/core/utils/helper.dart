import 'package:flutter/widgets.dart';

Color toRGB(String hexCode) => Color(int.parse('0xff' + hexCode));

String formattedDate(DateTime dateTime) => dateTime is DateTime
    ? '${dateTime.day} / ${dateTime.month}/ ${dateTime.year}'
    : '';
