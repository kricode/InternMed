import 'package:flutter/material.dart';

class ConstantesVitales {
  DateTime jour;
  String motdujour;
  double ta; //tentsion arterielle
  double fc; // fréquence cardiaque
  double fr; //fréquence réspiratoire
  double saox; //Saturation oxygène
  double t; //Température C
  double dextro; // glyxémie

  ConstantesVitales(this.jour, this.motdujour, this.ta, this.fc, this.fr,
      this.saox, this.t, this.dextro);

  Map<String, dynamic> toMap() {
    return {
      'jour': jour,
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
      : jour = firestore['jour'],
        motdujour = firestore['motdujour'],
        ta = firestore['ta'],
        fc = firestore['fc'],
        fr = firestore['fr'],
        saox = firestore['saox'],
        t = firestore['t'],
        dextro = firestore['dextro'];
}
