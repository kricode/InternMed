import 'package:flutter/material.dart';
import 'package:intern/screens/List_Patients.dart';

class Service_Not_Available extends StatefulWidget {
  Service_Not_Available({Key? key}) : super(key: key);

  @override
  State<Service_Not_Available> createState() => _Service_Not_AvailableState();
}

class _Service_Not_AvailableState extends State<Service_Not_Available> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 270),
      child: Text(
        "Service non disponible, Attendez la mise à jour!",
        style: TextStyle(fontSize: 25, color: constants.secondaryColor),
      ),
    ));
  }
}
