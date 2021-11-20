// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../database/firestoreService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirestoreService _db = FirestoreService();
  @override
  Widget build(BuildContext context) {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      width: width * 0.5,
                      margin:
                          EdgeInsets.only(left: width * 0.1, top: height * 0.1),
                      duration: Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Bienvenue Docteur ',
                          style: TextStyle(
                              fontSize: height * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff454545)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          margin: EdgeInsets.only(left: width * 0.05),
                          duration: Duration(milliseconds: 1500),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.06,
                              ),
                              Text(
                                'C',
                                style: TextStyle(
                                    fontSize: height * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4D2663)),
                              ),
                              Text(
                                'H',
                                style: TextStyle(
                                    fontSize: height * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4D2663)),
                              ),
                              Text(
                                'U',
                                style: TextStyle(
                                    fontSize: height * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4D2663)),
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                'L G B T Q +',
                                style: TextStyle(
                                    fontSize: height * 0.015,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4D2663)),
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                            margin: EdgeInsets.only(top: height * 0.05),
                            duration: Duration(milliseconds: 1000),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image(
                                  width: width * 0.78,
                                  image: AssetImage(
                                      "assets/images/doctor_welcome.png")),
                            )),
                      ],
                    ),
                    Align(
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
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: height * 0.15),
                            child: Text(
                                "Aucun Droit is preserved XD \n fuck off if you dont like it",
                                style: TextStyle(
                                    color: Color(0xff454545),
                                    fontSize: height * 0.019))))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
