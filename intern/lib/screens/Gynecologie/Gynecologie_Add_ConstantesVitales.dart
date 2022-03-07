import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intern/Components.dart';
import 'package:intern/modals/Gynecologie_Patient.dart';
import 'package:intern/modals/Gynecologie_Patient_Day.dart';
import 'package:intern/screens/Gynecologie/Add_Patient_Gynecologie.dart';
import 'package:intern/screens/List_Patients.dart';
import 'package:intl/intl.dart';

class Gynecologie_Add_ConstantesVitales extends StatefulWidget {
  Gynecologie_Add_ConstantesVitales(
      {Key? key,
      required this.medecin,
      required this.patient,
      required this.service,
      required this.hospitalisation})
      : super(key: key);
  final String medecin;
  final Gynecologie_Patient patient;
  final String service;
  final int hospitalisation;
  @override
  State<Gynecologie_Add_ConstantesVitales> createState() =>
      _Gynecologie_Add_ConstantesVitalesState();
}

class _Gynecologie_Add_ConstantesVitalesState
    extends State<Gynecologie_Add_ConstantesVitales> {
  TextEditingController? ta = TextEditingController();
  TextEditingController? fc = TextEditingController();
  TextEditingController? fr = TextEditingController();
  TextEditingController? saox = TextEditingController();
  TextEditingController? t = TextEditingController();
  TextEditingController? dextro = TextEditingController();
  double etatGeneral = 5;
  var etat = ["Bon", "Moyen", "Mauvais"];
  bool contractionUterine = false;
  bool metrorragie = false;

  bool maf = false; //Mouvement Actif Fetau

  bool la = false;
  bool verdatre = false;

  DateTime date_et_heure = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String? conscience;
    String? cooperation;

    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                            print("Arrow Clicked");
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat.Hm().format(date_et_heure),
                              style: TextStyle(
                                  fontSize: height * 0.04,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              date_et_heure.toString().split(' ')[0],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                              color: constants.hintColor,
                              text: Text("Mm hg"),
                              imagePath:
                                  'assets/images/Constantes_Vitales/blood-pressure-gauge.png'),
                          Contante_Vitale_Input(
                              width: width,
                              height: height,
                              controller: fc,
                              color: constants.hintColor,
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
                              color: constants.hintColor,
                              text: Text('Cycle/min'),
                              imagePath:
                                  'assets/images/Constantes_Vitales/respiratory-system.png'),
                          Contante_Vitale_Input(
                              width: width,
                              height: height,
                              controller: saox,
                              color: constants.hintColor,
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
                              color: constants.hintColor,
                              imagePath:
                                  'assets/images/Constantes_Vitales/sugar-blood-level.png'),
                          Contante_Vitale_Input(
                              width: width,
                              height: height,
                              controller: t,
                              text: Text("C°"),
                              color: constants.hintColor,
                              imagePath:
                                  'assets/images/Constantes_Vitales/thermometer.png'),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.03),
                        child: Text(
                          'Etat général',
                          style: TextStyle(
                            fontSize: height * 0.02,
                            color: constants.hintColor,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: width * 0.7,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: constants.gynecoColor,
                            inactiveTrackColor: Colors.black12,
                            trackShape: RoundedRectSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            thumbColor: Colors.redAccent,
                            overlayColor: Colors.red.withAlpha(32),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                            tickMarkShape: RoundSliderTickMarkShape(),
                            activeTickMarkColor: constants.gynecoColor,
                            inactiveTickMarkColor: Colors.red[100],
                            valueIndicatorShape:
                                PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: Colors.redAccent,
                            valueIndicatorTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: Slider(
                            value: etatGeneral,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label: '$etatGeneral',
                            onChanged: (value) {
                              setState(
                                () {
                                  etatGeneral = value;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.03),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: width * 0.8,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.005),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ImageIcon(
                                          AssetImage("assets/icons/points.png"),
                                          color: constants.hintColor),
                                    ),
                                    Text(
                                      "Cotractions Utérines",
                                      style: TextStyle(
                                          color: constants.hintColor,
                                          fontSize: height * 0.015),
                                    ),
                                    Spacer(),
                                    CupertinoSwitch(
                                      activeColor: constants.gynecoColor,
                                      value: contractionUterine,
                                      onChanged: (value) {
                                        setState(() {
                                          contractionUterine = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.005),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ImageIcon(
                                          AssetImage("assets/icons/points.png"),
                                          color: constants.hintColor),
                                    ),
                                    Text(
                                      "Metrorragie",
                                      style: TextStyle(
                                          color: constants.hintColor,
                                          fontSize: height * 0.015),
                                    ),
                                    Spacer(),
                                    CupertinoSwitch(
                                      activeColor: constants.gynecoColor,
                                      value: metrorragie,
                                      onChanged: (value) {
                                        setState(() {
                                          metrorragie = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.005),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ImageIcon(
                                          AssetImage("assets/icons/points.png"),
                                          color: constants.hintColor),
                                    ),
                                    Text(
                                      "Mouvements actifs Foetaux",
                                      style: TextStyle(
                                          color: constants.hintColor,
                                          fontSize: height * 0.015),
                                    ),
                                    Spacer(),
                                    CupertinoSwitch(
                                      activeColor: constants.gynecoColor,
                                      value: maf,
                                      onChanged: (value) {
                                        setState(() {
                                          maf = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.005),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ImageIcon(
                                          AssetImage("assets/icons/points.png"),
                                          color: constants.hintColor),
                                    ),
                                    Text(
                                      "Liquide Amniotique",
                                      style: TextStyle(
                                          color: constants.hintColor,
                                          fontSize: height * 0.015),
                                    ),
                                    Spacer(),
                                    CupertinoSwitch(
                                      activeColor: constants.gynecoColor,
                                      value: la,
                                      onChanged: (value) {
                                        setState(() {
                                          la = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    )
                                  ],
                                ),
                              ),
                              la == true
                                  ? AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      margin: EdgeInsets.symmetric(
                                          vertical: height * 0.005),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: ImageIcon(
                                                AssetImage(
                                                    "assets/icons/points.png"),
                                                color: constants.hintColor),
                                          ),
                                          Text(
                                            "Verdatre",
                                            style: TextStyle(
                                                color: constants.hintColor,
                                                fontSize: height * 0.015),
                                          ),
                                          Spacer(),
                                          CupertinoSwitch(
                                            activeColor: constants.gynecoColor,
                                            value: verdatre,
                                            onChanged: (value) {
                                              setState(() {
                                                verdatre = value;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: width * 0.05,
                                          )
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                              GestureDetector(
                                  onTap: () {
                                    Gynecologie_Patient_Day values_to_add =
                                        Gynecologie_Patient_Day(
                                            DateTime.now(),
                                            "Text",
                                            ta!.text.isEmpty
                                                ? null
                                                : double.parse(ta!.text),
                                            fc!.text.isEmpty
                                                ? null
                                                : double.parse(fc!.text),
                                            fr!.text.isEmpty
                                                ? null
                                                : double.parse(fr!.text),
                                            saox!.text.isEmpty
                                                ? null
                                                : double.parse(saox!.text),
                                            t!.text.isEmpty
                                                ? null
                                                : double.parse(t!.text),
                                            dextro!.text.isEmpty
                                                ? null
                                                : double.parse(dextro!.text),
                                            etatGeneral,
                                            contractionUterine,
                                            metrorragie,
                                            maf,
                                            la,
                                            verdatre);
                                    FirestoreService service =
                                        FirestoreService();
                                    service.saveStats_Gynecologie(
                                        ' ${user!.displayName!} - ${user!.email}',
                                        values_to_add,
                                        widget.patient,
                                        widget.service,
                                        1);
                                    Get.back();
                                    print("adding gyneco patient");
                                  },
                                  child: ButtonConfirm(
                                    height: height,
                                    width: width,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Entree_Patiente_Gyneco extends StatefulWidget {
  Entree_Patiente_Gyneco({Key? key}) : super(key: key);

  @override
  State<Entree_Patiente_Gyneco> createState() => _Entree_Patiente_GynecoState();
}

String? conscience;
String? cooperation;

class _Entree_Patiente_GynecoState extends State<Entree_Patiente_Gyneco> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: height * 0.01),
        child: BigTextWidget(
            width: width,
            height: height,
            text: "Ce Jour",
            fontsize: height * 0.025),
      ),
      TextLabel(
          width: width,
          label: "Patiente",
          imagePath: "assets/icons/record-check.png"),
      Column(
        children: [
          TwoFieldsRadioBox(
              height: height,
              width: width,
              text1: "consciente",
              text2: "insconsciente",
              imagePath1: null,
              imagePath2: null,
              field: conscience),
          TwoFieldsRadioBox(
              height: height,
              width: width,
              text1: "Coopérante",
              text2: "Non Coopérante",
              imagePath1: null,
              imagePath2: null,
              field: conscience),
        ],
      )
    ]);
  }
}
