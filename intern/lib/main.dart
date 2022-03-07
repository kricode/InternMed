import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intern/Redirect.dart';
import 'package:intern/screens/Admin_Processing.dart';
import 'package:intern/screens/Components/Patient_Edit.dart';
import 'package:intern/screens/Doctor_Singup_Informations.dart';
import 'package:intern/screens/Chirurgie_Thoracique/Chirurgie_Thoracique_Historique_Constantes.dart';
import 'package:intern/screens/Patient_Details.dart';
import 'package:intern/screens/Services_Screen.dart';
import './screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    User? result = FirebaseAuth.instance.currentUser;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      initialRoute: result == null ? '/' : '/services',
      routes: Navigate.routes,
    );
  }
}

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => LoginPage(),
    '/services': (context) => Services_Screen(),
    '/signupinfo': (context) => Doctor_Signup_Informations(),
    '/historiqueConstantes': (context) =>
        Chirurgie_Thoracique_Historique_Constantes(),
    '/patientEdit': (context) => Patient_Edit(),
    '/adminProcessing': (context) => Admin_Processing(),
    '/redirect': (context) => Redirect(),
  };
}
