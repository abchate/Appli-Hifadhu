import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/views/Profil_page.dart';
import 'package:app_hifadhu/views/components/home/Empty.dart';
import 'package:app_hifadhu/views/editStrories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/dataController.dart';
import '../../../controllers/infoController.dart';
import '../../../customs/custom.dart';
import '../../myStories.dart';
import '../../publication.dart';
import '../home/Loading.dart';
import '../small_button.dart';

class Mes_publication extends StatefulWidget {
  const Mes_publication({ Key? key }) : super(key: key);

  @override
  State<Mes_publication> createState() => _Mes_publicationState();
}

class _Mes_publicationState extends State<Mes_publication> {
  infoController controller = Get.put(infoController());
  Controller control = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 209, 242, 247),
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
                  Get.off(() => ProfilPage(),
                  transition: Transition.rightToLeft, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_back,size: 30, color: blue,)),
              ),
          ),
        title: Text("Mes publications" ,style: TextStyle(color: blue ),),
        centerTitle: true,
      ),
      body:   
     FutureBuilder(
                future: control.getMespublications(),
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
            var item = data[index];
            return GestureDetector(
              onTap: (() {
                 Get.to(() => Mypublication(item: data[index],),
                transition: Transition.downToUp, duration: milliseconds());
              }),
      
              child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
        height: 200,
        color: white,
        child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                       height: 150,
                       width: 100,
                       decoration: BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.circular(2),
                         boxShadow: const [
                           BoxShadow(
                             blurRadius: 1.0,
                             offset: Offset(0,1),
                             color: Colors.black38
                           )
                         ],
                         image:  DecorationImage(
                           image: AssetImage(ImageTwo),
                           fit: BoxFit.cover
                            ),
                       ),
                       
                     ),
                    // Spacer(),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                         children:  [
                          Text("Histoire de " + item.name, style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
                           
                          Text(item.type,style: TextStyle(fontSize: 16, color: red),),
                           Text(item.created,style: TextStyle(fontSize: 16),),
                          TextButton(
                            onPressed: (){
                               Get.to(() => editForm(item: data[index],),
                               transition: Transition.downToUp, duration: milliseconds());
                            },
                           child: Row(
                             children: [
                               Icon(Icons.edit),
                               Text(" Modifier l'histoire",style: TextStyle(fontSize: 16),),
                             ],
                           ),
                           ),
                          //   TextButton(
                          //   onPressed: (){},
                          //  child: Row(
                          //    children: [
                          //      Icon(Icons.note_add_sharp),
                          //      Text("  Ajouter une partie",style: TextStyle(fontSize: 16),),
                          //    ],
                          //  ),
                          //  ),
                           
                           
                         ],
                     ),
                      )
                   ],
                 ),
      ),
            );
          }
          );
  }