import 'package:app_hifadhu/views/Profil_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/dataController.dart';
import '../../../controllers/infoController.dart';
import '../../../customs/custom.dart';
import '../../homescreen.dart';
import '../home/Empty.dart';
import '../home/Loading.dart';

class historiqueAlert extends StatefulWidget {
  const historiqueAlert({ Key? key }) : super(key: key);

  @override
  State<historiqueAlert> createState() => _historiqueAlertState();
}

class _historiqueAlertState extends State<historiqueAlert> {
  infoController controller = Get.put(infoController());
  Controller control = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 223, 220, 245),
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
        title: Text("Historique des alertes" ,style: TextStyle(color: blue ),),
        centerTitle: true,
      ),
      body:  FutureBuilder(
                future: control.getEmergencyAlert(),
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
                      
      
        
    )
      
    );
  }
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
                        child: Icon(Icons.history),
                      ),
                      title: Text(data![index].category, style: TextStyle(color: blue)),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index].situation, style: TextStyle(color: red),),
                          Text(data[index].date),
                        ],
                      ),
                      // trailing: IconButton(onPressed: (){}, 
                      // icon: Icon(Icons.delete, size: 30,))
                            
                    ),
                  ),
                ),
              ),
            );
          }
          );
  }