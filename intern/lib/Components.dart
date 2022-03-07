export 'constants.dart';
export 'Redirect.dart';
export './modals/medecin.dart';
export './modals/constantes_vitales.dart';
export 'modals/patient_Chirurgie_Thoracique.dart';
export './database/firestoreService.dart';
export './Widgets/Clipper.dart';
export './Widgets/Form_Widget.dart';

export './Widgets/Patient_Information_Widgets.dart';
export './Widgets/ImportantWidgets.dart';
export './Widgets/Patient-Day-Widgets.dart';
export 'modals/Patient.dart';
export 'modals/EnfantGyneco.dart';
export 'package:intern/screens/Services_Screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern/constants.dart';
import 'package:intern/database/firestoreService.dart';
import 'package:shared_preferences/shared_preferences.dart';
export 'screens/Components/Historique_Components.dart';
export 'screens/Gynecologie/Gynecologie_Patient_Informations.dart';

export 'screens/Gynecologie/Gynecologie_Historique_Courrant.dart';

final prefs = SharedPreferences.getInstance();
User? user = FirebaseAuth.instance.currentUser;
FirestoreService _firestoreService = FirestoreService();
dynamic medecinGlobal;
