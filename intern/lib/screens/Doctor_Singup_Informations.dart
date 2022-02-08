import 'package:flutter/material.dart';
import 'package:intern/Widgets/Clipper.dart';
import 'package:intern/Widgets/Form_Widget.dart';
import 'package:intern/Widgets/ImportantWidgets.dart';
import 'package:intern/constants.dart';

class Doctor_Signup_Informations extends StatefulWidget {
  Doctor_Signup_Informations({Key? key}) : super(key: key);

  @override
  State<Doctor_Signup_Informations> createState() =>
      _Doctor_Signup_InformationsState();
}

class _Doctor_Signup_InformationsState
    extends State<Doctor_Signup_Informations> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController nom = TextEditingController();
    TextEditingController prenom = TextEditingController();

    TextEditingController numero = TextEditingController();
    DateTime dateNaissance = DateTime.now();
    Constants _constants = Constants();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OuterClippedPart(),
                  child: Container(
                    color: Color(0xff48acf0),
                    width: width,
                    height: height,
                  ),
                ),
                //
                ClipPath(
                    clipper: InnerClippedPart(),
                    child: Container(
                      color: Color(0xFF4D2663),
                      width: width,
                      height: height,
                    )),

                ClipPath(
                    clipper: InnerDown(),
                    child: Container(
                      color: Color(0xff48acf0),
                      width: width,
                      height: height,
                    )),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.23,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.1),
                        child: Text(
                          "Inscrivez-Vous ",
                          style: TextStyle(
                              color: Color(0xFF606D5D),
                              fontWeight: FontWeight.w300,
                              fontSize: height * 0.03),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Form(
                          child: Column(
                        children: [
                          InputText(
                              hint: "Votre Nom", icon: Icons.person, text: nom),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          InputText(
                              hint: "Votre Prénom",
                              icon: Icons.person,
                              text: prenom),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          InputNumber(
                              hint: "Votre Numéro de Téléphone",
                              icon: Icons.smartphone,
                              text: numero),
                        ],
                      )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.2, vertical: height * 0.035),
                        child: Container(
                          height: height * 0.077,
                          width: width * 0.55,
                          decoration: BoxDecoration(
                              color: _constants.primaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              )),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'S\'inscrire',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
