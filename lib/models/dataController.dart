import 'dart:convert';

import 'package:app_hifadhu/models/type_agression.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController{

  var msg;
  bool? status;

  bool visible = false;

  List typeList = [];

  List besoinList = [];

  

   Future<List>  getBesoins() async {

    final url = Uri.parse("https://comebillets.com/admin//getBesoins");

    var response = await http.get(url);

    var parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    print("aggression: $parsed");

     List<typeAgression> Listbesoin = parsed
      .map<typeAgression>((json) => typeAgression.fromJson(json))
      .toList();

      print("List aggression : $Listbesoin");

        

  for (int i = 0; i < Listbesoin.length; i++) {
    besoinList.add(Listbesoin[i].name!);
    
   
  }
  return  besoinList;
  
}
 
Future  getTypeViolences() async {

    final url = Uri.parse("https://comebillets.com/admin//getTypeViolences");

    var response = await http.get(url);

  

    
    var parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    print("aggression: $parsed");

   

     List<typeAgression> Listaggr = parsed
      .map<typeAgression>((json) => typeAgression.fromJson(json))
      .toList();

      print("List aggression : $Listaggr");

        

  for (int i = 0; i < Listaggr.length; i++) {
   typeList.add(Listaggr[i].name!);
   print(typeList);
    
   
  }
  return typeList;
  
  
}

Future <Map<String, dynamic>?> postVues(Map views) async{
  print("data $views");

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//sendViews"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: views,
    );
    if (response.statusCode == 200){
      visible = false;
      print("response data: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat $dat");
     
       msg = dat["msg"];
       status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       print("return data $_retData");

      return _retData;

    }else{
      throw 'il y a erreur';
    }

  } catch (e) {
    print("erreur: $e");
  }

}
  

  //  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();


Future <Map<String, dynamic>?> postForm(Map data) async{
  print("data $data");

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//createReportingAlert"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    if (response.statusCode == 200){
      visible = false;
      print("response data: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat $dat");
     
       msg = dat["msg"];
       status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       print("return data $_retData");

      return _retData;

    }else{
      throw 'il y a erreur';
    }

  } catch (e) {
    print("erreur: $e");
  }

}

}