import 'package:flutter/material.dart';

class EnfantGyneco {
  String action;

  String? annee;
  String? sexe;
  String? poids;
  String? voie;
  String? tardivite;
  String? curete;
  EnfantGyneco(this.action, this.annee, this.sexe, this.poids, this.voie,
      this.tardivite, this.curete);

  Map<String, dynamic> toMap() {
    return {
      'action': action,
      'sexe': sexe,
      'dateNaissance': annee,
      'poids': poids,
      'voie': voie,
      'tardivite': tardivite,
      'curete': curete,
    };
  }

  EnfantGyneco.fromFirestore(Map<String, dynamic> firestore)
      : action = firestore['action'],
        sexe = firestore['sexe'],
        annee = firestore['dateNaissance'],
        poids = firestore['poids'],
        voie = firestore['voie'],
        tardivite = firestore['tardivite'],
        curete = firestore['curete'];
}
