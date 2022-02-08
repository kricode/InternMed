import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern/screens/Doctor_Singup_Informations.dart';
import 'package:intern/screens/Historique.dart';
import 'package:intern/screens/Patient_Day.dart';
import 'package:intern/screens/Services_Screen.dart';
import 'package:intern/screens/addpatient.dart';
import 'package:intern/screens/List_Patients.dart';
import './constants.dart';
import 'package:flutter/services.dart';
import './screens/Login.dart';
export '';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/historique',
      routes: Navigate.routes,
    );
  }
}

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => LoginPage(),
    //  '/listPatients': (context) => List_Patients(),
    // '/addpatient': (context) => AddPatient(),
    '/patientDay': (context) => Patient_Day(),
    '/services': (context) => Services_Screen(),
    '/signupinfo': (context) => Doctor_Signup_Informations(),
    '/historique': (context) => Historique(),
  };
}
