import 'package:app_hifadhu/customs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget{
  final String? btnText;
 const SmallButton({this.btnText});
  @override
  Widget build(BuildContext context) { 
    return Container(
                         height: 25,
                         //width: 100,
                         decoration: BoxDecoration(
                           
                           border: Border.all(
                             color: blue,
                           ),
                           borderRadius: BorderRadius.circular(10),
                            boxShadow:  [
                         BoxShadow(
                           blurRadius: 5.0,
                           offset: Offset(2,4),
                           color: transparent
                         )]
                         ),
                         child:  Center(child: 
                         Text("$btnText", 
                         style: TextStyle(color: blue,fontSize: 16),)
      
                         ),
                       );
  }
  
}