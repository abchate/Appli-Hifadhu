import 'dart:io';

import 'package:app_hifadhu/customs/button.dart';
import 'package:app_hifadhu/views/components/custom_list_tile.dart';
import 'package:badges/badges.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:image_picker/image_picker.dart';

import '../../../controllers/dataController.dart';
import '../../../controllers/infoController.dart';
import '../../../controllers/loginController.dart';
import '../../../customs/custom.dart';
import '../../../customs/dialogues.dart';
import '../../../customs/image_url.dart';
import '../../../customs/show_dailog.dart';
import '../../Profil_page.dart';

class editProfil extends StatefulWidget {
  const editProfil({ Key? key }) : super(key: key);

  @override
  State<editProfil> createState() => _editProfilState();
}

class _editProfilState extends State<editProfil> {

infoController controller = Get.put(infoController());
  Controller control = Get.put(Controller());
   loginController infos = Get.put(loginController());
    final _formKey = GlobalKey<FormState>();

 
  var _nom;
  var _numero;
   final Store = new FlutterSecureStorage();
  var addby;
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
    TextEditingController nomController = new TextEditingController();
    TextEditingController numController = new TextEditingController();
     TextEditingController descriptionController = new TextEditingController();

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
    return Scaffold(
      backgroundColor: white,
            appBar: AppBar(
        elevation: 0,
        leadingWidth: 70,
        backgroundColor: Colors.white,
        leading:  Container(
          
            margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
          gradient: blueGradient(),
          borderRadius: raduis(10),
          boxShadow: [shadow(blue)]),
              child: Center(
                child: IconButton(onPressed: (){
                  Get.off(() => ProfilPage(),
                  transition: Transition.rightToLeft, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_back,size: 30, color: white,)),
              ),
          ),
        title: Text("Modifer le profil" ,style: TextStyle(color: blue ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Container(
                 // color: blue,
                         height: 150,
                         width: 150,
                         
                         child:  ClipOval(
                          
                          child: _imageFile != null
                          ? Image.file(
                            _imageFile!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ):  ClipOval(
                          
                          child: Container(
                              width: 150,
                              height: 150,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppIcon,
                              )),
                        ),
                  ),
                        
                       ),
                        SizedBox(height: 10,),
                    Card(
                   elevation: 0,
                   child: Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20),
                     child: Column(
                       
                       children:  [
                          
            //                 ListTile(
            //                   leading: const Icon(Icons.phone, color:Colors.red ,),
            //                   trailing: Icon(Icons.edit),
            //                   title: const Text('Téléphone'),
            //                   subtitle:  FutureBuilder(
            //                   future: Loginfo(),
            //                   builder: (context, snapshot){
            //                     if(!snapshot.hasData){
                                 
            //                       return CircularProgressIndicator();
            //                     }else {
                                 
            //                       var info = snapshot.data as Map;

            //                       return Text(info["phone"].toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),);

            //                     }
            //                   },),
            //                   onTap: (){
            //                 showDialog(context: context,
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
            //           onTap: () {
            //           Get.back(); 
            //          },
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
            //                   },
            //                 ),
            //             Divider(height: 30, color: Colors.grey,),
                       ListTile(
                              leading: const Icon(Icons.person, color:Colors.red ,),
                              trailing: Icon(Icons.edit),
                              title: const Text('Pseudonyme'),
                              subtitle:                        FutureBuilder(
                              future: Loginfo(),
                              builder: (context, snapshot){
                                if(!snapshot.hasData){
                                 
                                  return CircularProgressIndicator();
                                }else {
                                 
                                  var info = snapshot.data as Map;

                                  return Text(info["pseudonyme"].toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),);

                                }
                              },),
                              onTap: (){
                                setState(() {
                                  nomController.text = info!["pseudonyme"].toString();
                                });
                                showDialog(context: context,
                 builder: (BuildContext context)=> SimpleDialog(
                   title: Text("Entrer le pseudonyme"),
                   children: [
                     Form(
                        key: _formKey,
                       child: Column(
                         children: [
                    Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                
                controller:  nomController ,
                decoration: InputDecoration(
                    labelText: "pseudonyme",
                    hintText: "Entrez un pseudonyme ou votre nom et prénom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        
                        )
                        ),
                        
    
                        onSaved: (String? nom){                        
                              _nom = nom!.trim();
                        },
                        validator: (String? nom) =>
                       nom!.isEmpty ? 'vous devez saisir votre nom/pseudonyme' : null,
              ),
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
                      Get.back(); 
                     },
                     child: button("annulé", red, redGradient())
                     ),
                   GestureDetector(
                              onTap: () {
                                Map data = {
                                "pseudonyme": nomController.text,
                                "phoneNumber":info!["phone"].toString() ,
                               

                              };
                                  
                if(_formKey.currentState!.validate()){
               _formKey.currentState!.save();
              
               infos.updatePseudoUser(data).then((response) {
                if(response!["hasError"]){
               
                infos.getLoginInfo(data); 
                 nomController.text = "";
                  
                  
                  showSuccesDialog(
                    response['msg'],
                     context, 
                    () => {
                     
                      Navigator.pop(context)
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
                                  child: button("modifier", blue, blueGradient())),
                 ],
               )

                   ],
                                 ) );
                              },
                            ),
                          Divider(height: 30, color: Colors.grey,),
                          ListTile(
                              leading: const Icon(Icons.bloodtype, color:Colors.red ,),
                              trailing: Icon(Icons.edit),
                              title: const Text('Groupe sanguin'),
                              subtitle:                        FutureBuilder(
                              future: Loginfo(),
                              builder: (context, snapshot){
                                if(!snapshot.hasData){
                                 
                                  return CircularProgressIndicator();
                                }else {
                                 
                                  var info = snapshot.data as Map;

                                  return Text(info["blood"].toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),);

                                }
                              },),
                              onTap: (){
                                  showDialog(context: context,
                 builder: (BuildContext context)=> SimpleDialog(
                   title: Text("Choisi votre groupe sanguin"),
                   children: [
                     Form(
                        key: _formKey,
                       child: Column(
                         children: [
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
            style: TextStyle(fontSize: 14, color: Colors.red),
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
              return "veuillez votre groupe sanguin";
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
                      Get.back(); 
                     },
                     child: button("annulé", red, redGradient())),
                   GestureDetector(
                              onTap: () {
                                Map data = {
                                
                                "phoneNumber":info!["phone"].toString() ,
                                "blood":selected.toString() ,
                               

                              };
                                  
                if(_formKey.currentState!.validate()){
               _formKey.currentState!.save();
               //showLoadingIndicator(context, "Enregistrement en cours...");
               infos.updatebloodUser(data).then((response) {
                if(response!["hasError"]){
              
                infos.getLoginInfo(data);
               
                  showSuccesDialog(
                    response['msg'],
                     context, 
                    () => {
                     
                      Navigator.pop(context)
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
                                  child: button("modifier", blue, blueGradient())),
                 ],
               )

                   ],
                                 ) );
                              },
                            ),
                         Divider(height: 30, color: Colors.grey,),
                           ListTile(
                              leading: const Icon(Icons.info, color:Colors.red ,),
                              trailing: Icon(Icons.edit),
                              title: const Text('A propos'),
                              subtitle:                        FutureBuilder(
                              future: Loginfo(),
                              builder: (context, snapshot){
                                if(!snapshot.hasData){
                                 
                                  return CircularProgressIndicator();
                                }else {
                                 
                                  var info = snapshot.data as Map;

                                  return Text(info["about"].toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),);

                                }
                              },),
                              onTap: (){
                                 setState(() {
                                  descriptionController.text = info!["about"].toString();
                                });
                                showDialog(context: context,
                 builder: (BuildContext context)=> SimpleDialog(
                   title: Text("Déscription"),
                   children: [
                     Form(
                        key: _formKey,
                       child: Column(
                         children: [
                    Container(
              margin: EdgeInsets.all(10),
              height: 150,
              child: TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  // icon: Icon(Icons.account_box_rounded, size: 50,),
                                  // labelText: "Déscription des faits*",
                                  hintText: "Parler nous de vous ",
                                 hintStyle: TextStyle(color: Colors.grey) ,

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      
                                      ),
                                       enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1
                        )
                        ),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      expands: true,
                                      
                  
                                      // onSaved: (String? description){
                                      //    descriptionController = description!.trim();
                  
                                      // },
                                      validator: (String? description) =>
                                     description!.isEmpty ? 'Parler nous de vous' : null,
                            ),
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
                      Get.back(); 
                     },
                     child: button("annulé", red, redGradient())),
                   GestureDetector(
                              onTap: () {
                                 Map data = {
                                
                                "phoneNumber":info!["phone"].toString() ,
                                "about":descriptionController.text

                              };
                                  
                if(_formKey.currentState!.validate()){
               _formKey.currentState!.save();
               //showLoadingIndicator(context, "Enregistrement en cours...");
               infos.updateAboutUser(data).then((response) {
                if(response!["hasError"]){
              infos.getLoginInfo(data);
                descriptionController.text = "";
                 showSuccesDialog(
                    response['msg'],
                     context, 
                    () => {
                     
                      Navigator.pop(context)
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
                                  child: button("modifier", blue, blueGradient())),
                 ],
               )

                   ],
                                 ) );
                              },
                            ),
                        

                        Divider(height: 30, color: Colors.grey,),
                       ],
                     ),
                     ),
                 ),



            ],
          ),
        ),
      ),
      
      
    );
  }
}