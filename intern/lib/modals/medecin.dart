import 'package:flutter/material.dart';
import 'package:intern/modals/patient.dart';

class Medecin {
  String email;
  String nom_med;
  String datenaissance;
  String service;
  List<Patient> patients;

  Medecin(this.email, this.nom_med, this.datenaissance, this.service,
      this.patients);
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nom': nom_med,
      'adresse': datenaissance,
      'etatcivil': service,
      'fonction': patients,
    };
  }

  Medecin.fromFirestore(Map<String, dynamic> firestore)
      : email = firestore['email'],
        nom_med = firestore['nom_med'],
        datenaissance = firestore['datenaissance'],
        service = firestore['service'],
        patients = firestore['patients'];
}
