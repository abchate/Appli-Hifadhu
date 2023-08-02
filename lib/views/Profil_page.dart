// ignore_for_file: file_names

import 'dart:io';

import 'package:app_hifadhu/controllers/loginController.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/views/components/profil/Mes_publications.dart';
import 'package:app_hifadhu/views/components/profil/editProfil.dart';
import 'package:app_hifadhu/views/components/profil/historique_alert.dart';
import 'package:app_hifadhu/views/homescreen.dart';
import 'package:app_hifadhu/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

import '../customs/button.dart';
import '../customs/custom.dart';
import '../customs/durations.dart';
import '../customs/gradient.dart';
import '../customs/show_dailog.dart';
import 'components/custom_list_tile.dart';
import 'components/profil/contact.dart';
import 'components/small_button.dart';


class ProfilPage extends StatefulWidget {
  const ProfilPage({ Key? key }) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

final _formKey = GlobalKey<FormState>();

   TextEditingController nomController = new TextEditingController();
    TextEditingController numController = new TextEditingController();
    loginController log = Get.put(loginController());

    void clear (){
      nomController.text = "";
      numController.text = "";
    }
  var _nom;
  var _numero;
  
  File? _imageFile;
  // final _picker = ImagePicker();
 bool turnOnNotification = false;
  bool turnOnLocation = true;
  // Future<void> _pickImageFromGallery() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if(pickedFile != null){
  //     setState(() {
  //       this._imageFile = File(pickedFile.path);
  //     });

  //   }
  // }
  // Future<void> _pickImageFromCamera() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if(pickedFile != null){
  //     setState(() {
  //       this._imageFile = File(pickedFile.path);
  //     });

  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

