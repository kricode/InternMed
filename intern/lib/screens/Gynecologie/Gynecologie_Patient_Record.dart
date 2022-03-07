import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intern/Components.dart';
import 'package:intern/modals/Gynecologie_Patient.dart';
import 'package:intern/screens/Components/Anciens_Historiques.dart';
import 'package:intern/screens/Gynecologie/Gynecologie_Add_ConstantesVitales.dart';
import 'package:intern/screens/Chirurgie_Thoracique/Chirurgie_Thoracique_Historique_Constantes.dart';
import 'package:intern/screens/List_Patients.dart';

class Gynecologie_Patient_Record extends StatefulWidget {
  Gynecologie_Patient_Record(
      {Key? key, required this.patient, required this.doctor})
      : super(key: key);
  final dynamic patient;
  final String doctor;
  @override
  State<Gynecologie_Patient_Record> createState() =>
      _Gynecologie_Patient_RecordState();
}

class _Gynecologie_Patient_RecordState
    extends State<Gynecologie_Patient_Record> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    Gynecologie_Patient patient_gyneco =
        Gynecologie_Patient.fromFirestore(widget.patient);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: height * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(Gynecologie_Add_ConstantesVitales(
                    medecin: widget.doctor,
                    patient: patient_gyneco,
                    service: "Gynecologie",
                    hospitalisation: 2));
              },
              child: Container(
                height: height * 0.11,
                width: width,
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.125, vertical: height * 0.07),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0.2,
                      blurRadius: 10,
                    ),
                  ],
                  color: constants.gynecoColor,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: width * 0.05),
                      Text(
                        '+',
                        style: TextStyle(
                          fontSize: height * 0.05,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        'Ajoutez des données',
                        style: TextStyle(
                            fontSize: height * 0.022, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card_Icon(
                    important: true,
                    colorBackground: constants.secondaryColor,
                    width: width,
                    screen: Gynecologie_Historique_Courrant(
                      patiente: widget.patient,
                    ),
                    imagePath: "assets/icons/record-check.png",
                    title: "Historique\ncourrant",
                    height: height),
                Card_Icon(
                    important: false,
                    colorBackground: constants.secondaryColor,
                    width: width,
                    screen: Anciens_Historiques(),
                    imagePath: "assets/icons/past.png",
                    title: "Anciens\nHistoriques",
                    height: height),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
