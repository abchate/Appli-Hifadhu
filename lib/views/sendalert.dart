import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/views/components/home/BuildGridMenu.dart';
import 'package:app_hifadhu/views/searchBlood.dart';
import 'package:app_hifadhu/views/sospage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../controllers/infoController.dart';
import '../customs/custom.dart';
import 'homescreen.dart';

class sendalert extends StatefulWidget {
  const sendalert({ Key? key }) : super(key: key);

  @override
  State<sendalert> createState() => _sendalertState();
}

class _sendalertState extends State<sendalert> {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? _deviceName;
  var _deviceNumber;

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
    readToken();
  }

   Future readToken() async{
    try {
      var Storage = new FlutterSecureStorage();
      String? token = await Storage.read(key: 'token');
      _deviceNumber = token;
     
      print("tokenn" + token!);
      return token;
      
    } catch (e) {
      print(e);
    }
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
      
  
      body: SingleChildScrollView(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 20),
                
                 padding: all(value: 5),
                 decoration: BoxDecoration(
                
                borderRadius: raduis(10)),
                child: Text("En appuyant sur un de ces boutons, une alerte sera envoyer aux services d'urgences", 
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20), textAlign: TextAlign.start,)
                ),
                SizedBox(height: 40,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Expanded(
                       flex: 1,
                       child: BounceInUp(
                         duration: milliseconds(),
                         delay: milliseconds(value: 300),
                         child: GestureDetector(
                                                           onTap: () {
                       Map sos = {
                       "longitude":controller.long.toString(),
                       "latitude" :controller.lat.toString(),
                       "phone": _deviceNumber,
                       "situation": 'violence',
                       "time":controller.time.toString()
        
                     };
                        
                        controller.alert(sos);

                        
                          
                       Get.to(()=> sosscreen(),
                       transition: Transition.downToUp, duration: milliseconds());
                     },
                           child: Container(
                             width: 150,
                             height: 120,
                             padding: all(value: 10),
                             margin: all(value: 10),
                             decoration: BoxDecoration(
                                 boxShadow: [shadow(red)],
                                 gradient: redGradient(),
                                //  color: red.withOpacity(0.2),
                                 borderRadius: raduis(10)),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Icon(Icons.dangerous, color: white, size: 40),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   "Violences",
                                   style: TextStyle(color: white, fontWeight: FontWeight.bold,fontSize: 20 ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                       Expanded(
                       flex: 1,
                       child: BounceInUp(
                         duration: milliseconds(),
                         delay: milliseconds(value: 300),
                         child: GestureDetector(
                                                           onTap: () {
                    //       Map sos = {
                    //    "longitude":controller.long.toString(),
                    //    "latitude" :controller.lat.toString(),
                    //    "phone": _deviceNumber,
                    //    "situation": 'recherche groupe sanguin'
        
                    //  };
                    //      controller.alert(sos);
                          
                       Get.to(()=> CRUDListView(),
                      transition: Transition.downToUp, duration: milliseconds());
                     },
                           child: Container(
                             width: 150,
                             height: 120,
                             padding: all(value: 10),
                             margin: all(value: 10),
                             decoration: BoxDecoration(
                                 boxShadow: [shadow(red)],
                                 gradient: redGradient(),
                                 borderRadius: raduis(10)),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Icon(Icons.bloodtype, color: white, size: 40),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   "Don de sang",
                                   style: TextStyle(color: white, fontWeight: FontWeight.bold,fontSize: 20 ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                     SizedBox(height: 20,),     

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                       flex: 1,
                       child: BounceInUp(
                         duration: milliseconds(),
                         delay: milliseconds(value: 300),
                         child: GestureDetector(
                                                           onTap: () {
                    //       Map sos = {
                    //    "longitude":controller.long.toString(),
                    //    "latitude" :controller.lat.toString(),
                    //    "phone": _deviceNumber,
                    //    "situation": 'alert aux feux'
        
                    //  };
                    //      controller.alert(sos);
                          
                    //    Get.to(()=> sosscreen(),
                    //    transition: Transition.downToUp, duration: milliseconds());
                     },
                           child: Container(
                             width: 150,
                             height: 120,
                             padding: all(value: 10),
                             margin: all(value: 10),
                             decoration: BoxDecoration(
                                 boxShadow: [lightshadow],
                                 color: red.withOpacity(0.2),
                                 borderRadius: raduis(10)),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Icon(Icons.fireplace, color: red.withOpacity(0.2), size: 40),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   "Alert aux feux",
                                   style: TextStyle(color: red.withOpacity(0.2), fontWeight: FontWeight.bold, ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
 Expanded(
                       flex: 1,
                       child: BounceInUp(
                         duration: milliseconds(),
                         delay: milliseconds(value: 300),
                         child: GestureDetector(
                                                           onTap: () {
                    //       Map sos = {
                    //    "longitude":controller.long.toString(),
                    //    "latitude" :controller.lat.toString(),
                    //    "phone": _deviceNumber,
                    //    "situation": 'accident de la route'
        
                    //  };
                    //      controller.alert(sos);
                          
                    //    Get.to(()=> sosscreen(),
                    //    transition: Transition.downToUp, duration: milliseconds());
                     },
                           child: Container(
                             width: 150,
                             height: 120,
                             padding: all(value: 10),
                             margin: all(value: 10),
                             decoration: BoxDecoration(
                                 boxShadow: [lightshadow],
                                 color: red.withOpacity(0.2),
                                 borderRadius: raduis(10)),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Icon(Icons.fireplace, color: red.withOpacity(0.2), size: 40),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   "Accident de la route",
                                   style: TextStyle(color: red.withOpacity(0.2), fontWeight: FontWeight.bold, ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                            ],
                          ),
                         
              
          
          ],
        ),
      ),
      
    );
  }
}