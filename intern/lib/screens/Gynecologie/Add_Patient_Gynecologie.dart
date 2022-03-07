import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/modals/Gynecologie_Patient.dart';
import 'package:intern/screens/List_Patients.dart';
import '../../Components.dart';

class Add_Patient_Gynecologie extends StatefulWidget {
  Add_Patient_Gynecologie(
      {Key? key, required this.service, required this.doctorId})
      : super(key: key);
  final Service service;
  final String doctorId;
  @override
  State<Add_Patient_Gynecologie> createState() =>
      _Add_Patient_GynecologieState();
}

class _Add_Patient_GynecologieState extends State<Add_Patient_Gynecologie> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();

  TextEditingController sang = TextEditingController();

  TextEditingController age = TextEditingController();
  TextEditingController ageGrossesseMois = TextEditingController();
  TextEditingController ageGrossesseSemaines = TextEditingController();

  TextEditingController adresse = TextEditingController();
  TextEditingController allergies = TextEditingController();
  TextEditingController ageMarriage = TextEditingController();
  TextEditingController menarchie = TextEditingController();

  TextEditingController antchiruController = TextEditingController();
  TextEditingController g = TextEditingController();

  TextEditingController p = TextEditingController();

  TextEditingController c = TextEditingController();

  TextEditingController a = TextEditingController();

  String? selectedEtatCivil;
  ////////////////////////////////:
  TextEditingController fonction = TextEditingController();
  ////////////////////////////

  DateTime regle = DateTime.now();
  DateTime admission = DateTime.now();
  DateTime dateNaissance = DateTime.now();

  ////////////////////////:
  List<String> allergiesList = [];
  ////////////////////////////////
  Map<String, DateTime> antchiru = {};
  List<dynamic> enfantList = [];
  DateTime antChiru = DateTime.now();
  //////////////////////////////////
  TextEditingController antmed = TextEditingController();
  TextEditingController antmedicamentaux = TextEditingController();

  ////:////
  bool contraception = false;
  bool cosanguinite = false;
  bool hypofertilite = false;
  bool cycle = false;

  List<String> antmedList = [];
  List<String> antmedicamentauxList = [];

  TextEditingController antfam = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.04,
              ),
              child: ServiceHeader(
                constants: constants,
                width: width,
                height: height,
                title: "Ajouter une patiente",
                imagePath: widget.service.blueimagePath,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputText(
                                hint: "Nom", icon: Icons.person, text: nom),
                            InputText(
                                hint: "Prenom",
                                icon: Icons.person,
                                text: prenom),
                            InputText(
                                hint: "Adresse",
                                icon: Icons.location_city,
                                text: adresse),
                            InputNumber(
                                hint: 'Age',
                                icon: Icons.calendar_today_outlined,
                                text: age),
                            InputText(
                                hint: "Groupe Sanguin",
                                icon: Icons.bloodtype,
                                text: sang),
                            TextLabel(
                                width: width,
                                label: "Allergies",
                                imagePath: "assets/icons/allergy.png"),
                            HabitArea(
                                width: width,
                                height: height,
                                field: allergies,
                                list: allergiesList,
                                hint: "Ajoutez une allergie",
                                action: "add",
                                color: constants.gynecoColor),
                            allergiesList.isNotEmpty
                                ? Container(
                                    child: MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: allergiesList.length,
                                          itemBuilder: (context, index) {
                                            return HabitArea(
                                                width: width,
                                                height: height,
                                                field: allergies,
                                                list: allergiesList,
                                                hint: allergiesList[index],
                                                action: "remove",
                                                color: constants.primaryColor);
                                          }),
                                    ),
                                  )
                                : SizedBox(),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextLabel(
                                      width: width,
                                      label: "Dernières règles",
                                      imagePath:
                                          "assets/icons/sanitary-pad.png"),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.055),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: constants.gynecoColor),
                                        onPressed: () {
                                          Future<void> _selectDateAdmission(
                                              BuildContext context) async {
                                            DateTime date = DateTime.now();
                                            final DateTime? picked =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: date,
                                                    firstDate:
                                                        DateTime(2015, 8),
                                                    lastDate: DateTime(2101));
                                            if (picked != null &&
                                                picked != date)
                                              setState(() {
                                                regle = picked;
                                                print('Picked ${regle}');
                                              });
                                          }

                                          _selectDateAdmission(context);
                                        },
                                        child: Text("${regle.toLocal()}"
                                            .split(' ')[0])),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FormFieldNumber(
                                      width: width * 0.3,
                                      height: height,
                                      hint: "G",
                                      controller: g,
                                      limitField: 1),
                                  FormFieldNumber(
                                      width: width * 0.3,
                                      height: height,
                                      hint: "C",
                                      controller: c,
                                      limitField: 1),
                                  FormFieldNumber(
                                      width: width * 0.3,
                                      height: height,
                                      hint: "P",
                                      controller: p,
                                      limitField: 1),
                                  FormFieldNumber(
                                      width: width * 0.3,
                                      height: height,
                                      hint: "A",
                                      controller: a,
                                      limitField: 1)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextLabel(
                                    width: width,
                                    label: "Age Grossesse",
                                    imagePath: "assets/icons/baby.png"),
                                Column(
                                  children: [
                                    FormFieldNumber(
                                        width: width,
                                        height: height,
                                        hint: "   Mois",
                                        controller: ageGrossesseMois,
                                        limitField: 1),
                                    FormFieldNumber(
                                        width: width,
                                        height: height,
                                        hint: "   Semaines",
                                        controller: ageGrossesseSemaines,
                                        limitField: 1),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                constants: constants);
                                          });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: constants.gynecoColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 5,
                                              // offset: Offset(5.0, .0)
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.transparent)),
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
                            ),
                            TextLabel(
                                width: width,
                                label: "Antécédants Médicamentaux",
                                imagePath: 'assets/icons/one pill.png'),
                            HabitArea(
                                width: width,
                                height: height,
                                field: antmedicamentaux,
                                list: antmedicamentauxList,
                                hint: 'Ajoutez un medicaments',
                                action: "add",
                                color: constants.gynecoColor),
                            TextLabel(
                                width: width,
                                label: "Antécédants Médicaux",
                                imagePath: 'assets/icons/one pill.png'),
                            HabitArea(
                                width: width,
                                height: height,
                                field: antmed,
                                list: antmedList,
                                hint: 'Ajoutez un medicaments',
                                action: "add",
                                color: constants.gynecoColor),
                            TextLabel(
                                width: width,
                                label: "Antécédants Gynécologiques",
                                imagePath:
                                    "assets/images/Services_Home/gynecologie.png"),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.06,
                                  vertical: height * 0.015),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: ImageIcon(
                                            AssetImage(
                                                "assets/icons/Marital Status.png"),
                                            color: constants.hintColor),
                                      ),
                                      Text(
                                        "Age marriage:",
                                        style: TextStyle(
                                            color: constants.hintColor,
                                            fontSize: height * 0.019),
                                      ),
                                      Spacer(),
                                      FormFieldNumber(
                                          width: width,
                                          height: height,
                                          hint: "",
                                          controller: ageMarriage,
                                          limitField: 2)
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.005,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: ImageIcon(
                                            AssetImage(
                                                "assets/icons/sanitary-pad.png"),
                                            color: constants.hintColor),
                                      ),
                                      Text(
                                        "Menarchie:",
                                        style: TextStyle(
                                            color: constants.hintColor,
                                            fontSize: height * 0.019),
                                      ),
                                      Spacer(),
                                      FormFieldNumber(
                                          width: width,
                                          height: height,
                                          hint: "",
                                          controller: menarchie,
                                          limitField: 2)
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
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
                                                  "assets/icons/contraceptive.png"),
                                              color: constants.hintColor),
                                        ),
                                        Text(
                                          "Contraception Orale",
                                          style: TextStyle(
                                              color: constants.hintColor,
                                              fontSize: height * 0.015),
                                        ),
                                        Spacer(),
                                        CupertinoSwitch(
                                          activeColor: constants.gynecoColor,
                                          value: contraception,
                                          onChanged: (value) {
                                            setState(() {
                                              contraception = value;
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
                                                  "assets/icons/family-tree.png"),
                                              color: constants.hintColor),
                                        ),
                                        Text(
                                          "Consanguinité",
                                          style: TextStyle(
                                              color: constants.hintColor,
                                              fontSize: height * 0.015),
                                        ),
                                        Spacer(),
                                        CupertinoSwitch(
                                          activeColor: constants.gynecoColor,
                                          value: cosanguinite,
                                          onChanged: (value) {
                                            setState(() {
                                              cosanguinite = value;
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
                                                  "assets/icons/fertilization.png"),
                                              color: constants.hintColor),
                                        ),
                                        Text(
                                          "Hypofertilité",
                                          style: TextStyle(
                                              color: constants.hintColor,
                                              fontSize: height * 0.015),
                                        ),
                                        Spacer(),
                                        CupertinoSwitch(
                                          activeColor: constants.gynecoColor,
                                          value: hypofertilite,
                                          onChanged: (value) {
                                            setState(() {
                                              hypofertilite = value;
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
                                                  "assets/icons/menstrual-cup.png"),
                                              color: constants.hintColor),
                                        ),
                                        Text(
                                          "Cycles irréguliers",
                                          style: TextStyle(
                                              color: constants.hintColor,
                                              fontSize: height * 0.015),
                                        ),
                                        Spacer(),
                                        CupertinoSwitch(
                                          activeColor: constants.gynecoColor,
                                          value: cycle,
                                          onChanged: (value) {
                                            setState(() {
                                              cycle = value;
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
                                                  'assets/icons/family.png'),
                                              color: constants.hintColor),
                                        ),
                                        Text(
                                          'Enfants:',
                                          style: TextStyle(
                                              color: constants.hintColor,
                                              fontSize: height * 0.019),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog_GynecoKids(
                                                      list: enfantList,
                                                      hint: "Chirurgie:",
                                                      constants: constants);
                                                });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: constants.gynecoColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black38,
                                                    blurRadius: 5,
                                                    // offset: Offset(5.0, .0)
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.transparent)),
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
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.025),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    print(cycle);

                                    //  if (_formKey.currentState!.validate()) {
                                    Gynecologie_Patient patient =
                                        Gynecologie_Patient(
                                            "${nom.text} ${prenom} - ${adresse.text} - ${user!.email}",
                                            nom.text,
                                            prenom.text,
                                            adresse.text,
                                            age.text,
                                            sang.text,
                                            regle,
                                            [
                                              int.parse(ageGrossesseMois.text),
                                              int.parse(
                                                  ageGrossesseSemaines.text)
                                            ],
                                            int.parse(g.text),
                                            int.parse(p.text),
                                            int.parse(c.text),
                                            int.parse(a.text),
                                            allergiesList,
                                            antchiru,
                                            antmedicamentauxList,
                                            antmedList,
                                            int.parse(ageMarriage.text),
                                            int.parse(menarchie.text),
                                            contraception,
                                            cosanguinite,
                                            hypofertilite,
                                            cycle,
                                            enfantList);
                                    FirestoreService service =
                                        FirestoreService();
                                    service.savePatient_Gynecologie(
                                        ' ${user!.displayName!} - ${user!.email}',
                                        patient,
                                        'Gynecologie');
                                    Get.back();
                                    //    }
                                  },
                                  child: Container(
                                    width: width * 0.4,
                                    height: height * 0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: constants.gynecoColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 5,
                                          // offset: Offset(5.0, .0)
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Valider",
                                      style: TextStyle(
                                          fontSize: height * 0.025,
                                          color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))))
          ],
        ),
      ),
    );
  }
}

class TextWithSwitch extends StatefulWidget {
  TextWithSwitch(
      {Key? key,
      required this.height,
      required this.width,
      required this.imagePath,
      required this.text,
      required this.field})
      : super(key: key);
  final double height;
  final double width;
  final String imagePath;
  String text;
  bool field;
  @override
  State<TextWithSwitch> createState() => _TextWithSwitchState();
}

class _TextWithSwitchState extends State<TextWithSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.height * 0.005),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: ImageIcon(AssetImage(widget.imagePath),
                color: constants.hintColor),
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: constants.hintColor, fontSize: widget.height * 0.015),
          ),
          Spacer(),
          CupertinoSwitch(
            activeColor: constants.gynecoColor,
            value: widget.field,
            onChanged: (value) {
              setState(() {
                widget.field = value;

                print(' ${widget.text} ${widget.field}');
              });
            },
          ),
          SizedBox(
            width: widget.width * 0.05,
          )
        ],
      ),
    );
  }
}
