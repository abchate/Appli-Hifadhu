import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget card( String img, String name, IconData icon, Widget page) {

  return  GestureDetector(
    onTap: (){
      Get.to(() => page);
    },
    child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                   boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color: Colors.black
                                  )
                                ]
                ),
                height: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                    
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/$img", fit: BoxFit.cover)
                      )
                    ),
                      Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                    height: 120 ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
  
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Colors.lightBlue.withOpacity(0.7),
                              Colors.transparent
                            ]
                        )
  
  
  
                    )
                ),
  
  
              ),
                     Positioned(
                top:0,
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child:Row(
                    children: [
                      ClipOval(
                          child:Container(
                            
                            padding: EdgeInsets.all(10),
                            child: Icon(icon, size: 30, color: Colors.red,),
  
  
                          )
                      ),
                      SizedBox(width: 10),
                      Text("$name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20, fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              )
                  ],
                  
                ),
              ),
  );
}