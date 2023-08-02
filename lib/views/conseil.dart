import 'package:app_hifadhu/controllers/infoController.dart';
import 'package:app_hifadhu/customs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../customs/custom.dart';
import 'components/home/Empty.dart';
import 'components/home/Loading.dart';
import 'components/makeCall.dart';
import 'homescreen.dart';

class conseil extends StatefulWidget {
  const conseil({ Key? key }) : super(key: key);

  @override
  State<conseil> createState() => _conseilState();
}

class _conseilState extends State<conseil> {
  infoController controller = Get.put(infoController());
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
          gradient: cyanGradient(),
          borderRadius: raduis(10),
          boxShadow: [shadow(cyan)]),
              child: Center(
                child: IconButton(onPressed: (){
                  Get.off(() => Homepage(),
                  transition: Transition.upToDown, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_back,size: 30, color: Color.fromARGB(255, 13, 3, 156),)),
              ),
          ),
        title: Text("Demande de conseil !!!" ,style: TextStyle(color: blue ),),
        centerTitle: true,
      ),
      
      body:  FutureBuilder(
                future: controller.getNumeroUrgence(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return chargementverticale();

                  }if (snapshot.hasError) {
                          return Center(child: Text('Something went wrong '));
                  } else {
                    var data = snapshot.data;
                     if (data == "null") {
                      return Empty();
                      } else {
         return listHelp(data);
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
          ListTile(title: Text("Mon conseiller", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: red),),),
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


   Widget listHelp(data) {
    return ListView.builder(
          itemCount: data.length,
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
                        child: Icon(Icons.contact_page_outlined),
                      ),
                      title: Text(data![index].name),
                      subtitle: Text(data[index].phone),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                            
                    ),
                  ),
                ),
              ),
            );
          }
          );
  }