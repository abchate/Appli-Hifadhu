// ignore_for_file: non_constant_identifier_names

import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:flutter/material.dart';

AppBar HomeAppBAr() {
  return AppBar(
    leadingWidth: 150, 
    leading: Padding(
      padding: all(value: 5),
      child: Image.asset(
        MainImage,
        fit: BoxFit.contain,
        // color: Colors.white,
      ),
    ),
    actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle_sharp, size: 30, color: Color.fromARGB(255, 14, 24, 168),))],
    backgroundColor: blue,
    foregroundColor: white,
    elevation: 10,
  );
}
