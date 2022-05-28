import 'package:app_hifadhu/customs/colors.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageContainer(String image) {
  return Container(
    width: width,
    margin: symetric(h: 10),
    decoration: BoxDecoration(
      color: red,
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
    ),
  );
}
