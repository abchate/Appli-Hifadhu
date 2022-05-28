import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/views/components/filepicker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/dataController.dart';

class temoinForm extends StatefulWidget {
  
  temoinForm({ Key? key}) : super(key: key);

  @override
  State<temoinForm> createState() => _temoinFormState();
}

class _temoinFormState extends State<temoinForm> {

      final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
    cas = "je suis temoin";
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      print(_paths!.first.extension);
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
         backgroundColor: result! ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }
    final List<String> agressionItems = [
  'violence physique',
  'violence verbale',
  'violence psychologie',
  'violence sexuelle',
  'violence socioéconomique',
  'violence émotionnelle',
  'harcélement',
  'mariage forcé',
  'mutilations génitales féminines',
  'avortement forcé',
  'stérelisation forcé',
  'Autre',
 ];

String? selectedValue;
    final List<String> Items = [
  "Besoin d'aide",
  'Besoin de conseil',
  "Besoin de soutient",
  "Besoin de rien"
 ];

String? selected;
  final _formKey = GlobalKey<FormState>();

  String? _nom;
  String? _numero;
  String? _adresse;
  String? _agresseur;
  String? _num_agr;
  String? _description;
  String? _descriptagr;

    TextEditingController nomController = new TextEditingController();
  TextEditingController numController = new TextEditingController();
  TextEditingController agresseurController = new TextEditingController();
  TextEditingController numagrController = new TextEditingController();
  TextEditingController adresseController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

 
  Controller controller = Get.put(Controller());
 
  String? cas;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset("assets/5.png",),
        title: Text("Osez briser le silence !!!" ,style: TextStyle(color:Colors.blue ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(
         
          children: [
            FadeInLeft(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Il est important de dénoncer, car tant que vous restez silencieux(se),les coupables ne seront jamais punis", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                  )),
              ),
            ),
            Text("POUR DENONCER VEUILLEZ REMPLIR LE FORMULAIRE CI-DESSOUS", style: TextStyle(color: Colors.red.shade400, fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("CAS:", style: TextStyle(color: Colors.black) ,),
                  Text(" $cas", style: TextStyle(color: Colors.red.shade400) ,),
                ],
              ),
            ),
            Form(
            key: _formKey,
            child: Column(
              children: [         
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: nomController,
                decoration: InputDecoration(
                    labelText: "pseudonyme",
                    hintText: "Entrez un pseudonyme ou votre nom et prénom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        
                        )
                        ),
                        
    
                        onSaved: (String? nom){
                          if(nom!.isEmpty){
                            setState(() {
                              _nom = "inconnu";
                            });
                          }else{
                              _nom = nom.trim();
                          }
                          
    
                        },
                      //   validator: (String? nom) =>
                      //  nom!.isEmpty ? 'vous devez saisir votre nom/pseudonyme' : null,
              ),
            ),
                Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                controller: numController,
                 decoration: InputDecoration( 
                      labelText: "numero de téléphone",
                      hintText: "Entrez votre numero de téléphone",
                          prefixText: "+269",                  
                      border: OutlineInputBorder( 
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black, width: 3)
                          )
                          ),
                          maxLength:7,
                          keyboardType: TextInputType.phone,
                          onSaved: (String? numero){
                            if(numero == "+269")
                            {
                              setState(() {
                                  _numero = "inconnu";
                              });  
                            }else{
                                _numero = numero!.trim();
                            } 
      
                          },
                          
                          // validator: ( numero) =>
                          //  ? "numero incorrect": null,
                ),
              ),
               Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: TextFormField(
                controller: adresseController,
                decoration: InputDecoration(
                    labelText: "adresse",
                    hintText: "où habitez-vous?",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        
                        )
                        ),
                        
    
                        onSaved: (String? adresse){
                          if(adresse!.isEmpty){
                            setState(() {
                              _adresse = "inconnu";
                            });
                            
                          }else{
                            _adresse = adresse.trim();
                          }
                            
    
                        },
                      //   validator: (String? agresseur) =>
                      //  agresseur!.isEmpty ? agresseur : "inconnu",
              ),
            ),
                  Container(
                    height: 50,
                  
                  margin: EdgeInsets.all(10),
      child: DropdownButtonFormField2(                     
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        ),
      isExpanded: true,
      hint: const Text(
        "Type d'agression *",
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
        borderRadius: BorderRadius.circular(10),
      ),

      items: agressionItems
              .map((item) =>
              DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
              .toList(),
              
      validator: (value) {
        if (value == null) {
          return "Veuillez selection un type d'agression";
        }
      },
      onChanged: (value) {
        selectedValue = value.toString();
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      )
                      ),
                      Container(
                            margin: EdgeInsets.all(10),
                            height: 100,
                            child: TextFormField(
                              // controller: descriptionController,
                              decoration: InputDecoration(
                                  // icon: Icon(Icons.account_box_rounded, size: 50,),
                                  labelText: "Déscription de l'agresseur",
                                  // hintText: "vous pouvez décrire, donner l'identité ou le numero de l'agresseur",
                                 

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      
                                      )
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      expands: true,
                                     
                  
                                      onSaved: (String? descriptagr){
                                         if(descriptagr!.isEmpty){
                                          setState(() {
                                            _descriptagr = "inconnu";
                                          });
                                         
                                        }else{
                                          _descriptagr = descriptagr.trim();
                                        }
                                         
                  
                                      },
                                    //   validator: (String? description) =>
                                    //  description!.isEmpty ? 'veuillez décrire les faits' : null,
                            ),
                          ),
        //                 Container(          
        //                   margin: EdgeInsets.all(10),
                          
        //                     child: TextFormField(
        //                       controller: agresseurController,
        //                       decoration: InputDecoration(
        //                           labelText: "identité de votre agresseur",
        //                           hintText: "Vous pouvez donner l'identité de votre agresseur",
        //                           border: OutlineInputBorder(
        //                               borderRadius: BorderRadius.circular(10),
                                      
        //                               )
        //                               ),
                                      
                  
        //                               onSaved: (String? agresseur){
        //                                 if(agresseur!.isEmpty){
        //                                   setState(() {
        //                                     _agresseur = "inconnu";
        //                                   });
                                         
        //                                 }else{
        //                                   _agresseur = agresseur.trim();
        //                                 }
                                         
                  
        //                               },
        //                             //   validator: (String? agresseur) =>
        //                             //  agresseur!.isEmpty ? agresseur : "inconnu",
        //                     ),
        //                   ),
        
        // Container(
        //   margin: EdgeInsets.all(10),
        //   child: TextFormField(
        //     controller: numagrController,
        //     decoration: InputDecoration(
        //         labelText: "numero de l'agresseur",
        //         hintText: " numero de téléphone de l'agresseur",
        //         prefixText: "+269",
                
        //         border: OutlineInputBorder(
                  
        //             borderRadius: BorderRadius.circular(10),
        //             borderSide: const BorderSide(color: Colors.black, width: 3)
        //             )
        //             ),
        //             maxLength: 7,
        //             keyboardType: TextInputType.phone,
        //             onSaved: (String? num_agr){
        //               if(num_agr == "+269")
        //               {
        //                 setState(() {
        //                     _num_agr = "inconnu";
        //                 });
                        
        //               }else{
        //                   _num_agr = num_agr!.trim();
        //               }
                      

        //             },
                    
        //           //   validator: (String? numero) =>
        //           //  numero!.length == 11 ? "numero incorrect": null,
        //   ),
        // ),
                           
                           Container(
                             height: 50,
                            
                 margin: EdgeInsets.only(right: 10,left: 10),             
              child:DropdownButtonFormField2(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),

          ),
          isExpanded: true,
          hint: const Text(
            "Qu'avez vous besoins? *",
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
          items: Items
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                  .toList(),
          validator: (value) {
            if (value == null) {
              return "veuillez selection un besoin";
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
                           Container(
                            margin: EdgeInsets.all(10),
                            height: 150,
                            child: TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  // icon: Icon(Icons.account_box_rounded, size: 50,),
                                  // labelText: "Déscription des faits*",
                                  hintText: "Qu'est ce qui s'est passé? *",
                                 hintStyle: TextStyle(color: Colors.red) ,

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      
                                      )
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      expands: true,
                                      
                  
                                      onSaved: (String? description){
                                         _description = description!.trim();
                  
                                      },
                                      validator: (String? description) =>
                                     description!.isEmpty ? 'veuillez décrire les faits' : null,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _openFileExplorer();
                                  },
                                   child: Text(" Vous pouvez ajouter des pieces jointes", style: TextStyle(color: Colors.black, fontSize: 16),)
                                   ),
                                   Container(
                                     child: Builder(
                  builder: (BuildContext context) => _loadingPath
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: const CircularProgressIndicator(),
                        )
                      : _directoryPath != null
                          ? ListTile(
                              title: const Text('Directory path'),
                              subtitle: Text(_directoryPath!),
                            )
                          : _paths != null
                              ? Container(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  child: Scrollbar(
                                      child: ListView.separated(
                                    itemCount:
                                        _paths != null && _paths!.isNotEmpty
                                        ? _paths!.length
                                        : 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final bool isMultiPath =
                                      _paths != null && _paths!.isNotEmpty;
                                      final String name = 'Fichier $index: ' +
                                      (isMultiPath
                                          ? _paths!
                                              .map((e) => e.name)
                                              .toList()[index]
                                          : _fileName ?? '...');
                                      final path = _paths!
                                      .map((e) => e.path)
                                      .toList()[index]
                                      .toString();

                                      return ListTile(
                                        title: Text(
                                      name, style: TextStyle(color: Colors.red),
                                        ),
                                        // subtitle: Text(path),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                        const Divider(),
                                  )),
                                )
                              : const SizedBox(),
                ),
                                   )
                              ],
                            ),
                          ),
        ElevatedButton(
          onPressed: () {
            
            if(_formKey.currentState!.validate()){
               _formKey.currentState!.save();

               Get.defaultDialog(
                  title: "succes",
                  backgroundColor: Color.fromARGB(255, 83, 218, 152),
                  textConfirm: "okay",
                  middleText: "envoyer",
                  onConfirm:() => Get.back()

                  );
            }else {
               Get.defaultDialog(
                  title: "oops",
                  backgroundColor: Color.fromARGB(255, 221, 28, 54),
                  textConfirm: "okay",
                  middleText: "erreur",
                  onConfirm:() => Get.back()

                  );
            }
            } , 
          child: Text("          Envoyer       ")
            )

              ],
            ),
         
            
 
          )


          ],
        ),
      )

    );
  }
}