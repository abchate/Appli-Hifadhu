import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var storage = GetStorage();

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  var isValide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
          pages: pages,
          showBullets: true,
          skipCallback: () {
            setState(() {
              storage.write("intro_seen", isValide);
            });
            Get.off(() => const Homepage());
          },
          finishCallback: () {
            setState(() {
              storage.write("intro_seen", isValide);
              print("valide");
            });
            Get.off(() => const Homepage());
          },
          skipText: "Ignorer",
          nextText: "Suivant",
          finishText: "Commencer"),
    );
  }

  final pages = [
    PageModel(
        color: blue,
        imageAssetPath: ImageContact,
        title: "Appli' Hifadhu",
        body:
            "Une application d'information et sensibilisation sur les violences basées sur le genre",
        doAnimateImage: true),
    PageModel(
        color: red,
        imageAssetPath: Shake,
        title: 'Pour quel but ?',
        body:
            "A travers cette application nous souhaitons faire connaitre aux victimes les étapes à suivre pour une prise en charge efficace par les services dédiés à cet effet",
        doAnimateImage: true),
    PageModel(
        color: cyan,
        imageAssetPath: ImageCard,
        title: 'Oser briser le silence',
        body: "Face aux violence, tu n'es pas seul(e) !",
        doAnimateImage: true),
  ];
}
