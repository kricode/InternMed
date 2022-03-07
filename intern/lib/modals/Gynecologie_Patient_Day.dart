import 'package:flutter/material.dart';

class Gynecologie_Patient_Day {
  DateTime date;
  String idPatient;
  double? ta; //tentsion arterielle
  double? fc; // fréquence cardiaque
  double? fr; //fréquence réspiratoire
  double? saox; //Saturation oxygène
  double? t; //Température C
  double? dextro; // glyxémie
  double? etat;
  bool contraction_uterine;
  bool metrorragie;
  bool maf;
  bool la;
  bool verdatre;

  Gynecologie_Patient_Day(
      this.date,
      this.idPatient,
      this.ta,
      this.fc,
      this.fr,
      this.saox,
      this.t,
      this.dextro,
      this.etat,
      this.contraction_uterine,
      this.metrorragie,
      this.maf,
      this.la,
      this.verdatre);

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'idPatient': idPatient,
      'ta': ta,
      'fc': fc,
      'fr': fr,
      'saox': saox,
      't': t,
      'dextro': dextro,
      'etat': etat,
      'contration_uterine': contraction_uterine,
      'metrorragie': metrorragie,
      'maf': maf,
      'la': la,
      'verdatre': verdatre,
    };
  }

  Gynecologie_Patient_Day.fromFirestore(Map<String, dynamic> firestore)
      : date = firestore['date'],
        idPatient = firestore['idPatient'],
        ta = firestore['ta'],
        fc = firestore['fc'],
        fr = firestore['fr'],
        saox = firestore['saox'],
        t = firestore['t'],
        dextro = firestore['dextro'],
        etat = firestore['etat'],
        contraction_uterine = firestore[' contraction_uterine'],
        metrorragie = firestore['metrorragie'],
        maf = firestore['maf'],
        la = firestore['la'],
        verdatre = firestore['verdatre'];
}
