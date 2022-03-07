import 'package:flutter/material.dart';
import 'package:intern/screens/Chirurgie_Thoracique/Chirurgie_Thoracique_Historique_Constantes.dart';
import 'package:intern/screens/List_Patients.dart';
import '../../Components.dart';

class Patient_Informations extends StatefulWidget {
  Patient_Informations({Key? key}) : super(key: key);

  @override
  State<Patient_Informations> createState() => _Patient_InformationsState();
}

List<String> habitudes = [
  'randonnées',
  "Sport",
  "jeux d'echecs",
  "chasse",
  'randonnées',
];
List<String> toxiques = [
  'chicha',
  "zetla",
  "chemma",
];

class _Patient_InformationsState extends State<Patient_Informations> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 1500),
      width: width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ImageIcon(
                    AssetImage("assets/icons/door.png"),
                    size: height * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Text(
                      "09",
                      style: TextStyle(
                          fontSize: height * 0.018,
                          color: constants.InputIconColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          BigTextWidget(
              width: width,
              height: height,
              text: "Informations Générales",
              fontsize: height * 0.02),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, top: height * 0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageIcon(AssetImage("assets/icons/location.png"),
                        size: height * 0.02, color: constants.secondaryColor),
                    SizedBox(
                      width: width * 0.06,
                    ),
                    Container(
                      width: width * 0.75,
                      margin: EdgeInsets.only(right: width * 0.02),
                      child: Text(
                        "Sidi Ali Moussa Souk El Tenine, Maatkas Tizi Ouzou",
                        style: TextStyle(fontSize: height * 0.018),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageIcon(AssetImage("assets/icons/portfolio.png"),
                        size: height * 0.02, color: constants.secondaryColor),
                    SizedBox(
                      width: width * 0.06,
                    ),
                    Container(
                      width: width * 0.75,
                      margin: EdgeInsets.only(right: width * 0.02),
                      child: Text(
                        "Chomeur Professionnel",
                        style: TextStyle(fontSize: height * 0.018),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: BigTextWidget(
                width: width,
                height: height,
                text: "Habitudes Du Patient",
                fontsize: height * 0.02),
          ),
          WrapChips(
            width: width,
            list: habitudes,
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.01),
            child: BigTextWidget(
                width: width,
                height: height,
                text: "Liste Des Toxiques",
                fontsize: height * 0.02),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, top: height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PointWithText(
                  height: height,
                  width: width,
                  lightText: "Fumeur Depuis ",
                  boldText: '20 ans - 34 paquets par année',
                ),
                WrapChips(width: width, list: toxiques)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: BigTextWidget(
                width: width,
                height: height,
                text: "Antécédants Medicamentaux",
                fontsize: height * 0.02),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, bottom: height * 0.01),
            child: PointWithText(
              height: height,
              width: width,
              lightText: "Dernière séance de chimiothérapie: ",
              boldText: '13-07-2020',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: BigTextWidget(
                width: width,
                height: height,
                text: "Antécédants Chirurgicaux",
                fontsize: height * 0.02),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, bottom: height * 0.01),
            child: Antecedant_Chirurgical(
                height: height,
                width: width,
                lightText:
                    "la descriptions de la chirurgie,lfkjsdlfkjldsjkfklsdjf",
                boldText: "20-02-1998"),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, bottom: height * 0.01),
            child: Antecedant_Chirurgical(
                height: height,
                width: width,
                lightText:
                    "la descriptions de la chirurgie,lfkjsdlfkjldsjkfklsdjf",
                boldText: "20-02-1998"),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, bottom: height * 0.01),
            child: Antecedant_Chirurgical(
                height: height,
                width: width,
                lightText:
                    "la descriptions de la chirurgie,lfkjsdlfkjldsjkfklsdjf",
                boldText: "20-02-1998"),
          )
        ],
      ),
    ));
  }
}
