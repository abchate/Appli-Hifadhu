
// import 'package:app_hifadhu/models/dataController.dart';
// import 'package:app_hifadhu/views/homescreen.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class formulaire extends StatefulWidget {
//   const formulaire({ Key? key }) : super(key: key);

//   @override
//   State<formulaire> createState() => _formulaireState();
// }

// class _formulaireState extends State<formulaire> {
//   final List<String> agressionItems = [
//   'violence physique',
//   'violence verbale',
//   'violence psychologie',
//   'violence sexuelle',
//   'violence socioéconomique',
//   'violence émotionnelle',
//   'harcélement',
//   'mariage forcé',
//   'mutilations génitales féminines',
//   'avortement forcé',
//   'stérelisation forcé',
//   'Autre',
//  ];

// String? selectedValue;
//     final List<String> Items = [
//   "Besoin d'aide",
//   'Besoin de conseil',
//   "Besoin de soutient",
//   "Besoin de rien"
//  ];

// String? selected;
//     final _formKey = GlobalKey<FormState>();

//   String? _nom;
//   String? _numero;
//   String? _adresse;
//   String? _agresseur;
//   String? _num_agr;
//   String? _description;

//     TextEditingController nomController = new TextEditingController();
//   TextEditingController numController = new TextEditingController();
//   TextEditingController agresseurController = new TextEditingController();
//   TextEditingController numagrController = new TextEditingController();
//   TextEditingController adresseController = new TextEditingController();
//   TextEditingController descriptionController = new TextEditingController();

  
//   Controller controller = Get.put(Controller());
//     @override
//   void onClose() {
//      nomController.dispose();
//     numController.dispose();
//     agresseurController.dispose();
//     adresseController.dispose();
//     numagrController.dispose();
//     descriptionController.dispose();
    
//   }

//   @override
//   void dispose() {
   

//     super.dispose();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//           child:Form(
//             key: _formKey,
//             child: Column(
//               children: [
              
//                           Container(
//                             margin: EdgeInsets.all(10),
//                             child: TextFormField(
//                               controller: nomController,
//                               decoration: InputDecoration(
//                                   icon: Icon(Icons.account_box_rounded, size: 30,),
//                                   labelText: "pseudonyme/nom et prénom",
//                                   hintText: "Entrez un pseudonyme ou votre nom et prénom",
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
                                      
//                                       )
//                                       ),
                                      
                  
//                                       onSaved: (String? nom){
//                                         if(nom!.isEmpty){
//                                           setState(() {
//                                             _nom = "inconnu";
//                                           });
//                                         }else{
//                                            _nom = nom.trim();
//                                         }
                                       
                  
//                                       },
//                                     //   validator: (String? nom) =>
//                                     //  nom!.isEmpty ? 'vous devez saisir votre nom/pseudonyme' : null,
//                             ),
//                           ),
//                            Container(
//                             margin: EdgeInsets.all(10),
//                             child: TextFormField(
//                              controller: numController,
                            
//                               decoration: InputDecoration(
//                                   icon: Icon(Icons.phone_android, size: 30,),
//                                   labelText: "numero de téléphone",
//                                   hintText: "Entrez votre numero de téléphone",
//                                   prefixText: "+269",
                                  
//                                   border: OutlineInputBorder(
                                    
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(color: Colors.black, width: 3)
//                                       )
//                                       ),
//                                       keyboardType: TextInputType.phone,
                                     
                                      
                                      
                  
//                                       onSaved: (String? numero){
//                                         if(numero == "+269")
//                                         {
//                                           setState(() {
//                                              _numero = "inconnu";
//                                           });
                                         
//                                         }else{
//                                            _numero = numero!.trim();
//                                         }
                                       
                  
//                                       },
                                      
//                                     //   validator: (String? numero) =>
//                                     //  numero!.length == 11 ? "numero incorrect": null,
//                             ),
//                           ),
//                            Container(
//                              height: 50,
                            
