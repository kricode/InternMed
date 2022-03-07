import 'package:flutter/material.dart';
import 'package:intern/Widgets/ImportantWidgets.dart';
import 'package:intern/constants.dart';
import 'package:intern/modals/constantes_vitales.dart';

import 'package:intern/screens/Services_Screen.dart';
import 'package:intern/Components.dart';
import 'package:intl/intl.dart';

Constants _constants = Constants();

class Chirurgie_Thoracique_Historique_Constantes extends StatefulWidget {
  Chirurgie_Thoracique_Historique_Constantes({Key? key}) : super(key: key);

  @override
  State<Chirurgie_Thoracique_Historique_Constantes> createState() =>
      _Chirurgie_Thoracique_Historique_ConstantesState();
}

class _Chirurgie_Thoracique_Historique_ConstantesState
    extends State<Chirurgie_Thoracique_Historique_Constantes> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: EdgeInsets.only(
            top: height * 0.04,
            bottom: height * 0.03,
            left: width * 0.02,
            right: width * 0.02),
        child: ServiceHeader(
            constants: _constants,
            width: width,
            height: height,
            title: "Name Of Patient",
            imagePath: "assets/images/Services_Home/gynecologie-bleu.png"),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
        width: width,
        child: Row(
          children: [
            SizedBox(
              height: height * 0.1,
              width: width * 0.265,
              child: Cell(
                height: height,
                width: width,
                imagePath: 'assets/images/Constantes_Vitales/clock.png',
              ),
            ),
            Cell(
              height: height,
              width: width,
              imagePath:
                  'assets/images/Constantes_Vitales/blood-pressure-gauge.png',
            ),
            Cell(
              height: height,
              width: width,
              imagePath: 'assets/images/Constantes_Vitales/blood-pressure.png',
            ),
            Cell(
              height: height,
              width: width,
              imagePath:
                  'assets/images/Constantes_Vitales/oxygen-saturation.png',
            ),
            Cell(
              height: height,
              width: width,
              imagePath:
                  'assets/images/Constantes_Vitales/sugar-blood-level.png',
            ),
            Cell(
              height: height,
              width: width,
              imagePath:
                  'assets/images/Constantes_Vitales/respiratory-system.png',
            ),
            Cell(
              height: height,
              width: width,
              imagePath: 'assets/images/Constantes_Vitales/thermometer.png',
            ),
          ],
        ),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        width: width,
        height: height * 0.5,
        child: SingleChildScrollView(
            child: Container(
          width: width * 0.9,
          height: height * 0.7,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
                itemCount: listConstants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        color: index % 2 == 0
                            ? _constants.secondaryColor.withOpacity(0.1)
                            : Colors.white,
                        child: Row(
                          children: [
                            DateCell(
                              motDuJour: listConstants[index].motdujour,
                              height: height,
                              width: width,
                              date: listConstants[index]
                                  .date
                                  .toString()
                                  .split(' ')[0],
                              time: DateFormat.Hm()
                                  .format(listConstants[index].date),
                            ),
                            TextCell(
                                height: height,
                                width: width,
                                text: listConstants[index].ta.toString()),
                            TextCell(
                                height: height,
                                width: width,
                                text: listConstants[index].fc.toString()),
                            TextCell(
                                height: height,
                                width: width,
                                text: listConstants[index].saox.toString()),
                            TextCell(
                                height: height,
                                width: width,
                                text: listConstants[index].dextro.toString()),
                            TextCell(
                                height: height,
                                width: width,
                                text: listConstants[index].fr.toString()),
                            TextCell(
                                height: height,
                                width: width,
                                text: listConstants[index].t.toString()),
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        )),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          margin: EdgeInsets.only(left: width * 0.03, top: height * 0.02),
          duration: Duration(milliseconds: 1500),
          child: Text(
            'Afficher vos donnez sur des graphes:',
            style:
                TextStyle(fontSize: height * 0.02, color: _constants.hintColor),
          ),
        ),
      ),
      AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
        height: height * 0.1,
        duration: Duration(milliseconds: 1500),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: constanteList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Tooltip(
                    message: "Afficher le graphe ${constanteList[index].nom}",
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.015, vertical: height * 0.01),
                      width: width * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Image(
                          width: width * 0.08,
                          image: AssetImage(constanteList[index].image),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      )
    ])));
  }
}

class constante {
  String nom;
  String image;
  constante(this.nom, this.image);
}

List<constante> constanteList = [
  constante("ta", "assets/images/Constantes_Vitales/blood-pressure-gauge.png"),
  constante("fc", "assets/images/Constantes_Vitales/blood-pressure.png"),
  constante("saox", "assets/images/Constantes_Vitales/oxygen-saturation.png"),
  constante("dextro", "assets/images/Constantes_Vitales/sugar-blood-level.png"),
  constante("fr", "assets/images/Constantes_Vitales/respiratory-system.png"),
  constante("t", "assets/images/Constantes_Vitales/thermometer.png"),
];

List<ConstantesVitales> listConstants = [
  ConstantesVitales(
      DateTime.now(), "A", "mPatient Ye99ers akk", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "B", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
  ConstantesVitales(
      DateTime.now(), "patient id", "mot du jour", 12, 34, 12, 50, 36, 1.4),
];
