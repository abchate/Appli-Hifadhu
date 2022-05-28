
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/dataController.dart';

class Spashscreen extends StatefulWidget {
  int duration = 0;
  Widget goToPage;
   Spashscreen({ Key? key, required this.duration, required this.goToPage }) : super(key: key);

  @override
  State<Spashscreen> createState() => _SpashscreenState();
}

class _SpashscreenState extends State<Spashscreen> {
   final Controller controller = Get.put(Controller());
   @override
  void initState() {
    
   
   controller.getTypeViolences();
   controller.getBesoins();
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.widget.duration), (){
      Get.off(() => widget.goToPage);
      
    });
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 251, 252),
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.only(right:45, left: 45),
                    width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            
                            height: 100,
                            width: 300,
                            child: Image.asset(
                              'assets/hifadhu-1.png',
                            
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: LinearProgressIndicator(
                              backgroundColor: Color.fromARGB(255, 170, 3, 3),
                              color: Colors.white,
                              
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[

                      Container(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Spacer(),
                            Spacer(
                              flex: 4,
                            ),
                            Spacer(),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}