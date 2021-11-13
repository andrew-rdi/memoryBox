import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:memorybox/models/user_model.dart';
import 'package:memorybox/pages/splash_screen/splash_two.dart';
import 'package:memorybox/pages/login_page/login_page.dart';
import 'package:memorybox/pages/welcome_page/welcome_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const SplashScreen();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }

  Future signOut(context) async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false));
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }

  Future signInAnonymously() async {
    // try {
    //   UserCredential result = await FirebaseAuth.instance.signInAnonymously();
    //   User? user = result.user;
    //   return user;
    // } catch (e) {
    //   log(e.toString());
    //   return null;
    // }
  }

  Future deleteUser() async {}

  Future<void> userSetup(String displayName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    users.add({'displayName': displayName, 'uid': uid});
    return;
  }
}
