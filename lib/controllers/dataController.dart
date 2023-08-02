import 'dart:convert';

import 'package:app_hifadhu/models/UsersInfos.dart';
import 'package:app_hifadhu/models/commentaires.dart';
import 'package:app_hifadhu/models/type_agression.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/Mes_publication.dart';
import '../models/contactUrgence.dart';
import '../models/emergencyAlert.dart';


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

     List<typeAgression> Listbesoin = parsed
      .map<typeAgression>((json) => typeAgression.fromJson(json))
      .toList();

    for (int i = 0; i < Listbesoin.length; i++) {
      besoinList.add(Listbesoin[i].name!);
    }
    return  besoinList;
  }

 
  Future  getTypeViolences() async {

    final url = Uri.parse("https://comebillets.com/admin//getTypeViolences");

    var response = await http.get(url);
   
    var parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    
     List<typeAgression> Listaggr = parsed
      .map<typeAgression>((json) => typeAgression.fromJson(json))
      .toList();

    for (int i = 0; i < Listaggr.length; i++) {
    typeList.add(Listaggr[i].name!);
    }
    return typeList;  
  }

  Future <Map<String, dynamic>?> situationAlert(Map data) async{
  print("data $data");

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//situationAlert"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
   // if (response.statusCode == 200){
      visible = false;
      print("response data: ${response.body}");
       var dat = json.decode(response.body);
     
       msg = dat["msg"];
       print(" situation alert $msg");
       status = dat["status"];

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

    // }else{
    //   throw 'il y a erreur sur le situation';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}
  Future <Map<String, dynamic>?> audioAlert(Map data) async{
  print("data $data");

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//audioAlert"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
   // if (response.statusCode == 200){
      visible = false;
      print("response data: ${response.body}");
       var dat = json.decode(response.body);
     
       msg = dat["msg"];
       print(" audio alert $msg");
       status = dat["status"];

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

    // }else{
    //   throw 'il y a erreur sur le situation';
    // }

  } catch (e) {
    print("erreur: $e");
  }

}
Future <Map<String, dynamic>?> postContactUrgent(Map data) async{
  print("data $data");

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//addUrgenceContact"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
     if (response.statusCode == 200){
      visible = false;
      // print("response data: ${response.body}");
       var dat = json.decode(response.body);
     
       msg = dat["msg"];
       status = dat["status"];
     

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

    }else{
      throw 'il y a erreur sur le addcontact';
    }

  } catch (e) {
    print("erreur: $e");
  }

}

Future  deleteUrgenceContact(Map data) async{
 

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//deleteUrgenceContact"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
     
      visible = false;
      // print("response data: ${response.body}");
       var dat = json.decode(response.body);
       print("delete data $dat");
     
       msg = dat["msg"];
       status = dat["status"];
     

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

   

  } catch (e) {
    print("erreur: $e");
  }
}

Future  getContactUrgent() async{
    var Storage = new FlutterSecureStorage();
      String? token = await Storage.read(key: 'token');
     
       Map data = {
          'addby': token.toString()
        };
  

  
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//getUrgenceContact"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    
     
       var dat = json.decode(response.body);
       
    List<contactModel> numero = [];

    for (var v in dat) {

      contactModel vo = contactModel(
         
          name: v["name"],
          phone: v["phone"] ,
          date: v["created"]
         

      );
     

      numero.add(vo);
      

    }
      var _retData =  {
            'data': dat,
            
      };  
      return numero;

   
  } catch (e) {
    print("erreur: $e");
  }

}

Future  getEmergencyAlert() async{
    var Storage = new FlutterSecureStorage();
      String? token = await Storage.read(key: 'token');
     
       Map data = {
          'phone': token.toString()
        };
  print("datacontact $data");

  
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//getEmergencyAlert"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    
     
       var dat = json.decode(response.body);
       
       print("data emergency $dat");

      // var _Data = dat["u"];
     
      //  print("msg contact urgence $_Data");
    List<emergencyModel> alert = [];

    for (var v in dat) {

      emergencyModel vo = emergencyModel(
         
          category: v["category"],
          situation: v["situation"] ,
          date: v["created"]
         

      );
     

      alert.add(vo);
      print("emergency alerte $alert");

    }
        
      return alert;

   
  } catch (e) {
    print("erreur: $e");
  }

}

