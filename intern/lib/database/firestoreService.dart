// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:intern/modals/Gynecologie_Patient.dart';
import 'package:intern/modals/Gynecologie_Patient_Day.dart';
import 'package:intern/modals/patient.dart';
import '../modals/patient_Chirurgie_Thoracique.dart';
import '../modals/medecin.dart';
import '../modals/constantes_vitales.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> testing(String test) {
    return _db.collection('Test').doc(test).set({'hey': test});
  }

  Future<void> savePatient_Chirurgie_Thoracique(
      String medecin, Patient_Chirurgie_Thoracique patient, String service) {
    return _db
        .collection("services")
        .doc(service)
        .collection('$medecin - ${patient.nom}')
        .doc()
        .set(patient.toMap());
  }

  Future<void> savePatient_Gynecologie(
      String medecin, Gynecologie_Patient patient, String service) {
    return _db
        .collection("services")
        .doc(service)
        .collection(medecin)
        .doc('$medecin - ${patient.nom} ${patient.prenom}')
        .set(patient.toMap());
  }

  Future<void> saveStats_Gynecologie(
      String medecin,
      Gynecologie_Patient_Day patientStat,
      Gynecologie_Patient patient,
      String service,
      int hospitalisation) {
    String idState =
        "${hospitalisation.toString()} - ${patientStat.date.toString()}";
    return _db
        .collection("services")
        .doc(service)
        .collection(medecin)
        .doc('$medecin - ${patient.nom} ${patient.prenom}')
        .collection(hospitalisation.toString())
        .doc(patientStat.date.toString())
        .set(patientStat.toMap());
  }

  Stream<QuerySnapshot> getStats_Gynecologie(
    String medecin,
    String service,
    int hospitalisation,
    Gynecologie_Patient patient,
  ) {
    return _db
        .collection("services")
        .doc(service)
        .collection(medecin)
        .doc('$medecin - ${patient.nom} ${patient.prenom}')
        .collection(hospitalisation.toString())
        .orderBy('date', descending: true)
        .snapshots();
  }

  Future<void> savePatient(Patient patient) async {
    try {
      await _db.collection('patients')
        ..doc('${patient.dateNaissance} - ${patient.nom}')
            .get()
            .then((value) => {print("Patient existe deja")});
      return null;
    } catch (e) {
      return _db
          .collection('patients')
          .doc('${patient.dateNaissance} - ${patient.nom}')
          .set(patient.toMap());
    }
  }

  Future<void> getDoctorInfos(String email) {
    return _db.collection('medecins').doc(email).get();
  }

  Future<void> saveRegister(Medecin medecin) {
    return _db
        .collection("demandes_inscriptions")
        .doc('${medecin.email}-${medecin.nom_med}')
        .set(medecin.toMap());
  }

  Future<void> saveMedecin(Medecin medecin) {
    return _db
        .collection("medecins")
        .doc('${medecin.email}-${medecin.nom_med}')
        .set(medecin.toMap());
  }

  Stream<QuerySnapshot> getPatient_Specified_Doctor(
      String doctor, String service) {
    return _db
        .collection('services')
        .doc(service)
        .collection(doctor)
        .snapshots();
  }
}
