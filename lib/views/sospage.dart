import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/controllers/infoController.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/views/homescreen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fl_location/fl_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
// import 'package:ripple_animation/ripple_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../customs/gradient.dart';
import '../customs/radius.dart';
import '../customs/shadow.dart';

class sosscreen extends StatefulWidget {
  const sosscreen({Key? key}) : super(key: key);

  @override
  State<sosscreen> createState() => _sosscreenState();
}

class _sosscreenState extends State<sosscreen> {
  infoController info = Get.put(infoController());
  SnackbarController alerter() {
    return Get.snackbar(
      'SOS',
      'Un alerte sera envoyer aux urgences et vous serez localiser pour étre secouru',
      onTap: ((snack) {}),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 4),
      animationDuration: Duration(milliseconds: 800),
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  openwhatsapp() async {
    var whatsapp = "+2693803210";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=je suis en danger";
    var whatappURL_ios =
        "https://wa.me/$whatsapp?text=${Uri.parse("je suis en danger")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp n'est pas installé")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp n'est pas installé")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 70,
        backgroundColor: red.withOpacity(0.1),
        leading:  Container(
          
            margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
          gradient: redGradient(),
          borderRadius: raduis(10),
          boxShadow: [shadow(red)]),
              child: Center(
                child: IconButton(
                  onPressed: (){
                 
              Get.off(() => Homepage(),
                  transition: Transition.upToDown, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_back,size: 30, color: Color.fromARGB(255, 13, 3, 156),)),
              ),
          ),
        // title: Text("Osez briser le silence !!!" ,style: TextStyle(color: blue ),),
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Pulse(
        duration: Duration(seconds: 1),
        delay: Duration(seconds: 5),
        child: Container(
          margin: EdgeInsets.all(10),
          height: 80,
          width: 80,
          child: FittedBox(
            child: new FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () {
                  openwhatsapp();
                },
                tooltip: 'sos',
                child: Icon(Icons.whatsapp),
                elevation: 10.0,
                backgroundColor: blue),
          ),
        ),
      ),
      body:Stack (children: [
         Positioned(
           top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
              child: RippleAnimation(
                repeat: true,
                color: Color.fromARGB(255, 153, 14, 14),
                minRadius: 100,
                ripplesCount: 50,
                child: GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          title: "Arrêt de l'alerte",
                          middleText: "Etes-vous sûre de vouloir arrêter l'alerte?",
                          textConfirm: "oui",
                          textCancel: "non",
                          onCancel: () {},
                          onConfirm: () {
                             showDialog(context: context,
                 builder: (BuildContext context)=> SimpleDialog(
                   title: Text("Informez vos protecteurs de la situation avant de quitter"),
                   children: [
                     GestureDetector(
                       onTap: (() {
                         Get.offAll(() => Homepage());
                       }),
                       child: Container(
                                width: width,
                                padding: all(value: 14),
                                margin: all(value: 10),
                                decoration: BoxDecoration(
                                    borderRadius: raduis(10),
                                    boxShadow: [shadow(red)],
                                    gradient: redGradient()),
                                child: const Center(
                                    child: Text(
                                  "Urgence",
                                  style: TextStyle(
                                      color: white, fontSize: 15, fontWeight: FontWeight.bold),
                                )),
                              ),
                     ),
                            GestureDetector(
                               onTap: (() {
                         Get.offAll(() => Homepage());
                       }),
                              child: Container(
                                width: width,
                                padding: all(value: 14),
                                margin: all(value: 10),
                                decoration: BoxDecoration(
                                    borderRadius: raduis(10),
                                    boxShadow: [shadow(red)],
                                    gradient: redGradient()),
                                child: const Center(
                                    child: Text(
                                  "Protection",
                                  style: TextStyle(
                                      color: white, fontSize: 15, fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            GestureDetector(
                               onTap: (() {
                         Get.offAll(() => Homepage());
                       }), 
                              child: Container(
                                width: width,
                                padding: all(value: 14),
                                margin: all(value: 10),
                                decoration: BoxDecoration(
                                    borderRadius: raduis(10),
                                    boxShadow: [shadow(red)],
                                    gradient: redGradient()),
                                child: const Center(
                                    child: Text(
                                  "Erreur",
                                  style: TextStyle(
                                      color: white, fontSize: 15, fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),

                   ],
                   )
                   );
                            
                          });
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/stop2.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(45),
                          boxShadow: [
                            BoxShadow(blurRadius: 10.0, color: Colors.black)
                          ]),
                    )),
              ),
              ),
      ),
      ],)
    );
  }
}
