import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern/screens/home.dart';

import './screens/Login.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: Navigate.routes,
    );
  }
}

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => LoginPage(),
    '/home': (context) => HomeScreen(),

    // '/home'  : (context) => HomePage()
  };
}