   Future Loginfo() async{
    try {
      var Storage = new FlutterSecureStorage();
      var store = GetStorage();
      String? token = await Storage.read(key: 'token');
      String? pseudonyme = store.read('pseudonyme',);
      String? blood = store.read('blood');
      String? about = store.read('about',);

      Map info = {
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
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
         appBar: AppBar(
          elevation: 2,
           leadingWidth: 70,
           backgroundColor: white,
          leading:  Container(
            
              margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
            gradient: blueGradient(),
            borderRadius: raduis(10),
            boxShadow: [shadow(blue)]),
                child: Center(
                  child: IconButton(onPressed: (){
                    Get.off(() => Homepage(),
                    transition: Transition.upToDown, duration: milliseconds());
    
              },
               icon: Icon(Icons.arrow_back,size: 30, color: white,)),
                ),
            ),
           title: Text("Profile", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: blue),),
           //centerTitle: true,
        ),
        
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10,right: 10, ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Text("Profile", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                 Container(
                   margin: EdgeInsets.only(right: 30, left: 10, top: 10),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                    Container(
                       height: 50,
                       width: 50,
                         
                       child:  ClipOval(
                          
                        child: _imageFile != null
                        ? Image.file(
                          _imageFile!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ):  ClipOval(
                          
                        child: Container(
                            width: 80,
                            height: 80,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppIcon,
                            )),
                      ),
                ),
         
                     ),
                      SizedBox(width: 10,),
                      Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                             
                         children: [
                          FutureBuilder(
                                future: Loginfo(),
                                builder: (context, snapshot){
                                  if(!snapshot.hasData){
                                   
                                    return CircularProgressIndicator();
                                  }else {
                                   
                                    var info = snapshot.data as Map;

                                    return Text(info["pseudonyme"].toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);

                                  }
                                },),
                            //SizedBox(height: 10,),
                             FutureBuilder(
                                future: Loginfo(),
                                builder: (context, snapshot){
                                  if(!snapshot.hasData){
                                   
                                    return CircularProgressIndicator();
                                  }else {
                                   
                                    var info = snapshot.data as Map;

                                    return Text(info["phone"].toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),);

                                  }
                                },),
                           
                        
                           
                         ],
                       ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                               Get.to(() => editProfil(),
                             transition: Transition.leftToRight, duration: milliseconds());
                            },
                            child:
                             SmallButton(btnText: "  modifier ",))
                     ],
                   ),
                 ),
                 SizedBox(height: 20,),
                 const Text("Compte", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                 SizedBox(height: 20,),
                 Card(
                   elevation: 5,
                   child: Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20),
                     child: Column(
                       
                       children:  [
                        GestureDetector(
                          onTap: () {
                                Get.to(() => contact(),
                           transition: Transition.leftToRight, duration: milliseconds());
                          },
                          child: CustomListtile(
                            icon: Icons.contacts,
                            text: "Mes contactes de confiance",
                          ),
                        ),
                          Divider(height: 30, color: Colors.grey,),
                          GestureDetector(
                             onTap: () {
                                Get.to(() => Mes_publication(),
                           transition: Transition.leftToRight, duration: milliseconds());
                          },
                            child: CustomListtile(
                            icon: Icons.publish,
                            text: "Mes publications",
                                                  ),
                          ),
                         Divider(height: 30, color: Colors.grey,),
                           GestureDetector(
                             onTap: () {
                                Get.to(() => historiqueAlert(),
                           transition: Transition.leftToRight, duration: milliseconds());
                             },
                             child: CustomListtile(
                                                     icon: Icons.history,
                                                     text: "historique des alertes",
                                                   ),
                           ),
                         Divider(height: 30, color: Colors.grey,),
                         CustomListtile(
                                icon: Icons.info,
                                text: "A propos",
                              ),

                           Divider(height: 30, color: Colors.grey,),
                              GestureDetector(
                                onTap: (() {
                                  log.logout().then((value){
                                     showLoadingIndicator(context, "Dé connexion en cours...");
                                    Get.offAll(LoginPage());
                                  }
                                  
                                  );

                                }),
                                child: CustomListtile(
                                  icon: Icons.logout,
                                  text: "Déconnexion",
                                ),
                              ),
            //                GestureDetector(
            //                  onTap: (() {
            //                     showDialog(context: context,
            //      builder: (BuildContext context)=> SimpleDialog(
            //        title: Text("Modifier le numero"),
            //        children: [
            //          Form(
            //             key: _formKey,
            //            child: Column(
            //              children: [
                           
            //            Container(
            //     margin: EdgeInsets.all(10),
            //     child: TextFormField(
            //    controller: numController,
            //      decoration: InputDecoration( 
            //           labelText: "Entrer votre numero du compte",
            //           hintText: "Entrez un numero de téléphone",
            //               prefixText: "+269",                  
            //           border: OutlineInputBorder( 
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: const BorderSide(color: Colors.black, width: 3)
            //               )
            //               ),
            //               maxLength:7,
            //               keyboardType: TextInputType.phone,
            //               onSaved: (String? numero){
            //                     _numero = numero!.trim();
            //                 },
                          
            //               validator: ( numero) =>
            //               numero!.isEmpty ? 'vous devez saisir le numero du compte' : null,
            //     ),
            //   ),
            //     Container(
            //     margin: EdgeInsets.all(10),
            //     child: TextFormField(
            //    controller: numController,
            //      decoration: InputDecoration( 
            //           labelText: "Entrer le nouveau numero",
            //           hintText: "Entrez un numero de téléphone",
            //               prefixText: "+269",                  
            //           border: OutlineInputBorder( 
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: const BorderSide(color: Colors.black, width: 3)
            //               )
            //               ),
            //               maxLength:7,
            //               keyboardType: TextInputType.phone,
            //               onSaved: (String? numero){
            //                     _numero = numero!.trim();
            //                 },
                          
            //               validator: ( numero) =>
            //               numero!.isEmpty ? 'vous devez saisir le numero du compte' : null,
            //     ),
            //   ),
            //              ],
            //            )
            //            ),
                    
            //    Row(
            //      mainAxisAlignment: MainAxisAlignment.end,
            //      crossAxisAlignment: CrossAxisAlignment.end,
            //      children: [
            //        GestureDetector(
            //          onTap: () {
            //           Get.back(); 
            //          },
            //          child: button("annulé", red, redGradient())),
            //        GestureDetector(
            // //                   onTap: () {
            // //                     Map data = {
            // //                     "name": nomController.text,
            // //                     "phone": "+269"+ numController.text,
            // //                     "addby":addby.toString() ,

            // //                   };
                                  
            // //     if(_formKey.currentState!.validate()){
            // //    _formKey.currentState!.save();
            // //    //showLoadingIndicator(context, "Enregistrement en cours...");
            // //    control.postContactUrgent(data).then((response) {
            // //     if(response!["hasError"]){
              
            // //     clear();
            // //       showSuccesDialog(
            // //         response['msg'],
            // //          context, 
            // //          () => {});
                      
                                      
            // //    }else {
                   
            // //      showErrorDialog(
            // //        response["msg"], 
            // //        context,
            // //         () => {});
            // // }
            // //    });
              
            // //     }
            // //                   },
            //                       child: button("modifier", blue, blueGradient())),
            //      ],
            //    )

            //        ],
            //                      ) );
            //                  }),
            //                  child: CustomListtile(
            //                                          icon: Icons.phone,
            //                                          text: "Changer de numero",
            //                                        ),
            //                ),

                        Divider(height: 30, color: Colors.grey,),
                       ],
                     ),
                     ),
                 ),
                //   SizedBox(height: 20,),
                //  const Text("Notifications", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                //  SizedBox(height: 20,),
                //  Card(
                //    elevation: 8.8,
                //    child: Padding(
                //      padding: EdgeInsets.all(16),
                //      child: Column(
                //        children: [
                //          Row(
                //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //            children: [
                //               CustomListtile(
                //                   icon: Icons.notifications,
                //                   text: "Notification",
                //                 ),

                //              Spacer(),
                //              Switch(
                //                //hoverColor: Colors.grey,
                //                value: turnOnNotification, onChanged: (bool value){
                //                  setState(() {
                //                    turnOnNotification = value;
                //                  });
                                 
                //                },
                //                ),
                               
        
                //            ],
                //          ),
                //           Divider(height: 30, color: Colors.grey,),
                          
                //            Row(
                //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //            children: [
                //               CustomListtile(
                //                   icon: Icons.share_location,
                //                   text: "Position",
                //                 ),

                             
                //              Switch(
                //                //hoverColor: Colors.grey,
                //                value: turnOnLocation, onChanged: (bool value){
                //                  setState(() {
                //                    turnOnLocation = value;
                //                  });
                                 
                //                },
                //                ),
                               
        
                //            ],
                //          ),
                //           Divider(height: 30, color: Colors.grey,),
                //        ],
                //      ),
                //    ),
                //  ),
                //   SizedBox(height: 20,),
                //  const Text("Autres", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                //  SizedBox(height: 20,),
        
                  
                //  Card(
                //     elevation: 8.8,
                //     child: Padding(
                //       padding:  EdgeInsets.all(16),
                //       child: Container(
                //         //width: MediaQuery.of(context).size.width,
                //         child: Column(
                         
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children:  [
                //              CustomListtile(
                //                 icon: Icons.info,
                //                 text: "A propos",
                //               ),

                //              Divider(height: 30, color: Colors.grey,),
                            
                //              CustomListtile(
                //                 icon: Icons.star_outline,
                //                 text: "Evaluer",
                //               ),
                //              Divider(height: 30, color: Colors.grey,),
                //               CustomListtile(
                //                 icon: Icons.share,
                //                 text: "partager",
                //               ),
                //                Divider(height: 30, color: Colors.grey,),
                //               GestureDetector(
                //                 onTap: (() {
                //                   log.logout().then((value){
                //                      showLoadingIndicator(context, "Dé connexion en cours...");
                //                     Get.offAll(LoginPage());
                //                   }
                                  
                //                   );

                //                 }),
                //                 child: CustomListtile(
                //                   icon: Icons.logout,
                //                   text: "Déconnexion",
                //                 ),
                //               ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   )
        
              ], 
            ),
                   ),
              ),
        
      ),
    );
  } 
}