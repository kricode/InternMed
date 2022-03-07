import 'package:flutter/material.dart';
import 'package:intern/Components.dart';
import 'package:intern/screens/List_Patients.dart';

class Patient_New_Hospitalisation extends StatefulWidget {
  Patient_New_Hospitalisation({Key? key}) : super(key: key);

  @override
  State<Patient_New_Hospitalisation> createState() =>
      _Patient_New_HospitalisationState();
}

class _Patient_New_HospitalisationState
    extends State<Patient_New_Hospitalisation> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height * 0.13),
      child: Column(
        children: [
          Container(
            height: height * 0.11,
            width: width,
            margin: EdgeInsets.symmetric(horizontal: width * 0.075),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: constants.secondaryColor,
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: width * 0.05),
                  Text(
                    '+',
                    style: TextStyle(
                      fontSize: height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'Nouvelle Hospitalisation',
                    style: TextStyle(
                        fontSize: height * 0.022, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.11,
            width: width,
            margin: EdgeInsets.symmetric(horizontal: width * 0.075),
            decoration: BoxDecoration(
              border: Border.all(color: constants.secondaryColor, width: 3),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: width * 0.05),
                  Image(
                    image: AssetImage("assets/icons/past.png"),
                    height: height * 0.05,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'Anciennes Hospitalisations',
                    style: TextStyle(
                        fontSize: height * 0.022,
                        color: constants.secondaryColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
