// ignore_for_file: non_constant_identifier_names, file_names

import 'package:animate_do/animate_do.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/controllers/dataController.dart';
import 'package:app_hifadhu/views/history.dart';
import 'package:app_hifadhu/views/publication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../customs/image_url.dart';

Widget BuildSlideInfo(data) {
  Controller controller = Get.put(Controller());
  return SizedBox(
    height: 200, 
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children:[
         SizedBox(
          
          height: 200, 
          child: ListView.builder(
            shrinkWrap: true,
            physics: bounce,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var item = data[index];
              var vues = item.vues + 1;
              return GestureDetector(
                onTap: () {
                 
                  Map views = {
                    "id": item.id.toString(),
                    "vues": vues.toString()

                  };
                  
                  controller.postVues(views);
                    
                Get.to(() => publication(item: data[index],),
                transition: Transition.downToUp, duration: milliseconds());
                  
                
        
                },
                child: SlideInLeft(
                  duration: milliseconds(),
                  delay: milliseconds(value: index * 200),
                  child: Container(
                    width: 280,
                    height: MediaQuery.of(context).size.height,
                    margin: symetric(h: 5, v: 10),
                    padding: all(value: 2),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: raduis(10),
                        gradient: mapGradients[cyan],
                        boxShadow: [shadow(cyan)]),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        SizedBox(
                            width: width,
                            height: MediaQuery.of(context).size.height,
                            child: ClipRRect(
                              borderRadius: raduis(10),
                              child: Image.asset(
                                ImageTwo,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                            width: width,
                            padding: all(value: 5),
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                gradient: containerGradient(),
                                borderRadius: raduis(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.type,
                                  style: const TextStyle(
                                      color: white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Container(
                                  width: 80,
                                  padding: symetric(h: 10, v: 4),
                                  decoration: BoxDecoration(
                                      color: mapColors[cyan], borderRadius: raduis(50)),
                                  child: Row(
                                    
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: white
                                      ),
                                      Spacer(),
                                      Text(
                                         item.vues.toString(),
                                       
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                    Expanded(
                                      child: Container(
                                        width: 150,
                                        padding: symetric(h: 10, v: 4),
                                        decoration: BoxDecoration(
                                            color: white, borderRadius: raduis(50)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: cyan,
                                              size: 12,
                                            ),
                                            Text(
                                              item.created,
                                              style: TextStyle(
                                                  color: cyan,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 3,
          )),
          Container(
          width: 100,
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
          // gradient: redGradient(),
          borderRadius: raduis(10),
          color: Colors.black.withOpacity(0.2)
          // boxShadow: [shadow(red)]
          ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Get.off(() => History(),
                    transition: Transition.upToDown, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_circle_right_rounded,size: 50, color:pink,)),
             SizedBox(height: 10,),
             Text("Lire plus", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              ),
          ),] ),
  );
}
