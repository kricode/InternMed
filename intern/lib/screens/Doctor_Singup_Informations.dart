import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/Components.dart';
import 'package:intern/Widgets/Clipper.dart';
import 'package:intern/Widgets/Form_Widget.dart';
import 'package:intern/Widgets/ImportantWidgets.dart';
import 'package:intern/constants.dart';
import 'package:intern/database/FirebaseAuth.dart';
import 'package:intern/screens/Login.dart';

class Doctor_Signup_Informations extends StatefulWidget {
  Doctor_Signup_Informations({Key? key}) : super(key: key);

  @override
  State<Doctor_Signup_Informations> createState() =>
      _Doctor_Signup_InformationsState();
}

class _Doctor_Signup_InformationsState
    extends State<Doctor_Signup_Informations> {
  bool _isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController email = TextEditingController();

    TextEditingController nom = TextEditingController();
    TextEditingController prenom = TextEditingController();

    TextEditingController numero = TextEditingController();
    DateTime dateNaissance = DateTime.now();
    final _formKey = GlobalKey<FormState>();

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

                Form(
                  key: _formKey,
                  child: Column(
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
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Form(
                            child: Column(
                          children: [
                            user == null
                                ? InputText(
                                    hint: "Votre Gmail",
                                    icon: Icons.email,
                                    text: nom)
                                : TextLabel(
                                    width: width,
                                    label: user.email!,
                                    imagePath: 'assets/icons/google.png'),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            InputText(
                                hint: "Votre Nom",
                                icon: Icons.person,
                                text: nom),
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
                              horizontal: width * 0.2,
                              vertical: height * 0.035),
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                Medecin medecin = Medecin(
                                    user == null ? user!.email! : email.text,
                                    nom.text,
                                    prenom.text,
                                    numero.text);
                                await service.saveRegister(medecin);
                                Get.offAll(LoginPage());
                              }
                            },
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
                        ),
                      ),
                      user == null
                          ? SizedBox()
                          : Align(
                              alignment: Alignment.bottomRight,
                              child: Tooltip(
                                message: "Deconnectez votre Gmail",
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      _isSigningOut = true;
                                    });
                                    await FirebaseService.signOut(
                                        context: context);
                                    setState(() {
                                      _isSigningOut = false;
                                    });
                                    Get.offAll(LoginPage());
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: height * 0.08,
                                          right: width * 0.05),
                                      child: Image(
                                        height: height * 0.045,
                                        image: AssetImage(
                                            'assets/icons/log-out.png'),
                                      )),
                                ),
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
