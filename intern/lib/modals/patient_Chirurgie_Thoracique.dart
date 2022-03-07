import 'package:flutter/material.dart';

class Patient_Chirurgie_Thoracique {
  String id;
  String nom;
  DateTime dateNaissance;
  String salle;
  String sexe;
  String adresse;
  String etatcivil;
  String fonction;
  String fumeurDepuis;
  String paquets;
  DateTime? operation;

  List<String> habitudes;

  Map<String, DateTime> antchiru; // antécédents - chirurgicaux
  List<String> antmed; // antécédents - médicamentaux
  List<String> toxiques; // antécédents - toxiques
  String antfam; // antécédents - familiaux

  Patient_Chirurgie_Thoracique(
      this.id,
      this.nom,
      this.salle,
      this.sexe,
      this.adresse,
      this.etatcivil,
      this.fumeurDepuis,
      this.paquets,
      this.dateNaissance,
      this.fonction,
      this.operation,
      this.habitudes,
      this.antchiru,
      this.antmed,
      this.toxiques,
      this.antfam);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'salle': salle,
      'sexe': sexe,
      'dateNaissance': dateNaissance,
      'adresse': adresse,
      'etatcivil': etatcivil,
      'fonction': fonction,
      'operation': operation,
      'habitudes': habitudes,
      'antchiru': antchiru,
      'antmed': antmed,
      'toxiques': toxiques,
      'fumeurDepuis': fumeurDepuis,
      'paquets': paquets,
      'antfam': antfam,
    };
  }

  Patient_Chirurgie_Thoracique.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        nom = firestore['nom'],
        salle = firestore['salle'],
        sexe = firestore['sexe'],
        dateNaissance = firestore['dateNaissance'],
        adresse = firestore['adresse'],
        etatcivil = firestore['etatcivil'],
        fonction = firestore['fonction'],
        operation = firestore['operation'],
        habitudes = firestore['habitudes'],
        antchiru = firestore['antchiru'],
        antmed = firestore['antmed'],
        toxiques = firestore['toxiques'],
        fumeurDepuis = firestore['fumeurDepuis'],
        paquets = firestore['paquets'],
        antfam = firestore['antfam'];
}
