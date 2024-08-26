import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase_functions.dart';
import '../models/user_model.dart';


class MyProvider extends ChangeNotifier {
  late User? firebaseUser;
  UserModel? userModel;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    userModel = await FirebaseFunctions.readUser();

    notifyListeners();
  }
}