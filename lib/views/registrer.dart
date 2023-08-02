import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/views/introductionscreen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/dataController.dart';
import '../controllers/infoController.dart';
import '../controllers/loginController.dart';
import '../customs/button.dart';
import '../customs/dialogues.dart';

class registrer extends StatefulWidget {
  const registrer({ Key? key }) : super(key: key);

  @override
  State<registrer> createState() => _registrerState();
}

class _registrerState extends State<registrer> {
  
infoController controller = Get.put(infoController());
  Controller control = Get.put(Controller());
   loginController infos = Get.put(loginController());
    final _formKey = GlobalKey<FormState>();

        TextEditingController nomController = new TextEditingController();
    TextEditingController numController = new TextEditingController();
     TextEditingController descriptionController = new TextEditingController();

      var _nom;
  var _numero;
   final Store = new FlutterSecureStorage();
  var addby;

    void clear (){
      nomController.text = "";
      numController.text = "";
    }
      @override
  void initState() {
    
    super.initState();
    Loginfo();
  }
   var Storage = new FlutterSecureStorage();
  var store = GetStorage();
  Map? info;
   Future Loginfo() async{
    try {
      var Storage = new FlutterSecureStorage();
      var store = GetStorage();
      String? token = await Storage.read(key: 'token');
      String? pseudonyme = store.read('pseudonyme',);
      String? blood = store.read('blood');
      String? about = store.read('about',);

       info = {
        "phone": token.toString(),
        "pseudonyme": pseudonyme.toString(),
        "blood": blood.toString(),
        "about": about.toString()

      };
   
    
      return info;
      
    } catch (e) {
      print(e);
    }
  }
  final List<String> Items = [
  "A",
  "A+",
  'A-',
  "B",
  "B+",
  "B-",
  "AB",
  "AB+",
  'AB-',
  "0",
  "0+",
  "0-",
  "je ne sais pas"
 ];

String? selected;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pink,
          elevation: 0,
          title: Text("Inscription"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children:[
             Container(

               height: 50,
              margin: EdgeInsets.only(right: 20, left: 20, top: 10),
              
               padding: all(value: 5),
               decoration: BoxDecoration(
              
              borderRadius: raduis(10)),
              child: Text("FINALISEZ L'INSCRIPTION", 
              style: TextStyle(color: blue, fontWeight: FontWeight.w900), textAlign: TextAlign.center,)
              ),
              Form(
                  key: _formKey, 
                child: Column(
                  children: [
                     Container(

            
              margin: EdgeInsets.only(right: 20, left: 20,),
              
               padding: all(value: 5),
               decoration: BoxDecoration(
              
              borderRadius: raduis(10)),
              child: Text("Saisissez votre nom ou un pseudonyme", 
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.start,)
              ),
              Container(
               margin: EdgeInsets.only(right: 10,left: 10),
                child: TextFormField(
                  
                  controller:  nomController ,
                  decoration: InputDecoration(
                      labelText: "pseudonyme/nom et prénom",
                      hintText: "Entrez un pseudonyme ou votre nom et prénom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2
                          )
                          
                          )
                          ),
                          
      
                          onSaved: (String? nom){                        
                                _nom = nom!.trim();
                          },
                          validator: (String? nom) =>
                         nom!.isEmpty ? 'vous devez saisir votre nom/pseudonyme' : null,
                ),
              ),

               Container(

            
              margin: EdgeInsets.only(right: 20, left: 20,top: 10),
              
               padding: all(value: 5),
               decoration: BoxDecoration(
              
              borderRadius: raduis(10)),
              child: Text("En donnant votre groupe sanguin, vous serez utile à la communauté.Vous pouvez être contacté en cas d'urgence pour un don de sang", 
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.start,)
              ),
                 Container(
                               height: 50,
                              
                   margin: EdgeInsets.only(right: 10,left: 10),             
                child: DropdownButtonFormField2( 
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
               enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1
                          )
                          ),
    
            ),
            isExpanded: true,
            hint: const Text(
              "Groupe sanguin *",
              style: TextStyle(fontSize: 14, ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
             items: Items.map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            ); 
          }).toList(),
            validator: (value) {
              if (value == null) {
                return "veuillez selectionnez votre groupe sanguin";
              }
            },
            onChanged: (value) {
              selected = value!.toString();
            },
            onSaved: (value) {
              selected = value.toString();
            },
          )
      
                            ),
              
                           ],
                         )
                         ),
                      
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                    
                     GestureDetector(
                                onTap: () {
                                  Map data = {
                                  "pseudonyme": nomController.text,
                                  "blood": this.selected,
                                  "phoneNumber":info!["phone"].toString() ,
                                 
    
                                };
                                    
                  if(_formKey.currentState!.validate()){
                 _formKey.currentState!.save();
                
                 infos.registrerInfos(data).then((response) {
                  if(response!["hasError"]){
                   
                 
                   infos.getLoginInfo(data); 
                   nomController.text = "";
                    
                    
                    showSuccesDialog(
                      response['msg'],
                       context, 
                      () => {
                        Get.to(()=> IntroPage())
                       
                       });
                         
                  
                     
                       
                                        
                 }else {
                     
                   showErrorDialog(
                     response["msg"], 
                     context,
                      () => {});
              }
                 });
                
                  }
                                },
                                    child:  Container(
                                      height: 50,
                                      width: 150,
                                      margin: all(value: 10),
                                      decoration: BoxDecoration(
                                          color: red,
                                          gradient: redGradient(),
                                          boxShadow: [shadow(red)],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text("Finalisez",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold)))
                                                      )
                                                      ),
                  ],
                ),
    
                     
          
          
          ]  )
            
          )
          
        
    
      
      
        
      ),
    );
  }
}