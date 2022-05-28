import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/views/aboutUs.dart';
import 'package:app_hifadhu/views/aide.dart';
import 'package:app_hifadhu/views/components/card.dart';
import 'package:app_hifadhu/views/components/gridservice.dart';
import 'package:app_hifadhu/views/conseil.dart';
import 'package:app_hifadhu/views/contactUrgence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class services extends StatefulWidget {
  const services({ Key? key }) : super(key: key);

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 38, 233),
        title: Text("Services à contacter", style: TextStyle(color: Color.fromARGB(255, 250, 251, 252)),),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: [
         
         FadeInLeft(child: grid( Icons.perm_contact_cal ,"Contact d'urgence", contactUrgence(), Color.fromARGB(255, 87, 60, 240))),
         FadeInRight(child: grid( Icons.live_help,"Lignes d'aide", Aide(),Color.fromARGB(255, 233, 87, 77))),
         FadeInLeft(child: grid( Icons.security,"Demande de conseil", conseil(), Colors.white)),
         FadeInRight(child: grid( Icons.info,"A propos de nous", AboutUs(), Color.fromARGB(255, 6, 182, 12))),
            


        ]
      
        )
      
      
    );
  }
}