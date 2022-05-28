import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget grid(IconData icon, String titre, Widget page, Color color) {
  return GestureDetector(
    onTap: (() => Get.to(() =>page)),
    child: Container(
      margin: EdgeInsets.only(top: 20, right: 8, left: 8) ,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
                   BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.4)

                      )
                  
                ]
      ),
  
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 65,),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text("$titre", style: TextStyle(fontSize: 15),),
          )
        ],
      ),
  
    ),
  );
}