import 'package:app_hifadhu/controllers/infoController.dart';
import 'package:app_hifadhu/views/components/build_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SlideInfosController.dart';
import '../customs/custom.dart';
import '../customs/image_url.dart';
import '../controllers/dataController.dart';
import 'components/home/BuildSliderInfo.dart';
import 'components/home/Empty.dart';
import 'components/home/Loading.dart';
import 'homescreen.dart';

class History extends StatefulWidget {
  const History({ Key? key }) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
   infoController controller = Get.put(infoController());
  final List<String> images = [
    AppIcon,
    ImageOne,
    ImageTwo,
    ImageTree,
  ];
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        leadingWidth: 70,
        backgroundColor: Colors.white,
        leading:  Container(
          
            margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
          gradient: redGradient(),
          borderRadius: raduis(10),
          boxShadow: [shadow(red)]),
              child: Center(
                child: IconButton(onPressed: (){
                  Get.off(() => Homepage(),
                  transition: Transition.upToDown, duration: milliseconds());

            },
             icon: Icon(Icons.arrow_back,size: 30, color: Color.fromARGB(255, 13, 3, 156),)),
              ),
          ),
        title: Text("Osez briser le silence !!!" ,style: TextStyle(color: blue ),),
        centerTitle: true,
      ),
      body:  FutureBuilder(
                future: controller.fetchStories(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return chargementverticale();

                  }if (snapshot.hasError) {
                          return Center(child: Text('Something went wrong '));
                  } else {
                    data = snapshot.data;
                     if (data == "null") {
                      return Empty();
                      } else {
                      return BuildHistory(data);
                    }
                  }
                }),
      
    );
  }
}