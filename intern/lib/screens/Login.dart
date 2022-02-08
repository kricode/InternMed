// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intern/Widgets/Clipper.dart';
import 'package:intern/constants.dart';
import '../database/firestoreService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirestoreService _db = FirestoreService();
  @override
  Widget build(BuildContext context) {
    Constants _constants = Constants();
    setState(() {});
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OuterClippedPart(),
                  child: Container(
                    color: Color(0xff48acf0),
                    width: width,
                    height: height,
                  ),
                ),
                //
                ClipPath(
                    clipper: InnerClippedPart(),
                    child: Container(
                      color: Color(0xFF4D2663),
                      width: width,
                      height: height,
                    )),
                ClipPath(
                  clipper: InnerDown(),
                  child: Container(
                    color: Color(0xff48acf0),
                    width: width,
                    height: height,
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  height: height,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        margin: EdgeInsets.only(
                            left: width * 0.05, top: height * 0.15),
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Container(
                          margin: EdgeInsets.only(left: width * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'M E D ',
                                    style: TextStyle(
                                        fontSize: height * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: _constants.primaryColor),
                                  ),
                                  Text(
                                    'Intern ',
                                    style: TextStyle(
                                        fontSize: height * 0.05,
                                        fontWeight: FontWeight.w300,
                                        color: _constants.secondaryColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Text(
                          "Les dossiers medicaux de vos patients et patientes sont accessibles  à tout moment",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _constants.hintColor),
                        ),
                      ),
                      AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image(
                              fit: BoxFit.contain,
                              width: width,
                              image: AssetImage(
                                  "assets/images/doctor_welcome.png"),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05, vertical: height * 0.02),
                        child: InkWell(
                          onTap: () {
                            print('signin');
                          },
                          child: Ink(
                            color: Colors.white60,
                            child: Container(
                              height: height * 0.077,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  color: _constants.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  )),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.2,
                                    ),
                                    Image(
                                      width: width * 0.09,
                                      image:
                                          AssetImage("assets/icons/google.png"),
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Text(
                                      'Se Connecter',
                                      style: TextStyle(
                                          fontSize: height * 0.02,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05,
                        ),
                        child: Container(
                          height: height * 0.077,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: _constants.secondaryColor, width: 2),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              )),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.2,
                                ),
                                Image(
                                  width: width * 0.09,
                                  image: AssetImage("assets/icons/signup.png"),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Text(
                                  'Créer un compte',
                                  style: TextStyle(
                                      fontSize: height * 0.02,
                                      color: _constants.secondaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /*  Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            AnimatedContainer(
                              margin: EdgeInsets.only(
                                  top: height * 0.1, left: width * 0.2),
                              decoration: BoxDecoration(
                                  color: Color(0xFF4D2663),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              duration: Duration(milliseconds: 1500),
                              child: GestureDetector(
                                onTap: () {
                                  print("gmail Pressed");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image(
                                    width: width * 0.1,
                                    image: AssetImage("assets/icons/google.png"),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: height * 0.1, left: 20),
                              child: Text("Veuillez Vous Connecter",
                                  style: TextStyle(
                                      color: Color(0xFF4D2663),
                                      fontSize: height * 0.02)),
                            )
                          ],
                        ),
                      ),*/
                      /* Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: EdgeInsets.only(top: height * 0.15),
                              child: Text(
                                  "Aucun Droit is preserved XD \n fuck off if you dont like it",
                                  style: TextStyle(
                                      color: Color(0xff454545),
                                      fontSize: height * 0.019))))*/
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(
                              right: width * 0.07, bottom: height * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: height * 0.02),
                                child: Text(
                                  "MED Intern 2022. Tout Droits Résérvés.",
                                  style: TextStyle(
                                      color: _constants.primaryColor,
                                      fontSize: height * 0.015),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
