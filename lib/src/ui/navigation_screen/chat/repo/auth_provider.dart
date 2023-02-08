import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/chat/constants/firestore_constants.dart';

class AuthProvider extends ChangeNotifier {
  // final GoogleSignIn googleSignIn;
  final FirebaseFirestore firebaseFirestore;

  // final SharedPreferences prefs;

  // Status _status = Status.uninitialized;
  //
  // Status get status => _status;

  AuthProvider({required this.firebaseFirestore});

  String? getFirebaseUserId() {
    // return prefs.getString(FirestoreConstants.id);
    return userId;
  }

  Future<bool> isLoggedIn() async {
    bool isLoggedIn = false;
    // bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn
        // && prefs.getString(FirestoreConstants.id)?.isNotEmpty == true
        ) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> handleGoogleSignIn() async {
    notifyListeners();

    User? firebaseUser;

    if (firebaseUser != null) {
      final QuerySnapshot result = await firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
          .get();
      final List<DocumentSnapshot> document = result.docs;
      if (document.isEmpty) {
        firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .doc(firebaseUser.uid)
            .set({
          FirestoreConstants.displayName: firebaseUser.displayName,
          FirestoreConstants.photoUrl: firebaseUser.photoURL,
          FirestoreConstants.id: firebaseUser.uid,
          "createdAt: ": DateTime.now().millisecondsSinceEpoch.toString(),
          FirestoreConstants.chattingWith: null
        });
      }
    }
    return true;
  }
}
