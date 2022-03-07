import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern/Components.dart';
import 'package:intern/screens/List_Patients.dart';

class Gynecologie_Patient_Informations extends StatefulWidget {
  Gynecologie_Patient_Informations({Key? key, required this.patient})
      : super(key: key);
  final dynamic patient;

  @override
  State<Gynecologie_Patient_Informations> createState() =>
      _Gynecologie_Patient_InformationsState();
}

class _Gynecologie_Patient_InformationsState
    extends State<Gynecologie_Patient_Informations> {
  List<String> allergies = ["allergie 1", "allergie 2"];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.only(top: height * 0.02),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  InformationWithImageWidget(
                    height: height,
                    width: width,
                    image: "assets/icons/location.png",
                    text: widget.patient["adresse"],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageIcon(AssetImage("assets/icons/sanitary-pad.png"),
                            size: height * 0.02,
                            color: constants.secondaryColor),
                        SizedBox(
                          width: width * 0.06,
                        ),
                        Container(
                            width: width * 0.75,
                            margin: EdgeInsets.only(right: width * 0.02),
                            child: RichText(
                              text: TextSpan(
                                  text: "Dernières régles:   ",
                                  style: TextStyle(
                                    fontSize: height * 0.018,
                                    color: constants.InputIconColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "${(widget.patient['dernieres_regles'] as Timestamp).toDate().toLocal()}"
                                              .split(' ')[0],
                                      style: TextStyle(
                                          fontSize: height * 0.018,
                                          color: constants.InputIconColor,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ]),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: InformationWithImageWidget(
                      height: height,
                      width: width,
                      image: "assets/icons/allergy.png",
                      text: "Allergies:",
                    ),
                  ),
                  WrapChips(width: width, list: widget.patient['allergies']),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: width * 0.15,
                          left: width * 0.1,
                          top: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildGPCA(
                              "G", widget.patient['g'].toString(), height),
                          buildGPCA(
                              "P", widget.patient['p'].toString(), height),
                          buildGPCA(
                              "C", widget.patient['c'].toString(), height),
                          buildGPCA(
                              "A", widget.patient['a'].toString(), height),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: BigTextWidget(
                  width: width,
                  height: height,
                  text: "Antécédants Chirurgicaux",
                  fontsize: height * 0.02),
            ),
            /*    Padding(
              padding:
                  EdgeInsets.only(left: width * 0.07, bottom: height * 0.01),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.patient["antchiru"].length,
                  itemBuilder: (context, index) {
                    return Antecedant_Chirurgical(
                        height: height,
                        width: width,
                        lightText: widget.patient["antchiru"]
                            ["auberginautomie"],
                        boldText: "20-02-1998");
                  }),
            ),*/
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: BigTextWidget(
                  width: width,
                  height: height,
                  text: "Antécédants Medicamentaux",
                  fontsize: height * 0.02),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.07,
                  bottom: height * 0.01,
                  top: height * 0.007),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.patient["antmedicamentaux"].length,
                    itemBuilder: (context, index) {
                      return PointWithText(
                        height: height,
                        width: width,
                        lightText: widget.patient["antmedicamentaux"][index]
                            .toString(),
                        boldText: null,
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: BigTextWidget(
                  width: width,
                  height: height,
                  text: "Antécédants Gynécologicaux",
                  fontsize: height * 0.02),
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: width * 0.08, top: height * 0.015),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: PointWithText(
                          height: height,
                          width: width,
                          lightText: "Age de marriage: ",
                          boldText: "  ${widget.patient["age_marriage"]} ans"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: PointWithText(
                          height: height,
                          width: width,
                          lightText: "Ménarchie: ",
                          boldText: "  ${widget.patient["menarchie"]} ans"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PointWithText(
                          height: height,
                          width: width,
                          lightText: "Contraception Orale: ",
                          boldText:
                              widget.patient["contraception_orale"] == true
                                  ? "  OUI"
                                  : "  NON"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PointWithText(
                          height: height,
                          width: width,
                          lightText: "Cosanguinité: ",
                          boldText: widget.patient["cosanguinite"] == true
                              ? "  OUI"
                              : "  NON"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PointWithText(
                          height: height,
                          width: width,
                          lightText: "Cycles réguliers: ",
                          boldText: widget.patient["cycle"] == true
                              ? "  OUI"
                              : "  NON"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PointWithText(
                          height: height,
                          width: width,
                          lightText: "Hypofertilité: ",
                          boldText: widget.patient["hypofertilite"] == true
                              ? "  OUI"
                              : "  NON"),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: BigTextWidget(
                  width: width,
                  height: height,
                  text: "Enfants",
                  fontsize: height * 0.02),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.patient["liste_enfants"].length,
                  itemBuilder: (context, index) {
                    EnfantGyneco enfant = EnfantGyneco.fromFirestore(
                        widget.patient["liste_enfants"][index]);
                    return buildEnfantWidget(enfant, height, width);
                  }),
            )
          ]),
    ));
  }

  Widget buildEnfantWidget(
    EnfantGyneco enfant,
    double height,
    double width,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.09, top: height * 0.005),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/icons/points.png"),
            color: constants.hintColor,
            height: height * 0.02,
          ),
          enfant.action == "Grossesse"
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Text(
                            enfant.annee.toString(),
                            style: TextStyle(
                                fontSize: height * 0.018,
                                color: constants.hintColor,
                                fontWeight: FontWeight.w600),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Image(
                          image: enfant.sexe == "garcon"
                              ? AssetImage("assets/icons/male.png")
                              : AssetImage("assets/icons/femenine.png"),
                          color: constants.secondaryColor,
                          height: height * 0.02,
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Text(
                            "${enfant.poids} kg",
                            style: TextStyle(
                                fontSize: height * 0.018,
                                color: constants.secondaryColor,
                                fontWeight: FontWeight.w600),
                          )),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Text(
                            enfant.voie.toString(),
                            style: TextStyle(
                                fontSize: height * 0.018,
                                color: constants.hintColor,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Text(
                          enfant.annee.toString(),
                          style: TextStyle(
                              fontSize: height * 0.018,
                              color: constants.hintColor,
                              fontWeight: FontWeight.w600),
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: RichText(
                            text: TextSpan(
                                text: "Avortement",
                                style: TextStyle(
                                    fontSize: height * 0.018,
                                    color: constants.gynecoColor,
                                    fontWeight: FontWeight.w600),
                                children: [
                              TextSpan(
                                text:
                                    "\n    ${enfant.tardivite} - ${enfant.curete}",
                                style: TextStyle(
                                  fontSize: height * 0.018,
                                  color: constants.hintColor,
                                ),
                              )
                            ])))
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildGPCA(String name, String value, double height) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
              fontSize: height * 0.025,
              fontWeight: FontWeight.w600,
              color: constants.hintColor),
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: height * 0.025,
              fontWeight: FontWeight.w600,
              color: constants.secondaryColor),
        )
      ],
    );
  }
}