//                             margin: EdgeInsets.all(10),
//                             child: DropdownButtonFormField2(
                              
                              
//           decoration: InputDecoration(
//             icon: Icon(Icons.file_open, size: 30,),
//             //Add isDense true and zero Padding.
//             //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
//             isDense: true,
//             contentPadding: EdgeInsets.zero,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             //Add more decoration as you want here
//             //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
//           ),
//           isExpanded: true,
//           hint: const Text(
//             "Type d'agression",
//             style: TextStyle(fontSize: 14),
//           ),
//           icon: const Icon(
//             Icons.arrow_drop_down,
//             color: Colors.black45,
//           ),
//           iconSize: 30,
//           buttonHeight: 60,
//           buttonPadding: const EdgeInsets.only(left: 20, right: 10),
//           dropdownDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//           ),
          
//           items: agressionItems
//                   .map((item) =>
//                   DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(
//                       item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//                   .toList(),
                  
//           validator: (value) {
//             if (value == null) {
//               return "Veuillez selection un type d'agression";
//             }
//           },
//           onChanged: (value) {
//             selectedValue = value.toString();
//           },
//           onSaved: (value) {
//             selectedValue = value.toString();
//           },
//         )
//                           ),
//                            Container(
//                             margin: EdgeInsets.all(10),
//                             child: TextFormField(
//                               controller: adresseController,
//                               decoration: InputDecoration(
//                                   icon: Icon(Icons.account_box_rounded, size: 30,),
                            
//                                   labelText: "adresse",
//                                   hintText: "ou habitez-vous?",
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
                                      
//                                       )
//                                       ),
                                      
                  
//                                       onSaved: (String? adresse){
//                                         if(adresse!.isEmpty){
//                                           setState(() {
//                                             _adresse = "inconnu";
//                                           });
                                         
//                                         }else{
//                                           _adresse = adresse.trim();
//                                         }
                                         
                  
//                                       },
//                                     //   validator: (String? agresseur) =>
//                                     //  agresseur!.isEmpty ? agresseur : "inconnu",
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.all(10),
//                             child: TextFormField(
//                               controller: numagrController,
                            
//                               decoration: InputDecoration(
//                                   icon: Icon(Icons.phone_android, size: 30,),
//                                   labelText: "numero de l'agresseur",
//                                   hintText: " numero de téléphone de l'agresseur",
//                                   prefixText: "+269",
                                  
//                                   border: OutlineInputBorder(
                                    
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(color: Colors.black, width: 3)
//                                       )
//                                       ),
//                                       keyboardType: TextInputType.phone,
                                     
                                      
                                      
                  
//                                       onSaved: (String? num_agr){
//                                         if(num_agr == "+269")
//                                         {
//                                           setState(() {
//                                              _num_agr = "inconnu";
//                                           });
                                         
//                                         }else{
//                                            _num_agr = num_agr!.trim();
//                                         }
                                       
                  
//                                       },
                                      
//                                     //   validator: (String? numero) =>
//                                     //  numero!.length == 11 ? "numero incorrect": null,
//                             ),
//                           ),
//                           //  Container(
//                           //   margin: EdgeInsets.all(10),
//                           //   child: TextFormField(
//                           //     controller: agresseurController,
//                           //     decoration: InputDecoration(
//                           //         icon: Icon(Icons.account_box_rounded, size: 30,),
                            
//                           //         labelText: "identité de votre agresseur",
//                           //         hintText: "Vous pouvez donner l'identité de votre agresseur",
//                           //         border: OutlineInputBorder(
//                           //             borderRadius: BorderRadius.circular(10),
                                      
//                           //             )
//                           //             ),
                                      
                  
//                           //             onSaved: (String? agresseur){
//                           //               if(agresseur!.isEmpty){
//                           //                 setState(() {
//                           //                   _agresseur = "inconnu";
//                           //                 });
                                         
