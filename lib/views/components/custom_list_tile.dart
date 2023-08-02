import 'dart:io';

import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget{
  final IconData? icon;
  final String? text;

  const CustomListtile({this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    EdgeInsets.symmetric(vertical: 10.8),

    child: Row(
      
      children: [
        Icon(
          icon,
          color: Colors.red,
        ),
        SizedBox(width: 15,),
        Text(
          "$text",
          style: TextStyle(fontSize: 16),
        )
      ],

    ),
    );
  }
  
}