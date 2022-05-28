// ignore_for_file: non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/views/alerter.dart';
import 'package:app_hifadhu/views/sospage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sendalert.dart';

Widget HomeFab() {
  return BounceInUp(
    duration: milliseconds(),
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          gradient: redGradient(),
          borderRadius: raduis(50),
          boxShadow: [shadow(red)]),
      child: FloatingActionButton(
        backgroundColor: transparent,
        elevation: 0,
        onPressed: () {
          Get.to(() => sendalert());
        },
        isExtended: true,
        child: const Center(
            child: Text(
          "SOS",
          style: TextStyle(
              color: white, fontSize: 24, fontWeight: FontWeight.bold),
        )),
      ),
    ),
  );
}
