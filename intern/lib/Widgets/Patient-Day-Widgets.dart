import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/screens/Components/Patient_Edit.dart';
import 'package:intern/screens/Chirurgie_Thoracique/Chirurgie_Thoracique_Historique_Constantes.dart';
import 'package:intern/screens/List_Patients.dart';
import '../constants.dart';
import 'package:intern/Components.dart';

class Contante_Vitale_Input extends StatelessWidget {
  Contante_Vitale_Input({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.controller,
    this.color,
  }) : super(key: key);

  final double width;
  TextEditingController? controller = TextEditingController();
  final double height;
  final String imagePath;
  final Text text;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: height * 0.08,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4,
          // offset: Offset(5.0, .0)
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, left: width * 0.02),
                child: Image(
                  width: height * 0.05,
                  image: AssetImage(imagePath),
                ),
              ),
              Container(
                //margin: EdgeInsets.all(8),
                width: width * 0.23,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val!.length < 1 ? null : 'Vide!';
                      },
                      controller: controller,
                      style: TextStyle(
                          fontSize: height * 0.03,
                          color: color == null ? Color(0xff48acf0) : color,
                          fontWeight: FontWeight.w300),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: ""),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: text,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Card_Icon extends StatelessWidget {
  const Card_Icon(
      {Key? key,
      required this.width,
      required this.important,
      required this.imagePath,
      required this.title,
      required this.colorBackground,
      required this.height,
      required this.screen})
      : super(key: key);
  final String imagePath;
  final double width;
  final double height;
  final Color colorBackground;
  final String title;
  final bool important;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    bool tapped = false;
    return GestureDetector(
      onTap: () {
        Get.to(screen);
        print(tapped);
      },
      child: Container(
        height: height * 0.13,
        width: width * 0.3,
        decoration: BoxDecoration(
            color: important == true ? colorBackground : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: important == true
                ? null
                : Border.all(color: colorBackground, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0.2,
                blurRadius: 10,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Center(
                child: Image(
                  image: AssetImage(imagePath),
                  width: width * 0.1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(height * 0.005),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: important == true ? Colors.white : colorBackground,
                    fontSize: height * 0.015),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PatientHeader extends StatelessWidget {
  const PatientHeader({
    Key? key,
    required this.height,
    required this.width,
    this.service,
    required this.patient,
  }) : super(key: key);

  final double height;
  final double width;
  final dynamic patient;
  final String? service;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height * 0.27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        color: service == 'gyneco'
            ? constants.gynecoColor
            : constants.secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                      print("Arrow Clicked");
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white70,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {
                    Get.to(Patient_Edit());
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/woman.png')),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.6,
                        child: Text(
                          '${patient["nom"]} ${patient["prenom"]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.024,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        width: width * 0.5,
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage(
                                "assets/icons/femenine.png",
                              ),
                              size: width * 0.055,
                              color: Colors.white,
                            ),
                            Text(
                              '${patient["age_patiente"].toString()}',
                              style: TextStyle(
                                  fontSize: height * 0.022,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${patient["groupe_sanguin"]} ",
                        style: TextStyle(
                            fontSize: height * 0.022, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          )
        ],
      ),
    );
  }
}
