import 'package:intern/Components.dart';
import 'package:flutter/material.dart';
import 'package:intern/screens/List_Patients.dart';

DateTime _date = DateTime.now();

class Patient_Edit extends StatefulWidget {
  Patient_Edit({Key? key}) : super(key: key);

  @override
  State<Patient_Edit> createState() => _Patient_EditState();
}

int currentIndex = 0;

class _Patient_EditState extends State<Patient_Edit> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    List<Widget> body = [
      HospitalisationFin(height: height, width: width),
      DecesPatient()
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.15,
            ),
            Center(
              child: Container(
                height: height * 0.08,
                width: width * 0.74,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                          print(currentIndex);
                        });
                      },
                      child: AnimatedContainer(
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.04),
                          child: Center(
                            child: Text(
                              'Hospitalisation Terminée',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        duration: Duration(milliseconds: 500),
                        width: width * 0.37,
                        decoration: BoxDecoration(
                            color: currentIndex == 0
                                ? Colors.blue
                                : Colors.grey.withOpacity(0.8),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                          print(currentIndex);
                        });
                      },
                      child: AnimatedContainer(
                        child: Center(
                            child: Text(
                          'Patient décèdé',
                          style: TextStyle(color: Colors.white),
                        )),
                        duration: Duration(milliseconds: 500),
                        width: width * 0.37,
                        decoration: BoxDecoration(
                            color: currentIndex == 1
                                ? Colors.redAccent.withOpacity(0.8)
                                : Colors.grey.withOpacity(0.8),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedContainer(
                duration: Duration(milliseconds: 500),
                child: body[currentIndex])
          ],
        ),
      ),
    );
  }
}

class HospitalisationFin extends StatefulWidget {
  HospitalisationFin({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  State<HospitalisationFin> createState() => _HospitalisationFinState();
}

class _HospitalisationFinState extends State<HospitalisationFin> {
  TextEditingController _details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    Future<void> _selectDate(BuildContext context, DateTime date) async {
      DateTime date = DateTime.now();
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != date)
        setState(() {
          _date = picked;
        });
    }

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),

      //  width: width * 0.9,
      margin: EdgeInsets.only(
          top: height * 0.07, left: width * 0.02, right: width * 0.02),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextLabel(
                width: width,
                label: 'Details  d\'hospitalisation',
                imagePath: "assets/icons/record-check.png"),
            Padding(
              padding: EdgeInsets.only(left: width * 0.07),
              child: TextField(
                controller: _details,
                decoration: InputDecoration(
                    hintText: 'Saisissez votre texte',
                    hintStyle: TextStyle(color: constants.hintColor)),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            TextLabel(
                width: width,
                label: 'Date De Sortie',
                imagePath: 'assets/icons/calendar.png'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context, _date);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ],
                        border: Border.all(
                            width: 3, color: constants.secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: height * 0.08,
                    width: width * 0.45,
                    child: Center(
                        child: Text(
                      "${_date.toLocal()}".split(' ')[0],
                      style: TextStyle(
                          color: constants.secondaryColor,
                          fontSize: height * 0.023),
                    )),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 1.5,
                width: width,
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.015),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print("Valider");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: constants.secondaryColor),
                    height: height * 0.08,
                    width: width * 0.45,
                    child: Center(
                        child: Text(
                      "Valider",
                      style: TextStyle(
                          color: Colors.white, fontSize: height * 0.023),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DecesPatient extends StatefulWidget {
  DecesPatient({Key? key}) : super(key: key);

  @override
  State<DecesPatient> createState() => _DecesPatientState();
}

class _DecesPatientState extends State<DecesPatient> {
  TextEditingController _details = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    Future<void> _selectDate(BuildContext context, DateTime date) async {
      DateTime date = DateTime.now();
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != date)
        setState(() {
          _date = picked;
        });
    }

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),

      //  width: width * 0.9,
      margin: EdgeInsets.only(
          top: height * 0.07, left: width * 0.02, right: width * 0.02),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextLabel(
                width: width,
                label: 'Details  du décès',
                imagePath: "assets/icons/record-check.png"),
            Padding(
              padding: EdgeInsets.only(left: width * 0.07),
              child: TextField(
                controller: _details,
                decoration: InputDecoration(
                    hintText: 'Saisissez votre texte',
                    hintStyle: TextStyle(color: constants.hintColor)),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            TextLabel(
                width: width,
                label: 'Date De Décès',
                imagePath: 'assets/icons/calendar.png'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context, _date);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ],
                        border: Border.all(
                            width: 3, color: Colors.redAccent.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: height * 0.08,
                    width: width * 0.45,
                    child: Center(
                        child: Text(
                      "${_date.toLocal()}".split(' ')[0],
                      style: TextStyle(
                          color: constants.textColor, fontSize: height * 0.023),
                    )),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 1.5,
                width: width,
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.015),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print("Valider");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent.withOpacity(0.8)),
                    height: height * 0.08,
                    width: width * 0.45,
                    child: Center(
                        child: Text(
                      "Valider",
                      style: TextStyle(
                          color: Colors.white, fontSize: height * 0.023),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