Future  getMespublications() async{
    var Storage = new FlutterSecureStorage();
      String? token = await Storage.read(key: 'token');
     
       Map data = {
          'addby': token.toString()
        };
  

  
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//getMyReporting"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    
     
       var dat = json.decode(response.body);
       
       print("data my story $dat");
      // var _Data = dat["u"];
     
      //  print("msg contact urgence $_Data");
    List<publicationModel> pub = [];

    for (var v in dat) {

      publicationModel vo = publicationModel(
          id: int.parse( v["id"]),
          name: v["name"],
          type: v["type_aggression"] ,
           likes:int.parse( v["likes"]),
          text: v["description"],
          vues:int.parse( v["vues"]),
          created: v["created"] ,
         

      );
     

      pub.add(vo);
     

    }
        
      return pub;

   
  } catch (e) {
    print("erreur: $e");
  }

}


Future <Map<String, dynamic>?> postVues(Map views) async{
  

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
      // print("response data: ${response.body}");
       var dat = json.decode(response.body);
     
       msg = dat["msg"];
       status = dat["status"];

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

    }else{
      throw 'il y a erreur sur le vue';
    }

  } catch (e) {
    print("erreur: $e");
  }

}
Future <Map<String, dynamic>?> postLikes(Map likes) async{
  

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//setLikes"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: likes,
    );
    if (response.statusCode == 200){
      visible = false;
      print("response data: ${response.body}");
       var dat = json.decode(response.body);
     
       msg = dat["msg"];
       print("likes $msg");
       status = dat["status"];

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

    }else{
      throw 'il y a erreur sur le likes';
    }

  } catch (e) {
    print("erreur: $e");
  }

}

 Future <Map<String, dynamic>?> postComment(Map likes) async{
  

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//comment"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: likes,
    );
   
      visible = false;
      print("response data: ${response.body}");
       var dat = json.decode(response.body);
     
       msg = dat["msg"];
       print("Comment $msg");
       status = dat["status"];

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

  
  } catch (e) {
    print("erreur: $e");
  }

}
   
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
    // if (response.statusCode == 200){
    //   visible = false;
     
       var dat = json.decode(response.body);
      
      print("les dat $dat");
     
       msg = dat["msg"];
       status = dat["status"];
       var lastId = dat["lastId"];
      
       print("le dernier id $lastId");
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
Future <Map<String, dynamic>?> editForm(Map data) async{
  print("data $data");

  visible = true;
  try {
    http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//editReportingAlert"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    if (response.statusCode == 200){
      visible = false;
     
       var dat = json.decode(response.body);
      
      print("les dat $dat");
     
       msg = dat["msg"];
       status = dat["status"];
       var lastId = dat["lastId"];
      
       print("le dernier id $lastId");
       print("message: $msg");

          var _retData =  {
            'msg': msg,
            'hasError': status,
      };
      return _retData;

    }else{
      throw 'il y a erreur';
    }

  } catch (e) {
    print("erreur: $e");
  }

}

List<UsersInfos> get infos{
    return infos;
  }

  Future  getComment(String story_id) async{
    Map data = {
      "story_id": story_id
    };
    
  try {
     http.Response response = await http.post(
       Uri.parse("https://comebillets.com/admin//getComment"),
      headers:{ 
    'Accept': 'application/json',
    'Charset':'utf-8'
    },
      body: data,
    );
    
    
     
       var dat = json.decode(response.body);
       
       print("data my comments $dat");
      // var _Data = dat["u"];
     
      //  print("msg contact urgence $_Data");
    List<commentaires> comment = [];

    for (var v in dat) {

      commentaires vo = commentaires(
          comment: v["comment"],
          comment_by: v["comment_by"] ,
          story_id: v["story_id"],
         

      );
     

      comment.add(vo);
     

    }
        
      return comment;

   
  } catch (e) {
    print("erreur: $e");
  }

}
 
Future  getUsersInfos() async{
    
  try {
    final url = Uri.parse("https://comebillets.com/admin//getUsersInfos");

    var response = await http.get(url);
    
     
       var dat = json.decode(response.body);
       
       print("data my userinfos $dat");
      // var _Data = dat["u"];
     
      //  print("msg contact urgence $_Data");
    List<UsersInfos> infos = [];

    for (var v in dat) {

      UsersInfos vo = UsersInfos(
          name: v["pseudonyme"],
          phone: v["phoneNumber"] ,
          blood: v["blood"],
         

      );
     

      infos.add(vo);
     

    }
        
      return infos;

   
  } catch (e) {
    print("erreur: $e");
  }

}
}