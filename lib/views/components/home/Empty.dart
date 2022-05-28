// ignore_for_file: non_constant_identifier_names, file_names

import 'package:app_hifadhu/customs/custom.dart';
import 'package:flutter/cupertino.dart';

Widget Empty() {
  return Container(
    width: width,
    height: 200,
    decoration: BoxDecoration(
        gradient: blueGradient(),
        borderRadius: raduis(10),
        boxShadow: [shadow(blue)]),
    child: const Center(
        child: Text("Les informations publiées seront afficher ici")),
  );
}
