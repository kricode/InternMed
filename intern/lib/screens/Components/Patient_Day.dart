import 'package:flutter/material.dart';

import 'package:intern/Components.dart';
import 'package:intern/screens/Components/Anciens_Historiques.dart';
import 'package:intern/screens/Chirurgie_Thoracique/Chirurgie_Thoracique_Historique_Constantes.dart';

class Patient_Day extends StatefulWidget {
  Patient_Day({Key? key}) : super(key: key);

  @override
  State<Patient_Day> createState() => _Patient_DayState();
}

Constants _constants = Constants();
DateTime jour = DateTime.now();
TextEditingController ta = TextEditingController();
TextEditingController fc = TextEditingController();
TextEditingController fr = TextEditingController();
TextEditingController saox = TextEditingController();
TextEditingController T = TextEditingController();
TextEditingController dextro = TextEditingController();
TextEditingController motDuJour = TextEditingController();
List<Vitale> listeConstantes = [
  Vitale(
      ta, 'Ta/TO', 'assets/images/Constantes_Vitales/blood-pressure-gauge.png'),
  Vitale(fc, 'Ta/TO', 'assets/images/Constantes_Vitales/blood-pressure.png'),
  Vitale(
      fr, 'Ta/TO', 'assets/images/Constantes_Vitales/respiratory-system.png'),
  Vitale(
      saox, 'Ta/TO', 'assets/images/Constantes_Vitales/oxygen-saturation.png'),
  Vitale(T, 'Ta/TO', 'assets/images/Constantes_Vitales/thermometer.png'),
  Vitale(dextro, 'Ta/TO',
      'assets/images/Constantes_Vitales/sugar-blood-level.png'),
];

class _Patient_DayState extends State<Patient_Day> {
  void initState() {
    print('hi ${listeConstantes.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: height * 0.005,
                left: width * 0.08,
                top: height * 0.015,
              ),
              child: Container(
                child: Text(
                  "6ème Jour",
                  style: TextStyle(
                    color: _constants.textColor,
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Contante_Vitale_Input(
                        width: width,
                        height: height,
                        controller: ta,
                        text: Text("Mm hg"),
                        imagePath:
                            'assets/images/Constantes_Vitales/blood-pressure-gauge.png'),
                    Contante_Vitale_Input(
                        width: width,
                        height: height,
                        controller: fc,
                        text: Text("Bat/min"),
                        imagePath:
                            'assets/images/Constantes_Vitales/blood-pressure.png')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Contante_Vitale_Input(
                        width: width,
                        height: height,
                        controller: fr,
                        text: Text('Cycle/min'),
                        imagePath:
                            'assets/images/Constantes_Vitales/respiratory-system.png'),
                    Contante_Vitale_Input(
                        width: width,
                        height: height,
                        controller: saox,
                        text: Text('%'),
                        imagePath:
                            'assets/images/Constantes_Vitales/oxygen-saturation.png')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Contante_Vitale_Input(
                        width: width,
                        height: height,
                        controller: dextro,
                        text: Text('G/L'),
                        imagePath:
                            'assets/images/Constantes_Vitales/sugar-blood-level.png'),
                    Contante_Vitale_Input(
                        width: width,
                        height: height,
                        controller: T,
                        text: Text("C°"),
                        imagePath:
                            'assets/images/Constantes_Vitales/thermometer.png'),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.01),
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0.2,
                              blurRadius: 10,
                            ),
                          ]),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: width * 0.7,
                              child: TextFormField(
                                validator: (val) {
                                  return val!.length > 3
                                      ? null
                                      : "Entrez le mot du jour";
                                },
                                controller: motDuJour,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff48acf0),
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Votre Mot Du Jour',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w600),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  focusColor: Color(0xff0962ff),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('ajouter');
                              },
                              child: Tooltip(
                                message:
                                    'Ajoutez Cette Journée à L\'historique',
                                child: Container(
                                  width: width * 0.15,
                                  child: Center(
                                      child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height * 0.03),
                                  )),
                                  decoration: BoxDecoration(
                                      color: _constants.secondaryColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          spreadRadius: 0.2,
                                          blurRadius: 10,
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card_Icon(
                          important: true,
                          colorBackground: _constants.secondaryColor,
                          width: width,
                          screen: Chirurgie_Thoracique_Historique_Constantes(),
                          imagePath: "assets/icons/record-check.png",
                          title: "Historique\ncourrant",
                          height: height),
                      Card_Icon(
                          important: false,
                          colorBackground: _constants.secondaryColor,
                          width: width,
                          screen: Anciens_Historiques(),
                          imagePath: "assets/icons/past.png",
                          title: "Anciens\nHistoriques",
                          height: height),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Vitale {
  TextEditingController controller;
  String unite;
  String imagePath;
  Vitale(this.controller, this.unite, this.imagePath);
}
