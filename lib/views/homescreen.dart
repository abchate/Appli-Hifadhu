// ignore_for_file: file_names


import 'package:app_hifadhu/controllers/infoController.dart';
import 'package:app_hifadhu/customs/colors.dart';
import 'package:app_hifadhu/models/loginInfo.dart';
import 'package:app_hifadhu/views/Profil_page.dart';
import 'package:app_hifadhu/views/accueil.dart';
import 'package:app_hifadhu/views/components/home/HomeAppBar.dart';
import 'package:app_hifadhu/views/components/home/HomeFab.dart';
import 'package:app_hifadhu/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../controllers/loginController.dart';
import '../customs/custom.dart';
import '../customs/image_url.dart';
import '../controllers/dataController.dart';

class Homepage extends StatefulWidget {
  loginInfo? info;
 Homepage({Key? key, this.info}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final infoController _controller = Get.put(infoController());
   final Controller controller = Get.put(Controller());
    final loginController infos = Get.put(loginController());



  final Store = new FlutterSecureStorage();
  var addby;

 Future readToken() async{
    try {
      var Storage = new FlutterSecureStorage();
      String? token = await Storage.read(key: 'token');
      this.Store.write(key: "addby", value: 'token');
      addby = Store.read(key: 'addby').toString();

   
     
     

      return token;
      
    } catch (e) {
      print(e);
    }
  }

  
  @override
  void initState() {
    _controller.checkAndRequestPermission();
   
    super.initState();
   infos.getnum();
  
  // readToken();
    
  }

  var pageList = <Widget>[const Accueil()];
  @override
  Widget build(BuildContext context) {
      var drawerHeader = UserAccountsDrawerHeader(
      accountName:
      FutureBuilder(
        future: readToken(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
           
            return CircularProgressIndicator();
          }else {
           
            var num = snapshot.data;

            return Text(num!.toString());

          }

           

        },),
        

       
      accountEmail: Text("Abchate Ali Ibrahim"),
      decoration: BoxDecoration (
        color:blue,

      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: white,
        child: Icon(Icons.account_circle_sharp, size: 70, color: Color.fromARGB(255, 2, 71, 128),),

      ),

    );
    final drawerItems = ListView(
        children: <Widget>[
          drawerHeader,
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Acceuil'),
            onTap: () {
              Navigator.pop(context);
            }


          ),
          ListTile(
              leading: const Icon(Icons.account_box_rounded),
            title: const Text('Profil'),
            onTap: (){
             
              controller.getTypeViolences();

            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text("Contactes d'urgence"),
            onTap: (){
              Navigator.pop(context);


            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('parametre'),
            onTap: (){
              Navigator.pop(context);


            },

          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('A propos'),
            onTap: (){
              Navigator.pop(context);


            },
          ),
         
          ListTile(
            
            leading: const Icon(Icons.logout),
            title: const Text('Déconnexion'),
            onTap: (){
             
              

            },


          )
        ]
    );
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      appBar:AppBar(
    leadingWidth: 150, 
    leading: GestureDetector(
        onTap: () {
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.openEndDrawer();
            }else{
              scaffoldKey.currentState!.openDrawer();
            }
          },
      child: Padding(
        padding: all(value: 5),
        child: Image.asset(
          MainImage,
          fit: BoxFit.contain,
          // color: Colors.white,
        ),
      ),
    ),
    actions: [IconButton(onPressed: () {
      Get.to(() => ProfilPage());
    }, icon: const Icon(Icons.account_circle_sharp, size: 30, color: Color.fromARGB(255, 14, 24, 168),))],
    backgroundColor: white,
    foregroundColor: white,
    elevation: 10,
  ),
      // drawer: Drawer(
      //   backgroundColor: white,
      //   child: drawerItems,
      // ) ,
      body: const Accueil(),
      floatingActionButton: HomeFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
