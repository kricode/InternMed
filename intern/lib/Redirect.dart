import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intern/screens/Admin_Processing.dart';
import 'package:intern/screens/Doctor_Singup_Informations.dart';
import 'package:intern/screens/Login.dart';
import 'package:intern/screens/Services_Screen.dart';
import './Components.dart';

class Redirect extends StatefulWidget {
  Redirect({Key? key}) : super(key: key);

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  User? result = FirebaseAuth.instance.currentUser;

  bool existDoctor = false;
  bool signupRequest = false;
  bool loaded = false;
  Future<bool> checkExist(String? docID) async {
    try {
      await FirebaseFirestore.instance
          .collection('medecins')
          .doc(docID)
          .get()
          .then((doc) {
        setState(() {
          existDoctor = doc.exists;
          loaded = true;
        });
      });
      return existDoctor;
    } catch (e) {
      // If any error
      return false;
    }
  }

  Future<bool> checkSignupRequest(String? docID) async {
    try {
      await FirebaseFirestore.instance
          .collection('demandes')
          .doc(docID)
          .get()
          .then((doc) {
        setState(() {
          signupRequest = doc.exists;
          loaded = true;
        });
      });
      return signupRequest;
    } catch (e) {
      // If any error
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkExist(result!.email);
    checkSignupRequest(result!.email);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loaded == false
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : existDoctor == true
            ? Services_Screen()
            : signupRequest
                ? Admin_Processing()
                : Doctor_Signup_Informations();

    /*  return StreamBuilder<DocumentSnapshot>(


        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(result!.email)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('loading');
            default:
              return checkRole(snapshot);
          }
        });*/
  }
}

Widget checkRole(AsyncSnapshot<DocumentSnapshot> snapshot) {
  switch (snapshot.data!['role']) {
    case "doctor":
      return Services_Screen();
  }
  return Text('hi');
}
