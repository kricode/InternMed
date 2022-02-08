import 'package:flutter/material.dart';
import 'package:intern/modals/patient.dart';

class Medecin {
  String email;
  String nom_med;
  String datenaissance;

  Medecin(
    this.email,
    this.nom_med,
    this.datenaissance,
  );
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nom': nom_med,
      'adresse': datenaissance,
    };
  }

  Medecin.fromFirestore(Map<String, dynamic> firestore)
      : email = firestore['email'],
        nom_med = firestore['nom_med'],
        datenaissance = firestore['datenaissance'];
}
