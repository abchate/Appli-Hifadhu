// ignore_for_file: non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/views/temoinForm.dart';
import 'package:app_hifadhu/views/victimForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BuildButtonAction() {
  return Row(children: [
    Expanded(
        child: GestureDetector(
      onTap: () {
        Get.to(() => victimForm(),
            transition: Transition.downToUp, duration: milliseconds());
      },
      child: BounceInLeft(
        duration: milliseconds(),
        child: Container(
          width: width,
          padding: all(value: 14),
          margin: left(10),
          decoration: BoxDecoration(
              borderRadius: raduis(50),
              boxShadow: [shadow(red)],
              gradient: redGradient()),
          child: const Center(
              child: Text(
            "Je suis une victime",
            style: TextStyle(
                color: white, fontSize: 15, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    )),
    const SizedBox(
      width: 20,
    ),
    Expanded(
        child: GestureDetector(
      onTap: () {
        Get.to(() => temoinForm(),
            transition: Transition.downToUp, duration: milliseconds());
      },
      child: BounceInRight(
        duration: milliseconds(),
        child: Container(
          width: width,
          padding: EdgeInsets.only(top:14, bottom:14),
          margin: right(10),
          decoration: BoxDecoration(
            color: red,
              borderRadius: raduis(50),
              boxShadow: [shadow(red)],
              gradient: blueGradient()),
          child:  const Center(
              child: Text(
            "Je connais une victime",
            style: TextStyle(
                color: white, fontSize: 14, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    )),
  ]);
}
