// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/controllers/SlideInfosController.dart';
import 'package:app_hifadhu/controllers/infoController.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/views/components/home/BuildGridMenu.dart';
import 'package:app_hifadhu/views/components/home/BuildSliderInfo.dart';
import 'package:app_hifadhu/views/components/home/Empty.dart';
import 'package:app_hifadhu/views/components/home/HomeSlideItem.dart';
import 'package:app_hifadhu/views/components/home/Loading.dart';
import 'package:app_hifadhu/views/components/home/build_btn_action.dart';
import 'package:app_hifadhu/views/formulaire.dart';
import 'package:app_hifadhu/views/services.dart';
import 'package:app_hifadhu/views/temoinForm.dart';
import 'package:app_hifadhu/views/victimForm.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  infoController controller = Get.put(infoController());
  final List<String> images = [
    AppIcon,
    ImageOne,
    ImageTwo,
    ImageTree,
  ];
  var data;
   

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
 
      backgroundColor: white,
      body: SingleChildScrollView(
        physics: bounce,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
          "Tous contre la violence !!!",
          style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        //  Text(
        //   "lire plus",
        //   style:
        //             TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: red),
        // ),
                 ],
               ),
             ),
            FutureBuilder(
                future: controller.fetchStories(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return chargement();
                     }if (snapshot.hasError) {
                          return Center(child: Text('Something went wrong '));
                  } else {
                    data = snapshot.data;
                     if (data == "null") {
                      return Empty();
                      } else {
                      return BuildSlideInfo(data);
                    }
                  }
                }),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            BuildButtonAction(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            BuildGridMenu(),
            Container(

              height: 50,
              width: width,
              margin:all(value: 20),
               decoration: BoxDecoration(
              boxShadow: [lightshadow],
              color: white,
              borderRadius: raduis(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,    
                children: [
                  Image.asset(Lab),
                  Image.asset(ImageHif),
                  Image.asset(Imara),
                  Image.asset(Telma)
                ],

              )
            )


          ],
        ),
      ),
    );
  }
}
