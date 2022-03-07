import 'package:flutter/material.dart';

class Patient {
  String nom;
  String dateNaissance;
  String sexe;
  Patient(this.nom, this.dateNaissance, this.sexe);

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'sexe': sexe,
      'dateNaissance': dateNaissance,
    };
  }

  Patient.fromFirestore(Map<String, dynamic> firestore)
      : nom = firestore['nom'],
        sexe = firestore['sexe'],
        dateNaissance = firestore['dateNaissance'];
}
