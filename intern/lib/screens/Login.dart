// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intern/Components.dart';
import 'package:intern/Widgets/Clipper.dart';
import 'package:intern/constants.dart';
import 'package:intern/database/FirebaseAuth.dart';
import 'package:intern/screens/Doctor_Singup_Informations.dart';
import 'package:intern/screens/List_Patients.dart';
import 'package:intern/screens/Services_Screen.dart';
import '../database/firestoreService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirestoreService _db = FirestoreService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
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
                      isLoading
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.02),
                              child: Container(
                                  height: height * 0.077,
                                  width: width * 0.9,
                                  decoration: BoxDecoration(
                                      color: _constants.primaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6),
                                      )),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.02),
                              child: InkWell(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  FirebaseService service =
                                      new FirebaseService();
                                  try {
                                    User? user =
                                        await FirebaseService.signInWithGoogle(
                                            context: context);
                                    setState(() {
                                      if (user != null) {
                                        Get.offAll(() => Redirect());
                                      } else {
                                        showMessage("Connectez vous!");
                                      }
                                    });

                                    print(user!.email);
                                  } catch (e) {
                                    if (e is FirebaseAuthException) {
                                      showMessage(e.message!);
                                      print('signin');
                                    }
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
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
                                            image: AssetImage(
                                                "assets/icons/google.png"),
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
                        child: InkWell(
                          onTap: () {
                            Get.to(() => Doctor_Signup_Informations());
                          },
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
                                    image:
                                        AssetImage("assets/icons/signup.png"),
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
                      ),
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

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
