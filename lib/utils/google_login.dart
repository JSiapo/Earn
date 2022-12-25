import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:eran_by_saving/model/user_model.dart' as user_local;
import 'package:eran_by_saving/provider/user_provider.dart';

GoogleSignIn? googleSignIn = GoogleSignIn(
    // scopes: <String>[
    //   'email',
    //   'https://www.googleapis.com/auth/contacts.readonly',
    // ],
    );

Future<void> handleSignIn(
    GoogleSignIn? googleSignIn, UserProvider provider) async {
  try {
    if (googleSignIn == null) return;
    var userFirebase = await googleSignIn.signIn();
    if (userFirebase != null) {
      final googleAuth = await userFirebase.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final credentials = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
        await FirebaseAuth.instance.signInWithCredential(credentials);
        await provider.setUser(user_local.User(
          id: "",
          name: userFirebase.displayName ?? "",
          image: userFirebase.photoUrl ?? "",
          token: "",
          tokenExpiration: DateTime.now(),
          firebaseId: userFirebase.id,
        ));
      }
    }
  } on FirebaseException catch (e) {
    if (kDebugMode) {
      print("hay error");
      print(e);
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
