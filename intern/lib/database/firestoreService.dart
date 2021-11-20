// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import 'package:firebase_core/firebase_core.dart';
import '../modals/patient.dart';
import '../modals/medecin.dart';
import '../modals/constantes_vitales.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> testing(String test) {
    return _db.collection('Test').doc(test).set({'hey': test});
  }

  Future<void> savePatient(String medecin, Patient patient) {
    return _db
        .collection("Patients")
        .doc('$medecin - ${patient.nom}')
        .set(patient.toMap());
  }
}
