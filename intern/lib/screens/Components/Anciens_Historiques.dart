import 'package:flutter/material.dart';

class Anciens_Historiques extends StatefulWidget {
  Anciens_Historiques({Key? key}) : super(key: key);

  @override
  State<Anciens_Historiques> createState() => _Anciens_HistoriquesState();
}

class _Anciens_HistoriquesState extends State<Anciens_Historiques> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("anciens Historique"),
      ),
    );
  }
}
