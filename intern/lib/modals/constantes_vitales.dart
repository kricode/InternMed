import 'package:flutter/material.dart';

class ConstantesVitales {
  DateTime date;
  String idPatient;
  String motdujour;
  double ta; //tentsion arterielle
  double fc; // fréquence cardiaque
  double fr; //fréquence réspiratoire
  double saox; //Saturation oxygène
  double t; //Température C
  double dextro; // glyxémie

  ConstantesVitales(this.date, this.idPatient, this.motdujour, this.ta, this.fc,
      this.fr, this.saox, this.t, this.dextro);

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'idPatient': idPatient,
      'motdujour': motdujour,
      'ta': ta,
      'fc': fc,
      'fr': fr,
      'saox': saox,
      't': t,
      'dextro': dextro,
    };
  }

  ConstantesVitales.fromFirestore(Map<String, dynamic> firestore)
      : date = firestore['date'],
        idPatient = firestore['idPatient'],
        motdujour = firestore['motdujour'],
        ta = firestore['ta'],
        fc = firestore['fc'],
        fr = firestore['fr'],
        saox = firestore['saox'],
        t = firestore['t'],
        dextro = firestore['dextro'];
}
