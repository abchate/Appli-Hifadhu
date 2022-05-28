import 'package:app_hifadhu/customs/colors.dart';
import 'package:flutter/material.dart';

LinearGradient redGradient() {
  return const LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [Colors.red, Color.fromARGB(255, 255, 0, 140)],
  );
}

LinearGradient blueGradient() {
  return const LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [Color.fromARGB(255, 31, 0, 205), Color.fromARGB(255, 0, 157, 255)],
  );
}

LinearGradient cyanGradient() {
  return const LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 37, 255, 237),
      Color.fromARGB(255, 158, 218, 255)
    ],
  );
}

LinearGradient pinkGradient() {
  return const LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 230, 99, 143),
      Color.fromARGB(255, 255, 0, 144)
    ],
  );
}

LinearGradient purpleGradient() {
  return const LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [Colors.purple, Color.fromARGB(255, 14, 0, 8)],
  );
}

LinearGradient containerGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black.withOpacity(0.5),
    ],
  );
}

var mapGradients = {
  "red": redGradient(),
  "blue": blueGradient(),
  "cyan": cyanGradient(),
  "pink": pinkGradient(),
  "purple": purpleGradient()
};

var mapColors = {
  "red": red,
  "blue": blue,
  "cyan": cyan,
  "pink": pink,
  "purple": purple
};
