import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/controllers/infoController.dart';
import 'package:app_hifadhu/customs/colors.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/views/homescreen.dart';
import 'package:app_hifadhu/views/sospage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fl_location/fl_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import 'components/mobilePhone.dart';

class alerter extends StatefulWidget {
  const alerter({ Key? key }) : super(key: key);

  @override
  State<alerter> createState() => _alerterState();
}

class _alerterState extends State<alerter> {
  
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? _deviceName;

    void getDeviceName() async{
    try {
      if(Platform.isAndroid){
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        _deviceName = androidInfo.model;
      }else if(Platform.isIOS){
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        _deviceName = iosInfo.utsname.machine;
      }
    } catch (e) {
      print(e);
    }

  }
    @override
  void initState() {
    
    super.initState();
    getDeviceName();
    controller.getLocation();
  }

  

  infoController controller = Get.put(infoController());
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
                child: IconButton(onPressed: (){
                  Get.off(() => Homepage(),
                  transition: Transition.upToDown, duration: milliseconds());
                  

            },
             icon: Icon(Icons.arrow_back,size: 30, color: Color.fromARGB(255, 13, 3, 156),)),
              ),
          ),
         title: Text("vous n'êtes pas seule!!!" ,style: TextStyle(color: blue ),),
         centerTitle: true,
      
      ),
      
  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 50),
                
                 padding: all(value: 5),
                 decoration: BoxDecoration(
                
                borderRadius: raduis(10)),
                child: Text("En appuyant sur ce bouton, une alerte sera envoyer aux services d'urgences", 
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20), textAlign: TextAlign.center,)
                ),
                Spacer(),
              
            GestureDetector(
              onTap: () {
        
                showDialog(context: context,
                 builder: (BuildContext context)=> SimpleDialog(
                   title: Text("Quelle est ta situation actuelle?"),
                   children: [
                     Column(
                       children: [
                          GestureDetector(
                            onTap: () {
                                 Map sos = {
                              "longitude":controller.long.toString(),
                              "latitude" :controller.lat.toString(),
                              "phone": _deviceName,
                              "situation": 'violence'
        
                            };
                                controller.alert(sos);
                      
                              Get.to(()=> sosscreen(),
                              transition: Transition.downToUp, duration: milliseconds());
                            },
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
                                "violence",
                                style: TextStyle(
                                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                                 Map sos = {
                              "longitude":controller.long.toString(),
                              "latitude" :controller.lat.toString(),
                              "phone": _deviceName,
                              "situation": 'alert aux feux'
        
                            };
                                controller.alert(sos);
                      
                              Get.to(()=> sosscreen(),
                              transition: Transition.downToUp, duration: milliseconds());
                            },
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
                                "Alert aux Feux",
                                style: TextStyle(
                                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                                 Map sos = {
                              "longitude":controller.long.toString(),
                              "latitude" :controller.lat.toString(),
                              "phone": _deviceName,
                              "situation": 'urgence médicale'
        
                            };
                                controller.alert(sos);
                      
                              Get.to(()=> sosscreen(),
                              transition: Transition.downToUp, duration: milliseconds());
                            },
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
                                "Urgence médicale",
                                style: TextStyle(
                                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                                 Map sos = {
                              "longitude":controller.long.toString(),
                              "latitude" :controller.lat.toString(),
                              "phone": _deviceName,
                              "situation": 'accident de la route'
        
                            };
                                controller.alert(sos);
                      
                              Get.to(()=> sosscreen(),
                              transition: Transition.downToUp, duration: milliseconds());
                            },
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
                                "Accident de la route",
                                style: TextStyle(
                                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
        
        
        
        
                       ],
                     )
        
                   ],
        
                 ) );
                
  
                 },
              child: Container(
                 width: 130,
                height: 130,
                child: Stack(
                  children: [
                   
                  Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                    child: Center(
                      child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    gradient: redGradient(),
                    borderRadius: raduis(65),
                    boxShadow: [shadow(red)]),
                child: const Center(
                      child: Text(
                    "Lancer une alerte",
                    style: TextStyle(
                        color: white, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                  )),
                
                  ),
                      ),
                
                 ) ] ),
              ),
            ),
            Spacer(),
             Container(
                margin: EdgeInsets.only(right: 20, left: 20, bottom: 100),
                
                 padding: all(value: 5),
                 decoration: BoxDecoration(
                
                borderRadius: raduis(10)),
                child: Text("Un message sera envoyer aux services d'urgences et vous serez localisé afin que les services viennent à ton secours", 
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 18), textAlign: TextAlign.center,)),
              
          ],
        ),
      ),
      
    );
  }
}