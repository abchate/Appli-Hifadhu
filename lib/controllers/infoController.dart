import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:app_hifadhu/models/history.dart';
import 'package:app_hifadhu/models/numeroUrgence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fl_location/fl_location.dart';
import 'package:device_info_plus/device_info_plus.dart';

class infoController extends GetxController{

  var msg;
  bool? status;
   var loc;
    var long;
    var lat;
    var time;

    histories? _story;

    histories? get story => _story;
 Future getNumeroUrgence() async {

    final url = Uri.parse("https://comebillets.com/admin//getAppelUrgences");
    try{
       var response = await http.get(url);

    var data = jsonDecode(response.body);

     

    // this._story = histories.fromJson(data);

    // return _story;

    List<numeroUrgence> numero = [];

    for (var v in data) {

      numeroUrgence vo = numeroUrgence(
         
          name: v["name"],
          phone: v["phone"] ,
         

      );

      numero.add(vo);
      
      
    }
   return numero;
      } catch (e) {
    print("erreur: $e");
  }

   
}
    

 Future fetchStories() async {

    final url = Uri.parse("https://comebillets.com/admin//getReporting");
    try{
       var response = await http.get(url);

    var data = jsonDecode(response.body);

     

    // this._story = histories.fromJson(data);

    // return _story;

    List<histories> strory = [];

    for (var v in data) {

      histories vo = histories(
          id: int.parse( v["id"]),
          name: v["name"],
          type: v["type_aggression"] ,
          // img: v["img"] ,
          text: v["description"],
          vues:int.parse( v["vues"]),
          created: v["created"] ,

      );

      strory.add(vo);
      print(strory);
      
    }
   return strory;
      } catch (e) {
    print("erreur: $e");
  }

   
}

  

  //  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<bool> checkAndRequestPermission({bool? background}) async {
  if (!await FlLocation.isLocationServicesEnabled) {
    // Location services are disabled.
    return false;
  }
  

  var locationPermission = await FlLocation.checkLocationPermission();
  if (locationPermission == LocationPermission.deniedForever) {
    // Cannot request runtime permission because location permission is denied forever.
    return false;
  } else if (locationPermission == LocationPermission.denied) {
    // Ask the user for location permission.
    locationPermission = await FlLocation.requestLocationPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) return false;
  }

  // Location permission must always be allowed (LocationPermission.always)
  // to collect location data in the background.
  if (background == true &&
      locationPermission == LocationPermission.whileInUse) return false;

  // Location services has been enabled and permission have been granted.
  return true;
}

Future getLocation() async {
  if (await checkAndRequestPermission()) {
    final timeLimit = const Duration(seconds: 20);
    await FlLocation.getLocation(timeLimit: timeLimit).then((location) {
      print('location: ${location.toJson().toString()}');
       long= location.longitude;
       lat= location.latitude;
       time = location.timestamp;
    
      // Get.snackbar(
                  
      //             'ALERT!!!',
      //             "une alerte est envoyeé aux services d'urgence",
                  
      //            onTap: ((snack) {
                   
      //            }),
      //            colorText:Colors.white,
      //            backgroundColor: Colors.blue,
      //             duration: Duration(seconds: 5),
      //             animationDuration: Duration(milliseconds: 800),
      //             snackPosition: SnackPosition.TOP,
      //           );


      
            var _retData =  {
            'long': long,
            'lat': lat,
            'time': time
      };
       
       return _retData;
    }).onError((error, stackTrace) {
      throw '$error';
     
    });

   
  }
}
Future alert(Map sos) async{
  print("data $sos");
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//emergencyAlert"),
      
      body: sos,
    );

    if(response.statusCode == 200){
     var data = jsonDecode(response.body);
     var msg = data["msg"];
     
    
     print(msg);
      Get.snackbar(
                  
                  'Alerte aux urgences',
                  "$msg",
                  
                 onTap: ((snack) {
                   
                 }),
                 colorText:Colors.white,
                 backgroundColor: Colors.blue,
                  duration: Duration(seconds: 10),
                  animationDuration: Duration(milliseconds: 800),
                  snackPosition: SnackPosition.TOP,
                );


    

      var _retData =  {
            'msg': msg,
            'hasError': status,
           
      };
       print("return data $_retData");

       return _retData;

    }else{
      throw 'error';
    }
      

  } catch (e) {
    print("erreur $e");
  }

}


StreamSubscription<Location>? _locationSubscription;

Future<void> listenLocationStream() async {
  if (await checkAndRequestPermission()) {
    if (_locationSubscription != null) await _cancelLocationSubscription();

    _locationSubscription = FlLocation.getLocationStream()
        .handleError(_handleError)
        .listen((event) {
      print('location: ${event.toJson().toString()}');

    });
  }
}

Future<void> _cancelLocationSubscription() async {
  await _locationSubscription?.cancel();
  _locationSubscription = null;
}

void _handleError(dynamic error, StackTrace stackTrace) {
  print('error: ${error.toString()}');
}

StreamSubscription<LocationServicesStatus>? _locationServicesStatusSubscription;

Future<void> _listenLocationServicesStatusStream() async {
  if (_locationServicesStatusSubscription != null)
    await _cancelLocationServicesStatusSubscription();

  _locationServicesStatusSubscription =
      FlLocation.getLocationServicesStatusStream().listen((event) {
    print('location services status: $event');
  });
}

Future<void> _cancelLocationServicesStatusSubscription() async {
  await _locationServicesStatusSubscription?.cancel();
  _locationServicesStatusSubscription = null;
}
}