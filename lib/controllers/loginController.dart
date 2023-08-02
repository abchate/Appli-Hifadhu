import 'dart:convert';

import 'package:app_hifadhu/models/loginInfo.dart';
import 'package:app_hifadhu/views/registrer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/phone_number.dart';

class loginController extends GetxController {

   List<loginInfo> info = [];
   final storage = new FlutterSecureStorage();
   final store = new GetStorage();
   
   bool isValid = true;
   String? numero;

  String? phones;
 
   Future  getnum () async{
     return await phones;
    
   }
 
   

  void addinfo(loginInfo infos){
    info.add(infos);
  }

    List<loginInfo> get loginfo {
      return List.from(info);
    }


   Future  getLoginInfo(Map data) async {

   
    try{
        http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//getMobileUsers"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );

    
    if (response.statusCode == 200){

      var dat = json.decode(response.body)
      // .cast<Map<String, dynamic>>()
      ;
    print("loginInfo: $dat");
   var phone = dat[0]["phoneNumber"].toString();
    var pseudonyme = dat[0]["pseudonyme"].toString();
     var blood = dat[0]["blood"].toString();
      var about = dat[0]["about"].toString();

    print("loginNumber: $phone ");
    this.phones = phone;
    
    print("loginNumber2: $phones "); 
     this.storeToken(token: phone);
     this.store.write("login", isValid);
     this.store.write('numero', phone);
     this.store.write('pseudonyme', pseudonyme);
     this.store.write('blood', blood);
     this.store.write('about', about);
     
     numero = store.read("numero");
     
    //  this.storage.write(key: 'phone', value: phone);

   List<loginInfo> infolog = [];

  

      loginInfo vo = loginInfo(
         
          id: int.parse( dat[0]["id"]),
          phoneNumber: dat[0]["phoneNumber"] ,
          created: dat[0]["created"]);

      infolog.add(vo);
      info = infolog;
      print("infologin: $vo");
  
     
    }
   
      } catch (e) {
    print("erreur: $e");
  }

   
}
 void storeToken({String? token}) async{

    this.storage.write(key: 'token', value: token);

  }

    Future logout() async {
      isValid = false;
     await store.write("login", isValid);
     await store.remove("numero");
     await store.remove('pseudonyme');
     await store.remove('blood');
     await store.remove('about',);
     await storage.delete(key: 'token');
    
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
       

      return _retData;

    // }else{
    //   throw 'il y a erreur';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}

Future <Map<String, dynamic>?> updatephoneUser(Map data) async{
  print("data $data");

 
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//updatePhoneUsers"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    // if (response.statusCode == 200){
     
      print("response update user: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat user $dat");
     
       var msg = dat["msg"];
      var  status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       

      return _retData;

    // }else{
    //   throw 'il y a erreur';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}

Future <Map<String, dynamic>?> updatePseudoUser(Map data) async{
  print("data $data");

 
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//updatePseudonymeUsers"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    // if (response.statusCode == 200){
     
      print("response update user: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat user $dat");
     
       var msg = dat["msg"];
      var  status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       

      return _retData;

    // }else{
    //   throw 'il y a erreur';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}

Future <Map<String, dynamic>?> registrerInfos(Map data) async{
  print("data $data");

 
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//registrerInfos"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    // if (response.statusCode == 200){
     
      print("response update user: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat user $dat");
     
       var msg = dat["msg"];
      var  status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       

      return _retData;

    // }else{
    //   throw 'il y a erreur';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}

Future <Map<String, dynamic>?> updatebloodUser(Map data) async{

  print("data $data");

 
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//updateBloodUsers"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    // if (response.statusCode == 200){
     
      print("response update user: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat user $dat");
     
       var msg = dat["msg"];
      var  status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       

      return _retData;

    // }else{
    //   throw 'il y a erreur';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}

Future <Map<String, dynamic>?> updateAboutUser(Map data) async{

  print("data $data");

 
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//updateAboutUsers"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    // if (response.statusCode == 200){
     
      print("response update user: ${response.body}");
       var dat = json.decode(response.body);
      
      print("les dat user $dat");
     
       var msg = dat["msg"];
      var  status = dat["status"];
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
       

      return _retData;

    // }else{
    //   throw 'il y a erreur';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}
}



