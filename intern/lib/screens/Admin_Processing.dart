import 'package:flutter/material.dart';
import 'package:intern/screens/List_Patients.dart';

import '../Components.dart';

class Admin_Processing extends StatefulWidget {
  Admin_Processing({Key? key}) : super(key: key);

  @override
  State<Admin_Processing> createState() => _Admin_ProcessingState();
}

class _Admin_ProcessingState extends State<Admin_Processing> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
      children: [
        Container(
          height: height,
          child: Stack(
            children: [
              ClipPath(
                clipper: OuterClippedPart(),
                child: Container(
                  color: Color(0xff48acf0),
                  width: width,
                  height: height,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image(
                  image: AssetImage("assets/images/processing-admin.png"),
                  height: height * 0.8,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                left: 0,
                top: height * 0.2,
                child: Container(
                  margin: EdgeInsets.only(left: width * 0.03),
                  width: width * 0.9,
                  child: Text(
                    "Veuillez attendre la vérification de votre Profil",
                    style: TextStyle(
                      fontSize: height * 0.025,
                      color: constants.InputIconColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
