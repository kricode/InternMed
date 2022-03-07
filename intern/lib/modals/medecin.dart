import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern/modals/patient_Chirurgie_Thoracique.dart';

class Medecin {
  String email;
  String nom_med;
  String prenom_med;

  String telephone;
  Medecin(
    this.email,
    this.nom_med,
    this.prenom_med,
    this.telephone,
  );
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nom': nom_med,
      'telephone': telephone,
    };
  }

  Medecin.fromFirestore(Map<String, dynamic> firestore)
      : email = firestore['email'],
        nom_med = firestore['nom_med'],
        prenom_med = firestore['prenom_med'],
        telephone = firestore['telephone'];
}
