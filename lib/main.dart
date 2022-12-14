import 'package:fhe_template/module/welcome/view/welcome_view.dart';
import 'package:fhe_template/setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initialize();

  Widget mainView = const WelcomeView();
  // if (FirebaseAuth.instance.currentUser != null) {
  //   mainView = Container();
  // }

  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: mainView,
    ),
  );
}
