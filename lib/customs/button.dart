import 'package:app_hifadhu/customs/custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(String txt, Color color, Gradient gradient){
  return  Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 45,
                                      width: 80,
                                      margin: all(value: 10),
                                      decoration: BoxDecoration(
                                          color: color,
                                          gradient: gradient,
                                          boxShadow: [shadow(color)],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(txt,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                ],
                              );
}