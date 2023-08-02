import 'package:app_hifadhu/controllers/dataController.dart';
import 'package:app_hifadhu/controllers/infoController.dart';
import 'package:app_hifadhu/models/contactUrgence.dart';
import 'package:app_hifadhu/views/Profil_page.dart';
import 'package:app_hifadhu/views/components/makeCall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../controllers/loginController.dart';
import '../../../customs/custom.dart';
import '../../../customs/dialogues.dart';
import '../../../customs/show_dailog.dart';
import '../../contactUrgence.dart';
import '../home/Empty.dart';
import '../home/Loading.dart';

class contact extends StatefulWidget {
  const contact({ Key? key }) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  infoController controller = Get.put(infoController());
  Controller control = Get.put(Controller());
   loginController info = Get.put(loginController());
    final _formKey = GlobalKey<FormState>();

   TextEditingController nomController = new TextEditingController();
    TextEditingController numController = new TextEditingController();

    void clear (){
      nomController.text = "";
      numController.text = "";
    }
  var _nom;
  var _numero;
   final Store = new FlutterSecureStorage();
  var addby;
 
  

 Future readToken() async{
   var donnee;
    try {
      var Storage = new FlutterSecureStorage();
      String? token = await Storage.read(key: 'token');
      addby = token;
       Map data = {
          'addby': token.toString()
        };
       
     
   

      return donnee;
      
    } catch (e) {
      print(e);
    }
  }
  var data;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readToken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 220, 220),
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
                  Get.off(() => ProfilPage(),
                  transition: Transition.rightToLeft, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_back,size: 30, color: Color.fromARGB(255, 13, 3, 156),)),
              ),
          ),
        title: Text("Contacts de confiance" ,style: TextStyle(color: blue ),),
        centerTitle: true,
      actions: [
        IconButton(
          padding: right(15),
          onPressed: () {
             showDialog(context: context,
                 builder: (BuildContext context)=> SimpleDialog(
                   title: Text("Entrer le compte du contact"),
                   children: [
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
                              _nom = nom!.trim();
                        },
                        validator: (String? nom) =>
                       nom!.isEmpty ? 'vous devez saisir votre nom/pseudonyme' : null,
              ),
            ),
                Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
               controller: numController,
                 decoration: InputDecoration( 
                      labelText: "numero du compte",
                      hintText: "Entrez un numero de téléphone",
                          prefixText: "+269",                  
                      border: OutlineInputBorder( 
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black, width: 3)
                          )
                          ),
                          maxLength:7,
                          keyboardType: TextInputType.phone,
                          onSaved: (String? numero){
                                _numero = numero!.trim();
                            },
                          
                          validator: ( numero) =>
                          numero!.isEmpty ? 'vous devez saisir le numero du compte' : null,
                ),
              ),
                         ],
                       )
                       ),
                    
               GestureDetector(
                              onTap: () {
                                Map data = {
                                "name": nomController.text,
                                "phone": "+269"+ numController.text,
                                "addby":addby.toString() ,

                              };
                              
                if(_formKey.currentState!.validate()){
               _formKey.currentState!.save();
               //showLoadingIndicator(context, "Enregistrement en cours...");
               control.postContactUrgent(data).then((response) {
                if(response!["hasError"]){
              
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 45,
                                      width: 180,
                                     // margin: EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          color: red,
                                          gradient: redGradient(),
                                          boxShadow: [shadow(red)],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text('Enregistrer',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                ],
                              ))

                   ],
                   )
                   );
                            
                          
      //Get.to(() => ProfilPage());
    }, icon: const Icon(Icons.person_add, size: 30, color: Color.fromARGB(255, 14, 24, 168),))],
      ),
      body:  FutureBuilder(
                
                future: control.getContactUrgent(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return chargementverticale();

                  }if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong '));
                  } else {
                     data = snapshot.data;
                    print("snapshot data $data");
                     if (data == []) {
                      return Empty();
                      } else {
                       

         return ListView.builder(
          itemCount: data!.length,
          scrollDirection: Axis.vertical,
          itemBuilder:  (context, index) {
            return GestureDetector(
      
              child: Container(
                width: 100,
                
                child: GestureDetector(
                  onTap: () {
                    
                       bottomSheet(data[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10,left: 10,top: 10,),
                          decoration: BoxDecoration(
                            color: white,
                         //gradient: redGradient(),
                        borderRadius: raduis(10),
                        boxShadow: [shadow(white)]),
                    child: ListTile(
                      
                      leading: CircleAvatar(
                        backgroundColor: white,
                        child: Icon(Icons.account_circle, size: 40, ),
                      ),
                      title: Text(data![index].name, style: TextStyle(color:blue),),
                      subtitle: Text(data[index].phone,style: TextStyle(color:blue)),
                      trailing: IconButton(
                        onPressed: (){
                             //showLoadingIndicator(context, "Suppression en cours...");
                          Map contact = {
                          "addby": addby.toString(),
                          "phone":data[index].phone.toString()

                        };
                        
                        control.deleteUrgenceContact(contact).then((response){
                          // showLoadingIndicator(context, "Suppression en cours...");
                                  if(response!["hasError"]){                             
                           
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

                        }, 
                        icon:Icon(Icons.delete,size: 30,))
                            
                    ),
                  ),
                ),
              ),
            );
          }
          );
          }
                  }
                }
                      
      
        
    ));
  }
}
Future bottomSheet(item) {
  return Get.bottomSheet(
    
    Container(
      height: 250,
      padding: EdgeInsets.all(10),
     
      child: ListView(
        children: [
          ListTile(title: Text("Mon Protecteur", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: red),),),
          Container(
            alignment: Alignment.center,
            child:  Text(item.name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 30,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: (){
                  sosCall(item.phone);
                },
                icon: Icon(Icons.phone, size: 35,)
                 ),
            ),
               SizedBox(width: 50,),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red,
              child: IconButton(
                onPressed: (){
                  makeSMS(item.phone);
                },
                icon: Icon(Icons.message, size: 35,)
                 ),
            ),
          ],
        ),
        ],
        
        
      ),
    ),
    backgroundColor: white,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
       side: BorderSide(
                      width: 1,
                      color: blue
                    )
    )
    );
}


 