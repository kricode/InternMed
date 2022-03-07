import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intern/Components.dart';
import 'package:intern/modals/Gynecologie_Patient.dart';
import 'package:intern/modals/Gynecologie_Patient_Day.dart';
import 'package:intern/screens/List_Patients.dart';
import 'package:intl/intl.dart';

class Gynecologie_Historique_Courrant extends StatefulWidget {
  Gynecologie_Historique_Courrant({Key? key, required this.patiente})
      : super(key: key);
  final dynamic patiente;
  @override
  State<Gynecologie_Historique_Courrant> createState() =>
      _Gynecologie_Historique_CourrantState();
}

FirestoreService service = FirestoreService();

class _Gynecologie_Historique_CourrantState
    extends State<Gynecologie_Historique_Courrant> {
  ScrollController _scrollController = new ScrollController();

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
            constants: constants,
            width: width,
            height: height,
            title: '${widget.patiente['nom']} ${widget.patiente["prenom"]} ',
            imagePath: "assets/images/Services_Home/gynecologie-bleu.png"),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        width: width,
        //  height: height * 0.5,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.015),
                  child: Row(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                        width: width * 0.28,
                        child: Cell(
                          height: height,
                          width: width,
                          imagePath:
                              'assets/images/Constantes_Vitales/clock.png',
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
                        imagePath:
                            'assets/images/Constantes_Vitales/blood-pressure.png',
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
                        imagePath:
                            'assets/images/Constantes_Vitales/thermometer.png',
                      ),
                      Cell(
                        height: height,
                        width: width,
                        imagePath: 'assets/icons/patient-state.png',
                      ),
                      Cell(
                        height: height,
                        width: width,
                        imagePath:
                            'assets/images/Constantes_Vitales/uterine.png',
                      ),
                      Cell(
                        height: height,
                        width: width,
                        imagePath: 'assets/images/Constantes_Vitales/blood.png',
                      ),
                      Cell(
                        height: height,
                        width: width,
                        imagePath: 'assets/images/Constantes_Vitales/fetal.png',
                      ),
                      Cell(
                        height: height,
                        width: width,
                        imagePath:
                            'assets/images/Constantes_Vitales/liquide-amniotique.png',
                      ),
                      Cell(
                        height: height,
                        width: width,
                        imagePath:
                            'assets/images/Constantes_Vitales/elixir.png',
                      ),
                    ],
                  ),
                ),
                Container(
                    width: width * 1.65,
                    height: height * 0.5,
                    child: StreamBuilder(
                      stream: service.getStats_Gynecologie(
                          ' ${user!.displayName!} - ${user!.email}',
                          "Gynecologie",
                          1,
                          Gynecologie_Patient.fromFirestore(widget.patiente)),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(
                              color: constants.gynecoColor,
                            ),
                          );
                        return snapshot.data?.docs.length == 0
                            ? Center(
                                child: Text(
                                    'Data Length ${snapshot.data?.docs.length}'),
                              )
                            : MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context, index) {
                                      dynamic doc = snapshot.data.docs[index];
                                      return Container(
                                        color: index % 2 == 0
                                            ? constants.secondaryColor
                                                .withOpacity(0.1)
                                            : Colors.white,
                                        child: Row(
                                          children: [
                                            DateCell(
                                              motDuJour: doc["date"].toString(),
                                              height: height,
                                              width: width,
                                              date: (doc["date"] as Timestamp)
                                                  .toDate()
                                                  .toString()
                                                  .split(' ')[0],
                                              time: DateFormat.Hm().format(
                                                  (doc["date"] as Timestamp)
                                                      .toDate()),
                                            ),
                                            TextCell(
                                                height: height,
                                                width: width,
                                                text: doc["ta"].toString()),
                                            TextCell(
                                                height: height,
                                                width: width,
                                                text: doc["fc"].toString()),
                                            TextCell(
                                                height: height,
                                                width: width,
                                                text: doc["saox"].toString()),
                                            TextCell(
                                                height: height,
                                                width: width,
                                                text: doc["dextro"].toString()),
                                            TextCell(
                                                height: height,
                                                width: width,
                                                text: doc["fr"].toString()),
                                            TextCell(
                                                height: height,
                                                width: width,
                                                text: doc["t"].toString()),
                                            TextCell(
                                                height: height,
                                                width: width,
                                                text: doc["etat"].toString()),
                                            CheckCell(
                                                height: height,
                                                width: width,
                                                value:
                                                    doc["contration_uterine"]),
                                            CheckCell(
                                                height: height,
                                                width: width,
                                                value: doc["metrorragie"]),
                                            CheckCell(
                                                height: height,
                                                width: width,
                                                value: doc["maf"]),
                                            CheckCell(
                                                height: height,
                                                width: width,
                                                value: doc["la"]),
                                            CheckCell(
                                                height: height,
                                                width: width,
                                                value: doc["verdatre"]),
                                          ],
                                        ),
                                      );
                                    }),
                              );

                        /* MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                    itemBuilder: (context, index) {
                                  return getRecordItem(snapshot, height, width);
                                })

                                /*   ListView(
                                  
                                  shrinkWrap: true,
                                  children:
                                      getRecordItem(snapshot, height, width),
                                ),*/
                                );*/
                      },
                    )),
              ],
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
                TextStyle(fontSize: height * 0.02, color: constants.hintColor),
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
              itemCount: 6,
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
                          image: AssetImage(constanteList[index].image!),
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
  String? image;
  constante(this.nom, this.image);
}

List<constante> constanteList = [
  constante("ta", "assets/images/Constantes_Vitales/blood-pressure-gauge.png"),
  constante("fc", "assets/images/Constantes_Vitales/blood-pressure.png"),
  constante("saox", "assets/images/Constantes_Vitales/oxygen-saturation.png"),
  constante("dextro", "assets/images/Constantes_Vitales/sugar-blood-level.png"),
  constante("fr", "assets/images/Constantes_Vitales/respiratory-system.png"),
  constante("t", "assets/images/Constantes_Vitales/thermometer.png"),
  constante("Etat General", "assets/icons/record.png"),
  constante(
      "Contraction Utérine", "assets/images/Constantes_Vitales/uterine.png"),
  constante("Metrorragie", "assets/images/Constantes_Vitales/blood.png"),
  constante("Mouvements Actifs Foetaux",
      "assets/images/Constantes_Vitales/fetal.png"),
  constante("liquide Amniotiruqe",
      "assets/images/Constantes_Vitales/liquide-amniotique.png"),
  constante("Verdatre", "assets/images/Constantes_Vitales/elixir.png"),
];
