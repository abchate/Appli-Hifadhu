import 'package:flutter/material.dart';

double width = double.infinity;

/// FOR PADDING AND MARGIN
/// Return EdgeInsets.all(double value)
EdgeInsets all({double value = 0}) => EdgeInsets.all(value);

/// Return EdgeInsets.only(left : double value)
EdgeInsets left(double value) => EdgeInsets.only(left: value);
EdgeInsets right(double value) => EdgeInsets.only(right: value);
EdgeInsets top(double value) => EdgeInsets.only(top: value);
EdgeInsets bottom(double value) => EdgeInsets.only(bottom: value);

EdgeInsets allH(double value) => EdgeInsets.symmetric(horizontal: value);
EdgeInsets allV(double value) => EdgeInsets.symmetric(vertical: value);
EdgeInsets symetric({double v = 0, double h = 0}) =>
    EdgeInsets.symmetric(horizontal: h, vertical: v);

/// PHYSIQUE ELEMENTS
BouncingScrollPhysics bounce = const BouncingScrollPhysics();
