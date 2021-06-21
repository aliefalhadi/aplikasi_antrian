import 'package:flutter/material.dart';

TextStyle textBlack = TextStyle(color: Colors.black);

TextStyle textWhite = TextStyle(color: Colors.white);

TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);

final paddingDelapan = EdgeInsets.all(8);

final paddingEmpat = EdgeInsets.all(4);

final borderRadius4 = BorderRadius.circular(4);

final borderRadius8 = BorderRadius.circular(8);

Widget hSpace(double space) {
  return SizedBox(
    width: space,
  );
}

Widget vSpace(double space) {
  return SizedBox(
    height: space,
  );
}