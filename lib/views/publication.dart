import 'package:app_hifadhu/customs/colors.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/models/history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/infos/SlideInfosModel.dart';



class publication extends StatefulWidget {
 
  histories item;
  publication({ Key? key, required this.item }) : super(key: key);

  @override
  State<publication> createState() => _publicationState();
}

class _publicationState extends State<publication> {
  bool flag = true;
  int line = 15;

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
              backgroundColor: white,
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