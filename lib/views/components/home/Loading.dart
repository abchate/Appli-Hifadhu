import 'package:app_hifadhu/customs/custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:shimmer/shimmer.dart';

Widget Loading() {
  return SizedBox(
    width: width,
    height: 200,
    child: Column(
      children: const [
        ListTileShimmer(
          
          height:150,
        ),
        ListTileShimmer(),
      ],
    ),
  );
}
Widget chargementverticale() {
  return SizedBox(
    
    width: width,
    child: Shimmer.fromColors(
      period: Duration(seconds: 2),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
         itemCount: 10,
         itemBuilder: (context, index) {
          return Card(
            
           elevation: 1.0,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
           ),
           child: Container(
             height: 100,
             width: 200,
           )
          );
          } )
        ),
  );
      }

Widget chargement() {
  return SizedBox(
    height: 200,
    
    child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
         itemCount: 3,
         itemBuilder: (context, index) {
          return Card(
            
           elevation: 1.0,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
           ),
           child: Container(
             height: 100,
             width: 255,
           )
          );
          } )
        ),
  );
      }
