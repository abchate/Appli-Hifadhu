import 'package:app_hifadhu/controllers/dataController.dart';
import 'package:app_hifadhu/customs/colors.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/models/history.dart';
import 'package:app_hifadhu/views/components/comment.dart';
import 'package:app_hifadhu/views/components/commentBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../models/infos/SlideInfosModel.dart';



class publication extends StatefulWidget {
 
  histories item;
  publication({ Key? key, required this.item }) : super(key: key);

  @override
  State<publication> createState() => _publicationState();
}

class _publicationState extends State<publication> {

  Controller controller = Get.put(Controller());
  bool flag = true;
  int line = 15;
  bool _Visibility= true;
  
  // Future<bool> onLikeButtonTapped(bool isLiked) async{
  //     var addlikes = widget.item.likes! + 1;
  //                             Map likes = {
  //                               "id": widget.item.id.toString(),
  //                               "likes": addlikes.toString()

  //                             };
                              
  //        controller.postLikes(likes);
  //   /// send your request here
  //    final bool success= await sendRequest();

  //   /// if failed, you can do nothing
  //   // return success? !isLiked:isLiked;

  //   return !isLiked;
  // }

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
                        IconButton(onPressed: (){
                  //         Get.off(() => commentPage(),
                  // transition: Transition.downToUp, duration: milliseconds());
                        }, icon: Icon(Icons.comment),),
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
                      margin: allH(50),
                      child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
            LikeButton(
              
          size: 30,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.star,
              color: isLiked ? pink : grey,
              size: 30,
            );
          },
          likeCount: widget.item.likes,
          countBuilder: (int? count, bool isLiked, String text) {
            var color = isLiked ? Colors.black : Colors.black;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
        ),
                        
                        // GestureDetector(
                        //     onTap: (){
                        //            setState(() {
                        //         _Visibility = false;
                        //       });
                        //     },
                        //  child: _Visibility? 
                        //    IconButton(onPressed: (){
                             
                        //       // var addlikes = widget.item.likes! + 1;
                        //       // Map likes = {
                        //       //   "id": widget.item.id.toString(),
                        //       //   "likes": addlikes.toString()

                        //       // };
                              
                        //       // controller.postLikes(likes);
                        //       // Navigator.pop(context);
                              
                        //     },
                        //     icon:Icon(Icons.star_border_outlined, color: pink,size: 30,))
                        //     : IconButton(onPressed: (){
                        //       //   var retirelikes = widget.item.likes! - 1;
                        //       //       Map likes = {
                        //       //   "id": widget.item.id.toString(),
                        //       //   "likes": retirelikes.toString()

                        //       // };
                              
                        //       // controller.postLikes(likes);
                        //       // Navigator.pop(context);
                        //     }, 
                        //   icon:Icon(Icons.star_rate, color: Colors.redAccent,size: 30,)),
                        //   ),
                        // Text(widget.item.likes!.toString()),  
                                             
                        Spacer(),
                       IconButton(onPressed: (){
                          Get.to(() => CommentPage(comment_by: widget.item.name.toString(), story_id: widget.item.id.toString(),),
                  transition: Transition.downToUp, duration: milliseconds());
                        }, icon: Icon(Icons.comment,  color: pink,size: 30,),),
                        Text(widget.item.vues!.toString()),
                        // Spacer(),
                        // Icon(Icons.share, color: pink,size: 30,),
                        // Text(widget.item.vues!.toString()),

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