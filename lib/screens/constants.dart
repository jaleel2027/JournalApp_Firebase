import 'package:flutter/material.dart';

const kScreenBg = BoxDecoration(
  gradient: LinearGradient(colors: [
    Color(0xff21D4FD),
    Color(0xfFB721FF),
  ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft ),);

const kButtonTxt =  TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.white
);

const kTxtField = BoxDecoration(
  color: Colors.black12,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);