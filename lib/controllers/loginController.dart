import 'dart:convert';

import 'package:app_hifadhu/models/loginInfo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class loginController extends GetxController {


   Future <Map<String, dynamic>?> getLoginInfo(Map data) async {

    // final url = Uri.parse("https://comebillets.com/admin//getMobileUsers");
    try{
        http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//getMobileUsers"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );

      var parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    print("loginInfo: $parsed");

   

     List<loginInfo> info = parsed
      .map<loginInfo>((json) => loginInfo.fromJson(json))
      .toList();

     



    // List<loginInfo> info = [];

    // for (var v in parsed) {

    //   loginInfo vo = loginInfo(
         
    //       id: v["id"],
    //       phoneNumber: v["phoneNumber"] ,
    //       created: v["created"]
         

    //   );

    //   info.add(vo);
    //   print("infologin: $vo");
      
      
    
   
   
      } catch (e) {
    print("erreur: $e");
  }

   
}

  
Future <Map<String, dynamic>?> postlogin(Map data) async{
  print("data $data");

 
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//addMobileUsers"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    // if (response.statusCode == 200){
     
      print("response data: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat $dat");
     
       var msg = dat["msg"];
      var  status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       print("return data $_retData");

      return _retData;

    // }else{
    //   throw 'il y a erreur';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}

}