//                           //               }else{
//                           //                 _agresseur = agresseur.trim();
//                           //               }
                                         
                  
//                           //             },
//                           //           //   validator: (String? agresseur) =>
//                           //           //  agresseur!.isEmpty ? agresseur : "inconnu",
//                           //   ),
//                           // ),
//                            Container(
//                              height: 50,
                            
//                             margin: EdgeInsets.all(10),
//                             child:DropdownButtonFormField2(
//           decoration: InputDecoration(
//             icon: Icon(Icons.file_open, size: 30,),
//             //Add isDense true and zero Padding.
//             //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
//             isDense: true,
//             contentPadding: EdgeInsets.zero,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),

//           ),
//           isExpanded: true,
//           hint: const Text(
//             "Qu'avez vous besoins?",
//             style: TextStyle(fontSize: 14),
//           ),
//           icon: const Icon(
//             Icons.arrow_drop_down,
//             color: Colors.black45,
//           ),
//           iconSize: 30,
//           buttonHeight: 60,
//           buttonPadding: const EdgeInsets.only(left: 20, right: 10),
//           dropdownDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           items: Items
//                   .map((item) =>
//                   DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(
//                       item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//                   .toList(),
//           validator: (value) {
//             if (value == null) {
//               return "veuillez selection un besoin";
//             }
//           },
//           onChanged: (value) {
//             selected = value!.toString();
//           },
//           onSaved: (value) {
//             selected = value.toString();
//           },
//         )
//                           ),
//                            Container(
//                             margin: EdgeInsets.all(10),
//                             child: TextFormField(
//                               controller: descriptionController,
//                               decoration: InputDecoration(
//                                   // icon: Icon(Icons.account_box_rounded, size: 50,),
//                                   // labelText: "Déscription des faits*",
//                                   hintText: "Qu'est ce qui s'est passé?",
                                 

//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
                                      
//                                       )
//                                       ),
//                                       maxLines: 10,
                                      
                  
//                                       onSaved: (String? description){
//                                          _description = description!.trim();
                  
//                                       },
//                                       validator: (String? description) =>
//                                      description!.isEmpty ? 'veuillez décrire les faits' : null,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: (() {
//                               Map data = {
//                                 "name": this._nom,
//                                 "phone_victime": this._numero,
//                                 "type_violence": this.selectedValue,
//                                 "location": this._adresse,
//                                 'phone_violeur': this._num_agr,
//                                 // "agresseur": this._agresseur,
//                                 "motif_reporting": this.selected,
//                                 "description": this._description

//                               };
//                               if(_formKey.currentState!.validate()){
//                                 _formKey.currentState!.save();
                                
//                                controller.postForm(data).then((response) {
                                //  if(response["msg"] == "Alert reported successfully"){
                                //   Get.defaultDialog(
                                //   title: "succes",
                                //   backgroundColor: Color.fromARGB(255, 83, 218, 152),
                                //   textConfirm: "okay",
                                //   middleText: response["msg"],
                                //   onConfirm:() => Get.back()

                                //   );
//                                    nomController.clear();
//                                     numController.clear();
//                                     agresseurController.clear();
//                                     adresseController.clear();
//                                     numagrController.clear();
//                                     descriptionController.clear();
//                                  }else{
//                                   Get.defaultDialog(
//                                   title: "oops",
//                                   backgroundColor: Color.fromARGB(255, 224, 76, 76),
//                                   textConfirm: "okay",
//                                   middleText: response["msg"],
//                                   onConfirm:() => Get.back()
//                                   );
//                                  }
                                 
//                                });
                               
                                  
                                   

//                                 print("données: $_nom,$_numero, $selectedValue, $_agresseur, $selected, $_description");
//                               }
//                             }), 
//                             style: ButtonStyle(
//                               backgroundColor:  MaterialStateProperty.all<Color>(Colors.blue),
//                               elevation: MaterialStateProperty.all<double>(0.8),
//                               shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                              

//                             ),
//                             child: Text("            Envoyer            ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black ),)
//                             )
//               ],
//             ),
         
            

//           )
          
        
//       ),

//     );
//   }
// }