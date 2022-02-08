// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intern/Widgets/ImportantWidgets.dart';
import 'package:intern/database/firestoreService.dart';
import 'package:intern/modals/patient.dart';
import 'package:intern/screens/Services_Screen.dart';
import '../Widgets/Form_Widget.dart';
import '../constants.dart';

class AddPatient extends StatefulWidget {
  AddPatient({Key? key, required this.service}) : super(key: key);
  final Service service;
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  Constants _constants = Constants();
  final _formKey = GlobalKey<FormState>();

  TextEditingController nom = TextEditingController();
  TextEditingController salle = TextEditingController();
  TextEditingController sexe = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController habitude = TextEditingController();
  TextEditingController toxic = TextEditingController();
  TextEditingController antchiruController = TextEditingController();
  TextEditingController fumeurDepuis = TextEditingController();
  TextEditingController nbrPaquet = TextEditingController();

  ///////////////////
  List<String> sexeList = ['Homme', 'Femme'];
  int _value = -1;
  String? selectedSexe = '';
  ////////////////////////
  List<String> etatCivilH = [
    'Celibataire',
    'Marié(e)',
    'Divorcé(e)',
    'Veuf(ve)'
  ];

  String? selectedEtatCivil;
  ////////////////////////////////:
  TextEditingController fonction = TextEditingController();
  ////////////////////////////
  bool chirurgieEfefctue = false;
  DateTime operation = DateTime.now();
  DateTime admission = DateTime.now();

  ////////////////////////:
  List<String> habitudeList = [];
  ////////////////////////////////
  Map<String, DateTime> antchiru = {};
  DateTime antChiru = DateTime.now();
  //////////////////////////////////
  TextEditingController antmed = TextEditingController();
  List<String> antmedList = [];
  bool fumeur = false;

