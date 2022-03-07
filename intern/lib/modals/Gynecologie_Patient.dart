import 'package:flutter/material.dart';
import 'package:intern/Components.dart';

class Gynecologie_Patient {
  String id;
  String nom;

  String prenom;
  String adresse;
  String age_patiente;
  String groupe_sanguin;

  DateTime dernieres_regles;
  int g;
  int p;
  int c;
  int a;
  List<dynamic> age_grossesse;
  List<dynamic> allergies;

  Map<String, dynamic> antchiru; // antécédents - chirurgicaux
  List<dynamic> antmedicamentaux; // antécédents - médicamentaux
  List<dynamic> antmedicaux; // antécédents - familiaux
  int age_marriage;
  int menarchie;
  bool contraception_orale;

  bool cosanguinite;
  bool hypofertilite;
  bool cycle;
  List<dynamic> liste_enfants;

  Gynecologie_Patient(
    this.id,
    this.nom,
    this.prenom,
    this.adresse,
    this.age_patiente,
    this.groupe_sanguin,
    this.dernieres_regles,
    this.age_grossesse,
    this.g,
    this.p,
    this.c,
    this.a,
    this.allergies,
    this.antchiru,
    this.antmedicamentaux,
    this.antmedicaux,
    this.age_marriage,
    this.menarchie,
    this.contraception_orale,
    this.cosanguinite,
    this.hypofertilite,
    this.cycle,
    this.liste_enfants,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'adresse': adresse,
      'age_patiente': age_patiente,
      'groupe_sanguin': groupe_sanguin,
      'dernieres_regles': dernieres_regles,
      'g': g,
      'p': p,
      'c': c,
      'a': a,
      'age_grossesse': age_grossesse,
      'allergies': allergies,
      'antchiru': antchiru,
      'antmedicamentaux': antmedicamentaux,
      'antmedicaux': antmedicaux,
      'age_marriage': age_marriage,
      'menarchie': menarchie,
      'contraception_orale': contraception_orale,
      'cosanguinite': cosanguinite,
      'hypofertilite': hypofertilite,
      'cycle': cycle,
      'liste_enfants': liste_enfants,
    };
  }

  Gynecologie_Patient.fromFirestore(dynamic firestore)
      : id = firestore['id'],
        nom = firestore['nom'],
        prenom = firestore['prenom'],
        adresse = firestore['adresse'],
        age_patiente = firestore['age_patiente'],
        groupe_sanguin = firestore['groupe_sanguin'],
        dernieres_regles = DateTime.fromMicrosecondsSinceEpoch(
            firestore['dernieres_regles'].microsecondsSinceEpoch),
        g = firestore['g'],
        p = firestore['p'],
        c = firestore['c'],
        a = firestore['a'],
        age_grossesse = firestore['age_grossesse'],
        allergies = firestore['allergies'],
        antchiru = firestore['antchiru'],
        antmedicamentaux = firestore['antmedicamentaux'],
        antmedicaux = firestore['antmedicaux'],
        age_marriage = firestore['age_marriage'],
        menarchie = firestore['menarchie'],
        contraception_orale = firestore['contraception_orale'],
        cosanguinite = firestore['cosanguinite'],
        hypofertilite = firestore['hypofertilite'],
        cycle = firestore['cycle'],
        liste_enfants = firestore['liste_enfants'];
}
