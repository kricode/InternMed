import 'package:flutter/material.dart';

class Hospitalisation {
  String email_medecin;
  String patientID;
  bool en_cours;
  DateTime? date_debut;
  DateTime? date_fin;

  Hospitalisation(this.email_medecin, this.patientID, this.en_cours,
      this.date_debut, this.date_fin);
  Map<String, dynamic> toMap() {
    return {
      'email_medecin': email_medecin,
      'patientID': patientID,
      'en_cours': en_cours,
      'date_debut': date_debut,
      'date_fin': date_fin
    };
  }

  Hospitalisation.fromFirestore(Map<String, dynamic> firestore)
      : email_medecin = firestore['email_medecin'],
        patientID = firestore['patientID'],
        en_cours = firestore['en_cours'],
        date_debut = firestore['date_debut'],
        date_fin = firestore['date_fin'];
}