  List<String> toxicList = [];
  TextEditingController antfam = TextEditingController();
  ////////////////////////////////////////////
  ///////////////////////////////////
  /// Date Selector
  Future<void> _selectDateChirurgie(BuildContext context, DateTime date) async {
    DateTime date = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date)
      setState(() {
        operation = picked;
      });
  }

  Future<void> _selectDateAdmission(BuildContext context, DateTime date) async {
    DateTime date = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date)
      setState(() {
        admission = picked;
      });
  }

  @override
  void dispose() {
    nom.dispose();
    salle.dispose();
    sexe.dispose();
    adresse.dispose();
    habitude.dispose();
    toxic.dispose();
    fumeurDepuis.dispose();
    nbrPaquet.dispose();
    antchiruController.dispose();

    super.dispose();
  }

  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          ServiceHeader(
            constants: _constants,
            width: width,
            height: height,
            title: 'Nouveau Patient',
            imagePath: widget.service.blueimagePath,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputText(
                      icon: Icons.person,
                      text: nom,
                      hint: 'Nom Du Patient',
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLabel(
                            width: width,
                            label: 'Date d\'admission: ',
                            imagePath: 'assets/icons/bed.png'),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: _constants.secondaryColor),
                              onPressed: () {
                                _selectDateChirurgie(context, operation);
                              },
                              child:
                                  Text("${operation.toLocal()}".split(' ')[0])),
                        )
                      ],
                    ),
                    InputNumber(
                        hint: 'Salle Du Patient',
                        icon: Icons.door_sliding,
                        text: salle),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      margin: EdgeInsets.only(
                          top: 10, left: width * 0.065, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                              margin: EdgeInsets.only(right: 15),
                              duration: Duration(milliseconds: 500),
                              height: 30,
                              child: Image(
                                image: AssetImage('assets/icons/gender.png'),
                              )),
                          Text(
                            'Sexe Du Patient:',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      // Here, we will use radiobuttons to select either male or female
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(
                          left: width * 0.2, top: height * 0.01),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 'Homme',
                                groupValue: selectedSexe,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedSexe = value;
                                    print(selectedSexe);
                                  });
                                },
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Image(
                                image: AssetImage('assets/icons/male.png'),
                                width: width * 0.06,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text('Homme')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'Femme',
                                groupValue: selectedSexe,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedSexe = value;
                                    print(selectedSexe);
                                  });
                                },
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Image(
                                image: AssetImage('assets/icons/femenine.png'),
                                width: width * 0.06,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text('Femme')
                            ],
                          )
                        ],
                      ),
                    ),
                    InputText(
                        hint: 'Saisissez l\'adresse du patient',
                        icon: Icons.house,
                        text: adresse),
                    InputText(
                        hint: 'Quelle est sa fonction?',
                        icon: Icons.work,
                        text: fonction),
                    ///////////////////////////////////////////////
                    ///  Etat Civli:

                    Row(
                      children: [
                        TextLabel(
                          width: width,
                          imagePath: 'assets/icons/Marital Status.png',
                          label: 'Etat civil',
                        ),
                        DropdownButtonHideUnderline(
                            child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                              value: selectedEtatCivil,
                              hint: Text('Choisissez...'),
                              onChanged: (String? newValue) {
                                selectedEtatCivil = newValue;
                                print(selectedEtatCivil);
                              },
                              items: etatCivilH.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff48acf0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList()),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLabel(
                            width: width,
                            label: 'Date Chirurgie',
                            imagePath: 'assets/icons/calendar.png'),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: _constants.secondaryColor),
                              onPressed: () {
                                _selectDateChirurgie(context, operation);
                              },
                              child:
                                  Text("${operation.toLocal()}".split(' ')[0])),
                        )
                      ],
                    ),
                    TextLabel(
                        width: width,
                        label: 'Habitudes',
                        imagePath: 'assets/icons/habits.png'),
                    HabitArea(
                        width: width,
                        hint: "Ajoutez une habitude:",
                        action: "add",
                        height: height,
                        field: habitude,
                        list: habitudeList,
                        constants: _constants),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextLabel(
                            width: width,
                            label: "Patient fumeur?",
                            imagePath: 'assets/icons/smoke.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CupertinoSwitch(
                              activeColor: _constants.secondaryColor,
                              value: fumeur,
                              onChanged: (value) {
                                setState(() {
                                  fumeur = value;
                                  if (fumeur == false) {
                                    fumeurDepuis.clear();
                                    nbrPaquet.clear();
                                  }
                                  print('fumeur? $fumeur');
                                });
                              },
                            ),
                            fumeur == true
                                ? AnimatedContainer(
                                    duration: Duration(milliseconds: 15000),
                                    child: Column(
                                      children: [
                                        FormFieldNumber(
                                            width: width,
                                            height: height,
                                            hint: "depuis? (années)",
                                            controller: fumeurDepuis,
                                            limitField: 2),
                                        FormFieldNumber(
                                            width: width,
                                            height: height,
                                            hint: "Paquets/année",
                                            controller: nbrPaquet,
                                            limitField: 3)
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        )
                      ],
                    ),
                    TextLabel(
                        width: width,
                        label: " Autres Toxiques",
                        imagePath: 'assets/icons/toxic.png'),

                    HabitArea(
                        width: width,
                        height: height,
                        field: toxic,
                        list: toxicList,
                        hint: "Ajoutez un produit toxique:",
                        action: 'add',
                        constants: _constants),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLabel(
                            width: width,
                            label: "Antécédants Chirurgicaux",
                            imagePath: 'assets/icons/surgery.png'),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog_Chir(
                                      list: antchiru,
                                      hint: "Chirurgie:",
                                      constants: _constants);
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: _constants.secondaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 5,
                                    // offset: Offset(5.0, .0)
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.transparent)),
                            margin: EdgeInsets.only(
                              right: width * 0.06,
                            ),
                            height: height * 0.045,
                            width: width * 0.1,
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.03),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    TextLabel(
                        width: width,
                        label: "Antécédants Médicamentaux",
                        imagePath: 'assets/icons/one pill.png'),
                    HabitArea(
                        width: width,
                        height: height,
                        field: antmed,
                        list: antmedList,
                        hint: 'Ajoutez un medicaments',
                        action: "add",
                        constants: _constants),

                    TextLabel(
                        width: width,
                        label: "Antécédants Familiaux: ",
                        imagePath: 'assets/icons/family.png'),
                    Container(
                      width: width - (width * 0.04),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 5,
                              // offset: Offset(5.0, .0)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black38)),
                      margin: EdgeInsets.only(
                          left: width * 0.06,
                          right: width * 0.06,
                          top: height * 0.01,
                          bottom: height * 0.015),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width * 0.75,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                controller: antfam,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff48acf0),
                                ),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText:
                                        "Veuillez ecrire ses antécédants familiaux"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Patient patient = Patient(
                                    '1',
                                    nom.text,
                                    salle.text,
                                    selectedSexe.toString(),
                                    adresse.text,
                                    selectedEtatCivil.toString(),
                                    fumeurDepuis.text,
                                    nbrPaquet.text,
                                    fonction.text,
                                    operation,
                                    habitudeList,
                                    antchiru,
                                    antmedList,
                                    toxicList,
                                    antfam.text);
                                Map<String, dynamic> patientFirestore =
                                    patient.toMap();
                                print(patientFirestore);
                                firestoreService.savePatient('Mira', patient);
                                print('done');
                              }
                            },
                            child: Text('Valider',
                                style: TextStyle(fontSize: height * 0.03)))),
                    SizedBox(
                      height: height * 0.02,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
