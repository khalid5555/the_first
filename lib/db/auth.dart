import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../shared/utils/app_theme.dart';
import '../models/user_model.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  // GoogleSignIn googleSignIn2 = GoogleSignIn();

  Future<UserCredential> signUp(String em, String pass) async {
    final authResult =
        await _auth.createUserWithEmailAndPassword(email: em, password: pass);
    return authResult;
  }

  Future<UserCredential> signIn(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<User> getUser() async {
    return _auth.currentUser!;
  }

  //////////////////////////////////////////////////////////////////////////////
  createUser(UserModel usr) {
    _firestore.collection(kUserCollection).doc(usr.id).set(usr.toMap());
  }

  Future<UserCredential> signInWithGoogle() async {
    // googleSignIn2.signIn();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    print('user$googleUser');
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }
}
