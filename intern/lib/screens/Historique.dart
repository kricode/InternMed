import 'package:flutter/material.dart';
import 'package:intern/Widgets/ImportantWidgets.dart';
import 'package:intern/constants.dart';
import 'package:intern/modals/constantes_vitales.dart';
import 'package:intern/screens/Services_Screen.dart';
import 'package:intl/intl.dart';

Constants _constants = Constants();

class Historique extends StatefulWidget {
  Historique({
    Key? key,
  }) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
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
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TableColumn(height: height, width: width),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: width * 0.8,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listConstants.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              TextCell(
                                  height: height,
                                  width: width,
                                  text: listConstants[index]
                                          .date
                                          .toString()
                                          .split(' ')[0] +
                                      '\n' +
                                      DateFormat.Hm()
                                          .format(listConstants[index].date)),
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
                              Tooltip(
                                message: "Supprimez ces données?",
                                child: Container(
                                  height: height * 0.1,
                                  width: width * 0.1,
                                  child: Center(
                                    child: Container(
                                      height: height * 0.03,
                                      width: width * 0.08,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: _constants.primaryColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.02),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: height * 0.7,
                            width: 1,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    ])));
  }
}

class TableColumn extends StatelessWidget {
  const TableColumn({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.1,
              width: width * 0.1,
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
      ],
    );
  }
}

class Cell extends StatelessWidget {
  const Cell({
    Key? key,
    required this.height,
    required this.width,
    required this.imagePath,
  }) : super(key: key);

  final double height;
  final double width;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Center(
        child: Container(
          height: height * 0.1,
          child: Image(
            width: width * 0.1,
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}

class TextCell extends StatelessWidget {
  const TextCell({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Container(
            height: height * 0.1,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: height * 0.02),
              ),
            )));
  }
}

List<ConstantesVitales> listConstants = [
  ConstantesVitales(
      DateTime.now(), "A", "mot du jour", 12, 34, 12, 50, 36, 1.4),
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
