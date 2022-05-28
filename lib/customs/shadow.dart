import 'package:flutter/material.dart';

BoxShadow lightshadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: const Offset(0, 10),
    spreadRadius: 0.5,
    blurRadius: 10);

BoxShadow shadow(color) {
  return BoxShadow(
      color: color.withOpacity(0.5),
      offset: const Offset(0, 4),
      spreadRadius: 0,
      blurRadius: 8);
}
