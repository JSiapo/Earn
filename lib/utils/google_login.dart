import 'package:eran_by_saving/model/user_model.dart';
import 'package:eran_by_saving/provider/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn? googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> handleSignIn(
    GoogleSignIn? googleSignIn, UserProvider provider) async {
  try {
    if (googleSignIn == null) return;
    var userFirebase = await googleSignIn.signIn();
    if (userFirebase != null) {
      await provider.setUser(User(
        id: "",
        name: userFirebase.displayName ?? "",
        image: userFirebase.photoUrl ?? "",
        token: "",
        tokenExpiration: DateTime.now(),
        firebaseId: userFirebase.id,
      ));
    }
  } catch (error) {
    if (kDebugMode) {
      print("hay error");
      print(error);
    }
  }
}

Future<void> handleLogout(
    GoogleSignIn? googleSignIn, UserProvider provider) async {
  try {
    await googleSignIn!.disconnect();
    await provider.logout();
  } catch (error) {
    if (kDebugMode) {
      print("hay error");
      print(error);
    }
  }
}
