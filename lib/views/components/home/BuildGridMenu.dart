// ignore_for_file: non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/views/aide.dart';
import 'package:app_hifadhu/views/components/makeCall.dart';
import 'package:app_hifadhu/views/conseil.dart';
import 'package:app_hifadhu/views/contactUrgence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BuildGridMenu() {
  return Container(
    width: width,
    margin: all(value: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contacter les urgences",
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            itemGrid(Icons.call, pink, "Appel d'urgence", () {
              // Fait une action
              sosCall(333);
            }),
            const SizedBox(
              width: 20,
            ),
            itemGrid(Icons.sms, pink, "Envoyer un sms", () {
              // Fait une action
              makeSMS('333');
            })
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Services d'accompagnement",
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            itemGrid(Icons.headset_mic_rounded, blue, "Demande de conseil", () {
              // fait une action
            Get.to(() => conseil(),
            transition: Transition.downToUp, duration: milliseconds());
    
            }),
            const SizedBox(
              width: 20,
            ),
            itemGrid(Icons.help_center, blue, "Lignes d'aide", () {
              // fait une action
               Get.to(() => Aide(),
            transition: Transition.downToUp, duration: milliseconds());
    
            })
          ],
        )
      ],
    ),
  );
}

Widget GridMenu(icon, color, text) {
  return Expanded(
    flex: 1,
    child: BounceInUp(
      duration: milliseconds(),
      delay: milliseconds(value: 300),
      child: Container(
        width: 150,
        height: 120,
        padding: all(value: 10),
        decoration: BoxDecoration(
            boxShadow: [shadow(color)],
            gradient: redGradient(),
            color: color,
            borderRadius: raduis(10)),
        child: Center(
          child: Column(
            children: [
              Icon(icon, color: white, size: 40),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(color:white, fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
Widget GridMen(icon, color, text) {
  return Expanded(
    flex: 1,
    child: BounceInUp(
      duration: milliseconds(),
      delay: milliseconds(value: 300),
      child: Container(
        width: 150,
        height: 120,
        padding: all(value: 10),
        decoration: BoxDecoration(
            boxShadow: [lightshadow],
            color: color.withOpacity(0.2),
            borderRadius: raduis(10)),
        child: Center(
          child: Column(
            children: [
              Icon(icon, color: red.withOpacity(0.2), size: 40),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(color: red.withOpacity(0.2), fontWeight: FontWeight.bold, ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget itemGrid(icon, color, text, callback) {
  return Expanded(
    flex: 1,
    child: GestureDetector(
      onTap: () {
        callback();
      },
      child: BounceInUp(
        duration: milliseconds(),
        delay: milliseconds(value: 300),
        child: Container(
          width: width,
          height: 100,
          padding: all(value: 10),
          decoration: BoxDecoration(
              boxShadow: [lightshadow],
              color: color.withOpacity(0.2),
              borderRadius: raduis(10)),
          child: Column(
            children: [
              Icon(icon, color: color, size: 40),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
