import 'package:firebase_core/firebase_core.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp();
}
