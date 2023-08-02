import 'package:app_hifadhu/controllers/loginController.dart';
import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:app_hifadhu/views/loginVerified_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/fonction.dart';
import '../customs/dialogues.dart';
import 'homescreen.dart';


class LoginPage extends StatefulWidget {

 
   LoginPage({ Key? key, }) : super(key: key);
 

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _phone = "";
  String _number = "";
  String completPhone = "";

  loginController login = Get.put(loginController());

 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ClipOval(
                       
                      child: Container(
                          width: 150,
                          height: 150,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppIcon, 
                          )),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Appli'Hifadhu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "main",
                        letterSpacing: 4),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Oser briser le silence",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(0, 1),
                                blurRadius: 1,
                                color: Colors.black.withOpacity(0.6)),
                          ]),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      height: 250,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10, left: 16, right: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 20,
                                offset: Offset(2, 12),
                                color: Colors.black.withOpacity(0.08))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'Inscrivez-vous',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                          Container(
                            height: 56,
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2.5,
                                      blurRadius: 20,
                                      offset: Offset(2, 8),
                                      color: Colors.black.withOpacity(0.1))
                                ]),
                            child: IntlPhoneField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0XFFF1F1F5),
                                  filled: true,
                                  counterText: '',
                                  hintText: 'Téléphone'),
                              initialCountryCode: 'KM',
                              maxLength: 7,
                              onChanged: (phone) {
                                setState(() {
                                  _phone = phone.countryCode;
                                  _number = phone.number;
                                  completPhone = phone.completeNumber;
                                });
                              },
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Map data = {
                                  "phoneNumber": completPhone,
                                };
                                if (isValidPhone(_phone, _number)) {
                                        Get.offAll(() => 
                                 LoginVerifed(numero: completPhone,));
                                //   login.postlogin(data).then((response) {
                                //     if(response!["hasError"]){
                                //      Get.offAll(() => 
                                //  LoginVerifed(numero: completPhone,));
                                //     }else{
                                //       login.getLoginInfo(data);
                                //        Get.offAll(() => 
                                //         Homepage());
                                //     }


                                //   });

                                
                                } else {
                                  showErrorDialog(
                                      "Votre numéro n'est pas valide",
                                      context,
                                      () => {});
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      height: 45,
                                      width: 200,
                                      margin: EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          gradient: blueGradient(),
                                          boxShadow: [shadow(blue)],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text('Suivant',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                ],
                              ))
                        ],
                      )),
                  SizedBox(height: 20),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'En cliquant sur suivant, vous acceptez ',
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    child: Text(
                      'Nos conditions d\'utilisations',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ])));
  }
}