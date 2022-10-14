import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeController extends GetxController {
  WelcomeView? view;

  doLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: userCredential");
      //TODO: on login success
      //------------------
      Get.to(const ProfileView());
    } catch (_) {}
  }

  addDataSample() async {
    var listData = [];
    for (var i = 0; i <= 10; i++) {
      listData.add("product $i");
    }

    await FirebaseFirestore.instance
        .collection("products")
        .add({"data": listData});
  }
}
