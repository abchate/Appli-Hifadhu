// ignore: file_names
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:app_hifadhu/customs/custom.dart';
import 'package:app_hifadhu/views/introductionscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../customs/image_url.dart';
import 'homescreen.dart';

enum Status { Waiting, Error }
class LoginVerifed extends StatefulWidget {
  final String numero;

   LoginVerifed({ Key? key, required this.numero,}):super(key: key );

  @override
  State<LoginVerifed> createState() => _LoginVerifedState(numero);
}

class _LoginVerifedState extends State<LoginVerifed> {
 final phoneNumber;
  var _status = Status.Waiting;
  var _verificationId;
  var _textEditingController = TextEditingController();
   FirebaseAuth _auth = FirebaseAuth.instance;
  _LoginVerifedState(this.phoneNumber);


    @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  Future _verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phonesAuthCredentials) async {},
        verificationFailed: (verificationFailed) async {},
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            this._verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

   Future _sendCodeToFirebase({String? code}) async {
    if (this._verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code!);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
           Get.offAll(()=> Homepage());
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            setState(() {
              _textEditingController.text = "";
              this._status = Status.Error;
            });
          });
    }
  }


  @override
  Widget build(BuildContext context) {
    var store = GetStorage();
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
                  SizedBox(height: 20),
               Container(
                    margin: EdgeInsets.only(top: 40),
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
                   
                      height: 300,
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
                      child: _status != Status.Error
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Vérification',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Entrez le code de confirmation que vous avez reçu au numéro  ${this.widget.numero}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )),
                          SizedBox(height: 10),
                          Container(
                            height: 55,
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2.5,
                                      blurRadius: 20,
                                      offset: Offset(2, 8),
                                      color: Colors.black.withOpacity(0.1))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _textEditingController,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(letterSpacing: 25, fontSize: 20),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        hintText: 'Code',
                                        counterText: ''),
                                    maxLength: 6,
                                    keyboardType: TextInputType.number,

                                                    onChanged: (value) async {
                                      print(value);
                                      if (value.length == 6) {
                                        //perform the auth verification
                                        _sendCodeToFirebase(code: value);
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Avez vous reçu le code?"),
                              TextButton(onPressed: () {
                                  setState(() {
                            this._status = Status.Waiting;
                          });
                          _verifyPhoneNumber();
                              }, 
                              child: Text("Renvoyer le code" , style: TextStyle(color: red))
                              )

                            ]
                          ),
                          // SizedBox(height: 10),
                          // GestureDetector(
                          //      onTap: () {
                          //     Get.offAll(() => true == store.read("intro_seen")
                          //                           ? const Homepage()
                          //                           : const IntroPage(),  
                          //                   );
                          //     },
                          //     child: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.end,
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         Container(
                          //             height: 45,
                          //             width: 200,
                          //             margin: EdgeInsets.only(right: 20),
                          //             decoration: BoxDecoration(
                          //                 color: Colors.purpleAccent,
                          //                 gradient: blueGradient(),
                          //                 boxShadow: [shadow(blue)],
                          //                 borderRadius:
                          //                     BorderRadius.circular(10)),
                          //             child: Center(
                          //                 child: Text('Suivant',
                          //                     textAlign: TextAlign.center,
                          //                     style: TextStyle(
                          //                         fontSize: 20,
                          //                         color: Colors.white,
                          //                         fontWeight:
                          //                             FontWeight.bold)))),
                          //       ],
                          //     ))
                        ],
                      )
                      : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("OTP Verification",
                      style: TextStyle(
                          color: Color(0xFF08C187).withOpacity(0.7),
                          fontSize: 30)),
                ),
                Text("The code used is invalid!"),
                TextButton(
                    child: Text("Edit Number"),
                    onPressed: () => Navigator.pop(context)),
                TextButton(
                    child: Text("Resend Code"),
                    onPressed: () async {
                      setState(() {
                        this._status = Status.Waiting;
                      });

                      _verifyPhoneNumber();
                    }),
              ],
            ),
                      ),
                     
                ])
                )
                );
  }
}