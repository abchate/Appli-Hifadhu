import 'package:app_hifadhu/views/accueil.dart';
import 'package:app_hifadhu/views/homescreen.dart';
import 'package:app_hifadhu/views/introductionscreen.dart';
import 'package:app_hifadhu/views/login.dart';
import 'package:app_hifadhu/views/phone_auth.dart';
import 'package:app_hifadhu/views/spashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

var storage = GetStorage();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Spashscreen(
        duration: 10,
        goToPage: true == storage.read("login")
            ? const Homepage()
            : LoginPage(),
      ),
    );
  }
}
