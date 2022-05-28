

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../customs/custom.dart';
import '../../../customs/image_url.dart';

Widget buildsilver() {
  var item;
  return  Container(
                width: 280,
               
                margin: symetric(h: 5, v: 10),
                padding: all(value: 2),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: raduis(10),
                    gradient: mapGradients[item.gradient],
                    boxShadow: [shadow(mapColors[item.gradient])]),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    SizedBox(
                        width: width,
                       
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
                       
                        decoration: BoxDecoration(
                            gradient: containerGradient(),
                            borderRadius: raduis(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.type_violence,
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
                                color: blue,
                                  // color: mapColors[item.gradient],
                                   borderRadius: raduis(50)),
                              child: Row(
                                
                                children: [
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: white
                                  ),
                                  Spacer(),
                                  Text(
                                    item.vue,
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            
                                Container(
                                  width: 140,
                                  padding: symetric(h: 10, v: 4),
                                  decoration: BoxDecoration(
                                      color: white, borderRadius: raduis(50)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: mapColors[item.gradient],
                                      ),
                                      Text(
                                        item.created,
                                        style: TextStyle(
                                            color: mapColors[item.gradient],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              );
}