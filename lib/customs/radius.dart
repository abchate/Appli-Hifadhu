import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BorderRadius raduis(double n) {
  return BorderRadius.circular(n);
}

BorderRadius radOnlyTop(double n) {
  return BorderRadius.only(
      topLeft: Radius.circular(n), topRight: Radius.circular(n));
}

BorderRadius radOnlyBottom(double n) {
  return BorderRadius.only(
      bottomLeft: Radius.circular(n), bottomRight: Radius.circular(n));
}
