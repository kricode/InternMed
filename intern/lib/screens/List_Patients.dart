import 'package:flutter/material.dart';
import 'package:intern/Widgets/ImportantWidgets.dart';
import 'package:intern/screens/Services_Screen.dart';
import 'package:intern/screens/addpatient.dart';
import '../constants.dart';

class List_Patients extends StatefulWidget {
  List_Patients({Key? key, required this.service})
      : super(
          key: key,
        );
  final Service service;

  @override
  _List_PatientsState createState() => _List_PatientsState();
}

Constants constants = Constants();

class _List_PatientsState extends State<List_Patients> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var currentIndex = 0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
              title: 'Liste Des Patients',
              imagePath: widget.service.blueimagePath,
            ),
          ),
          PatientListTile(width: width, height: height),
          PatientListTile(width: width, height: height),
          PatientListTile(width: width, height: height),
          PatientListTile(width: width, height: height),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddPatient(
                      service: widget.service,
                    )),
          );
          print('click sur add patient');
        },
        child: ImageIcon(AssetImage('assets/icons/add-user.png')),
        tooltip: "Ajoutez un patient",
      ),
    );
  }
}

class PatientListTile extends StatelessWidget {
  const PatientListTile({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.004),
      height: height * 0.12,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 12,
            offset: Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      duration: Duration(milliseconds: 1500),
      curve: Curves.fastLinearToSlowEaseIn,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image(
                height: height * 0.12,
                width: width * 0.12,
                image: AssetImage("assets/images/woman.png"),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: width * 0.02),
              child: Container(
                width: width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sa3doun Mohamed Arezki ",
                      style: TextStyle(
                          color: constants.secondaryColor,
                          fontSize: height * 0.019),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 5),
                        child: SingleChildScrollView(
                          child: Text(
                            "25 ans \nHospitalisation: 5ème jour",
                            style: TextStyle(
                                color: constants.textColor,
                                fontSize: height * 0.013),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              child: Container(
                decoration: BoxDecoration(
                    color: constants.hintColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50)),
                height: width * 0.12,
                width: 0.5,
              ),
            ),
            AnimatedContainer(
              margin: EdgeInsets.only(left: width * 0.03),
              alignment: Alignment.centerRight,
              duration: Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Tooltip(
                message: 'Jours post chirurgie',
                child: Text(
                  "J05",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: constants.primaryColor,
                    fontSize: height * 0.02,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.favorite_rounded,
  Icons.settings_rounded,
  Icons.person_rounded,
  //Icons.plumbing,
];
