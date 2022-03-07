// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intern/Widgets/Patient-Day-Widgets.dart';
import 'package:intern/constants.dart';
import 'package:intern/modals/Gynecologie_Patient.dart';
import 'package:intern/screens/Components/Patient_Day.dart';
import 'package:intern/screens/Components/Patient_Informations.dart';
import 'package:intern/screens/Components/Patient_New_Hospitalisation.dart';
import 'package:intern/screens/Gynecologie/Gynecologie_Patient_Record.dart';
import 'package:intern/screens/Gynecologie/Gynecologie_Add_ConstantesVitales.dart';
import 'package:intern/screens/List_Patients.dart';
import '../Components.dart';

class Patient_Details extends StatefulWidget {
  Patient_Details({Key? key, required this.patient, required this.service})
      : super(key: key);
  final dynamic patient;
  final String service;
  @override
  State<Patient_Details> createState() => _Patient_DetailsState();
}

Constants _constants = Constants();

class _Patient_DetailsState extends State<Patient_Details> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String patient = '${widget.patient["nom"]} ${widget.patient["prenom"]}';
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> screen = [
      Gynecologie_Patient_Record(
        patient: widget.patient,
        doctor: user!.email!,
      ),
      Gynecologie_Patient_Informations(
        patient: widget.patient,
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          PatientHeader(
            height: height,
            width: width,
            service: widget.service,
            patient: widget.patient,
          ),
          screen[currentIndex],
        ],
      )),
      bottomNavigationBar: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20),
        // width: width * 0.1,
        color: Colors.transparent,
        height: height * .065,
        child: Center(
          child: Container(
            width: width * 0.5,
            height: height * 0.09,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.4),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * .024),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(
                      () {
                        currentIndex = index;
                      },
                    );
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          bottom: index == currentIndex ? 0 : width * .027,
                          right: width * .0422,
                          left: width * .0422,
                        ),
                        width: width * .128,
                        height: index == currentIndex ? width * .014 : 0,
                        decoration: BoxDecoration(
                          color: widget.service == "gyneco"
                              ? constants.gynecoColor
                              : Colors.blueAccent,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          ),
                        ),
                      ),
                      ImageIcon(
                        listOfIcons[index],
                        size: width * .076,
                        color: index == currentIndex
                            ? widget.service == "gyneco"
                                ? constants.gynecoColor
                                : Colors.blueAccent
                            : Colors.black38,
                      ),
                      SizedBox(height: height * .006),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        /* */
      ),
    );
  }
}

List<ImageProvider> listOfIcons = [
  AssetImage("assets/icons/record.png"),
  AssetImage("assets/icons/id-card.png"),
];
