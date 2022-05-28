import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/customs/dialogues.dart';
import 'package:app_hifadhu/models/type_agression.dart';
import 'package:app_hifadhu/views/components/filepicker.dart';
import 'package:app_hifadhu/views/homescreen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/dataController.dart';

class victimForm extends StatefulWidget {
  
  victimForm({ Key? key}) : super(key: key);

  @override
  State<victimForm> createState() => _victimFormState();
}

class _victimFormState extends State<victimForm> {

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
    cas = "je suis victime";
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
  final List<typeAgression> typeaggression = [];
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
  String? _description;
  


 
  Controller controller = Get.put(Controller());
   TextEditingController nomController = new TextEditingController();
    TextEditingController descriptionController = new TextEditingController();

    void clear (){
      nomController.text = "";
      descriptionController.text = "";
    }
 
  String? cas;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 70,
        backgroundColor: Colors.white,
        leading:  Container(
          
            margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
          gradient: redGradient(),
          borderRadius: raduis(10),
          boxShadow: [shadow(red)]),
              child: Center(
                child: IconButton(onPressed: (){
                  Get.off(() => Homepage(),
                  transition: Transition.upToDown, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_back,size: 30, color: Color.fromARGB(255, 13, 3, 156),)),
              ),
          ),
        title: Text("Osez briser le silence !!!" ,style: TextStyle(color: blue ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(
         
          children: [
              Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 20),
              
               padding: all(value: 20),
               decoration: BoxDecoration(
              color: blue.withOpacity(0.2),
              borderRadius: raduis(10)),
        child: Text("Il est important de dénoncer, car tant que vous restez silencieux(se),les coupables ne seront jamais punis", 
        textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16), 
        ),),
            Divider(),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              
               padding: all(value: 5),
               decoration: BoxDecoration(
              
              borderRadius: raduis(10)),
              child: Text("POUR DENONCER VEUILLEZ REMPLIR LE FORMULAIRE CI-DESSOUS", 
              style: TextStyle(color: red, fontWeight: FontWeight.w900), textAlign: TextAlign.center,)),
            Divider(),
           
            Form(
            key: _formKey,
            child: Column(
              children: [         
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
              controller: nomController,  
                decoration: InputDecoration(
                    labelText: "pseudonyme/nom et prénom",
                    hintText: "Entrez un pseudonyme ou votre nom et prénom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                        )
                        ),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1
                        )
                        ),
                        ),
                        
    
                        // onSaved: (String? nom){
                        //   if(nom!.isEmpty){
                        //     setState(() {
                        //       _nom = "inconnu";
                        //     });
                        //   }else{
                        //       _nom = nom.trim();
                        //   }
                          
    
                        // },
                        validator: (String? nom) =>
                       nom!.isEmpty ? 'vous devez saisir un pseudonyme ou votre nom' : null,
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
      
        // value: selectedValue,
        items: controller.typeList.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          ); 
        }).toList(),
                
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
           items: controller.besoinList.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          ); 
        }).toList(),
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
                                     description!.isEmpty ? 'veuillez décrire les faits' : null,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, left: 10),
                            width: double.infinity, 
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: raduis(5),
                              
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
                          GestureDetector(
                onTap: (){
                     Map data = {
                                "name": nomController.text,
                                "category": cas,
                                "type_aggression": this.selectedValue,
                                "motif_reporting": this.selected,
                                "description": descriptionController.text

                              };
                              print("données $data");
                if(_formKey.currentState!.validate()){
               _formKey.currentState!.save();
               CircularProgressIndicator();
               controller.postForm(data).then((response) {
                if(response!["hasError"]){
                Visibility(
                visible: false, 
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator()
                  )
                );
                clear();
                  showSuccesDialog(
                    response['msg'],
                     context, 
                     () => {});
                  
                                  
               }else {
               
                 showErrorDialog(
                   response["msg"], 
                   context,
                    () => {});
            }
               });
              
                }
                },
                 child: Container(
                              width: width,
                              padding: EdgeInsets.only(top:14, bottom:14),
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  borderRadius: raduis(10),
                                  boxShadow: [shadow(blue)],
                                  gradient: blueGradient()),
                              child: const Center(
                                  child: Text(
                                "Enregirstrer",
                                style: TextStyle(
                                    color: white, fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
        // ElevatedButton(
        //   onPressed: () {
            
            // if(_formKey.currentState!.validate()){
            //    _formKey.currentState!.save();

            //    Get.defaultDialog(
            //       title: "succes",
            //       backgroundColor: Color.fromARGB(255, 83, 218, 152),
            //       textConfirm: "okay",
            //       middleText: "envoyer",
            //       onConfirm:() => Get.back()

            //       );
            // }else {
            //    Get.defaultDialog(
            //       title: "oops",
            //       backgroundColor: Color.fromARGB(255, 221, 28, 54),
            //       textConfirm: "okay",
            //       middleText: "erreur",
            //       onConfirm:() => Get.back()

            //       );
            // }
        //     } , 
        //   child: Text("          Envoyer       ")
        //     )

              ],
            ),
         
            
 
          )


          ],
        ),
      )

    );
  }
}