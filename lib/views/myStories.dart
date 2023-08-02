import 'package:app_hifadhu/controllers/dataController.dart';
import 'package:app_hifadhu/customs/colors.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/models/history.dart';
import 'package:app_hifadhu/views/components/profil/Mes_publications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Mes_publication.dart';
import '../models/infos/SlideInfosModel.dart';



class Mypublication extends StatefulWidget {
 
 publicationModel item;
  Mypublication({ Key? key, required this.item }) : super(key: key);

  @override
  State<Mypublication> createState() => _MypublicationState();
}

class _MypublicationState extends State<Mypublication> {

  Controller controller = Get.put(Controller());
  bool flag = true;
  int line = 15;
  bool _Visibility= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ( (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              
              expandedHeight: 200,
              floating: false,
              pinned: true,
              backgroundColor: pink,
              flexibleSpace: FlexibleSpaceBar(
               centerTitle: true,
                title: Text("Histoire de  " + widget.item.name! ,
                
                 style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: blue,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(0, 1),
                                 blurRadius: 1,
                                color: Colors.black.withOpacity(0.6)),
                          ]),
                ),
                background: Image.asset(ImageTwo, fit: BoxFit.cover,),
              ),
            )
          ];
          
        }),

         body: SingleChildScrollView(
           child: Wrap(
               children: <Widget>[
                 Card(
            margin: EdgeInsets.all(8),
            child: Container(
              
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text("Histoire de  " + widget.item.name! , 
                      style: TextStyle(color: blue, fontWeight: FontWeight.bold, fontSize: 25),),
                    ),
                   
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star),
                        Text(widget.item.likes!.toString()),
                        SizedBox(width: 10,),
                        Icon(Icons.remove_red_eye),
                        Text(widget.item.vues!.toString()),
                        SizedBox(width: 10,),
                        Icon(Icons.comment),
                        Text(widget.item.vues!.toString()),

                      ],
                    ),
                     SizedBox(height: 20,),
                  Container(
                    
                      child: Text(
                        widget.item.text!, 
                        // overflow: flag ? TextOverflow.ellipsis : null,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    // InkWell(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: <Widget>[
                    //       Text(
                    //         flag ? "voir plus" : "voir moins",
                    //         style: new TextStyle(color: Colors.blue),
                    //       ),
                    //     ],
                    //   ),
                    //   onTap: () {
                    //     setState(() {
                    //       flag = !flag;
                          
                    //     });
                    //   },
                    // ),
                      //SizedBox(height: 25,),
                    Container(
                      margin: all(value: 20),
                      child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: (){
                            
                              setState(() {
                                _Visibility = !_Visibility;
                              });
                      
                            },
                            icon: _Visibility? 
                            IconButton(onPressed: (){
                             
                              var addlikes = widget.item.likes! + 1;
                              Map likes = {
                                "id": widget.item.id.toString(),
                                "likes": addlikes.toString()

                              };
                              
                              controller.postLikes(likes);
                              
                              
                            },
                            icon:Icon(Icons.star_border_outlined, color: pink,size: 30,)) 
                            : IconButton(onPressed: (){
                                var retirelikes = widget.item.likes! - 1;
                                    Map likes = {
                                "id": widget.item.id.toString(),
                                "likes": retirelikes.toString()

                              };
                              
                              controller.postLikes(likes);
                              Navigator.pop(context);
                            }, icon:Icon(Icons.star_rate, color: Colors.redAccent,size: 30,)),
                          ),
                        Text(widget.item.likes!.toString()),                       
                        Spacer(),
                        Icon(Icons.comment, color: pink,size: 30,),
                        Text(widget.item.vues!.toString()),
                        Spacer(),
                        Icon(Icons.share, color: pink,size: 30,),
                        Text(widget.item.vues!.toString()),

                      ],
                    ),
                    )
                  ],
                ))
           )
           ]
            ),
         )
         )
         );
  }
}